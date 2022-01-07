using Gee;

namespace WaybarBatteryModule {

    public class Client {
        private Login1 login1;

        MainLoop loop = new MainLoop ();

        Up.Client up_client = new Up.Client ();
        HashMap<string, unowned Up.Device> devices = new HashMap<string, unowned Up.Device>();

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
                stdout.printf ("DEVICE ADDED! %s, type: %s\n",
                               device.get_object_path (),
                               Up.Device.kind_to_string (
                                   (Up.DeviceKind) device.kind));
            });

            up_client.device_removed.connect ((device_path) => {
                devices.get (device_path).notify.disconnect (device_notify);
                devices.unset (device_path);
                stdout.printf ("DEVICE REMVOED! %s\n", device_path);
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
        }

        // When anything updates (percentage, state, update-time, etc...)
        void device_notify (ParamSpec p) {
            stdout.printf ("CHANGED: %s\n", p.get_name ());
        }

        void print_state() {

        }
    }
}
