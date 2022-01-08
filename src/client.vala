using Gee;

namespace WaybarBatteryModule {

    public class Client {
        private Login1 login1;

        MainLoop loop = new MainLoop ();

        Up.Client up_client = new Up.Client ();
        HashMap<string, unowned Up.Device> devices = new HashMap<string, unowned Up.Device>();
        Up.Device * display_device = new Up.Device ();

        public Client (Login1 login1) {
            this.login1 = login1;

            // Watch suspend state
            login1.prepare_for_sleep.connect ((sleeping) => {
                if (sleeping) return;
                // Waking up from sleep
                reset_devices ();
            });

            up_client.device_added.connect ((device) => {
                devices.set (device.get_object_path (), device);
                device.notify.connect (device_notify);

                this.display_device = up_client.get_display_device ();

                print_state ();
            });

            up_client.device_removed.connect ((device_path) => {
                devices.get (device_path).notify.disconnect (device_notify);
                devices.unset (device_path);

                this.display_device = up_client.get_display_device ();

                print_state ();
            });

            reset_devices ();

            loop.run ();
        }

        void reset_devices () {
            foreach (string device_path in devices.keys) {
                up_client.device_removed (device_path);
            }
            // Add all devices
            foreach (Up.Device device in up_client.get_devices ()) {
                up_client.device_added (device);
            }

            print_state ();
        }

        // When anything updates (percentage, state, update-time, etc...)
        void device_notify (Object device, ParamSpec p) {
            print_state ();
        }

        void print_state () {
            bool display_device_valid =
                this.display_device->kind == Up.DeviceKind.BATTERY ||
                this.display_device->kind == Up.DeviceKind.UPS;

            double percent = display_device->percentage;
            percent += 0.5;
            string percent_string = display_device_valid ?
                                    ((int) percent).to_string () + "%" :
                                    "";

            string tooltip = "";
            foreach (Up.Device device in devices.values) {
                if (device.kind == Up.DeviceKind.LINE_POWER) continue;
                tooltip += @"$(device.model) - $(device.percentage)%\\n";
            }
            // Remove last \n
            tooltip = tooltip.slice (0, -2);

            // Device level string
            Up.DeviceLevel level = (Up.DeviceLevel) display_device->battery_level;
            if (!display_device_valid || level == Up.DeviceLevel.UNKNOWN) {
                level = Up.DeviceLevel.NONE;
            }
            string device_level = Up.Device.level_to_string (level);

            print ("{\"text\": \"%s\", \"alt\": \"%s\", \"tooltip\": \"%s\", \"class\": \"%s\"}\n",
                   percent_string,
                   device_level,
                   tooltip,
                   device_level);
        }
    }
}
