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

                this.display_device->notify.disconnect (device_notify);
                this.display_device = up_client.get_display_device ();
                this.display_device->notify.connect (device_notify);

                print_state ();
            });

            up_client.device_removed.connect ((device_path) => {
                devices.get (device_path).notify.disconnect (device_notify);
                devices.unset (device_path);

                this.display_device->notify.disconnect (device_notify);
                this.display_device = up_client.get_display_device ();
                this.display_device->notify.connect (device_notify);

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


            int percent = (int) (display_device->percentage + 0.5);
            string percent_string = display_device_valid ?
                                    percent.to_string () + "%" :
                                    "";

            string tooltip = "";
            foreach (Up.Device device in devices.values) {
                if (device.kind == Up.DeviceKind.LINE_POWER
                    || device.native_path == "BAT0") continue;
                tooltip += @"$(device.model) - $(device.percentage)%\\n";
            }
            // Remove last \n
            if (tooltip.length > 0) tooltip = tooltip.slice (0, -2);

            // Device level string
            string device_level = "";
            switch (display_device->state) {
                case Up.DeviceState.CHARGING:
                case Up.DeviceState.PENDING_CHARGE:
                    device_level = "charging-" + get_bat_percent (percent);
                    break;
                case Up.DeviceState.EMPTY:
                case Up.DeviceState.FULLY_CHARGED:
                case Up.DeviceState.DISCHARGING:
                case Up.DeviceState.PENDING_DISCHARGE:
                    device_level = get_bat_percent (percent);
                    break;
                default:
                    device_level = "missing";
                    break;
            }

            print ("{\"text\": \"%s\", \"alt\": \"%s\", \"tooltip\": \"%s\", \"class\": \"%s\"}\n",
                   percent_string,
                   device_level,
                   tooltip,
                   device_level);
        }

        string get_bat_percent (int percent) {
            if (percent < 10) {
                return "empty";
            } else if (percent < 40) {
                return "low";
            } else if (percent < 60) {
                return "half";
            } else if (percent < 90) {
                return "high";
            } else {
                return "full";
            }
        }
    }
}
