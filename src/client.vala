namespace WaybarBatteryModule {
    public class Client {
        private Login1 login1;

        MainLoop loop = new MainLoop ();

        Up.Client up_client = new Up.Client ();
        HashTable<string, unowned Up.Device> devices =
            new HashTable<string, unowned Up.Device>(str_hash, str_equal);
        Up.Device * display_device = new Up.Device ();

        public Client (Login1 login1) {
            this.login1 = login1;

            // Watch suspend state
            login1.prepare_for_sleep.connect ((sleeping) => {
                if (sleeping) return;
                // Waking up from sleep
                reset_devices ();
            });

            up_client.device_added.connect (this.add_device);
            up_client.device_removed.connect ((d) => this.remove_device (d));

            reset_devices ();

            loop.run ();
        }

        void remove_device (string device_path, bool remove = true) {
            if (remove) {
                if (!devices.contains (device_path)) return;

                unowned Up.Device ? device = devices.get (device_path);
                if (device != null) {
                    device.notify.disconnect (device_notify);
                }
                devices.remove (device_path);
            }

            this.display_device->notify.disconnect (device_notify);
            this.display_device = up_client.get_display_device ();
            this.display_device->notify.connect (device_notify);

            print_state ();
        }

        void add_device (Up.Device device) {
            devices.set (device.get_object_path (), device);
            device.notify.connect (device_notify);

            this.display_device->notify.disconnect (device_notify);
            this.display_device = up_client.get_display_device ();
            this.display_device->notify.connect (device_notify);

            print_state ();
        }

        /** Removes all devices and adds the current devices */
        void reset_devices () {
            devices.foreach_remove ((device_path, device) => {
                this.remove_device (device_path, false);
                return true;
            });
            // Add all devices
            foreach (Up.Device device in up_client.get_devices ()) {
                this.add_device (device);
            }

            print_state ();
        }

        /** When anything updates (percentage, state, update-time, etc...) */
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
            foreach (unowned Up.Device device in devices.get_values ()) {
                if (device == null
                    || device.kind == Up.DeviceKind.LINE_POWER
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
