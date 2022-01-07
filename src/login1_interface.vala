namespace WaybarBatteryModule {
    [DBus (name = "org.freedesktop.login1.Manager", timeout = 120000)]
    public interface Login1 : Object {
        [DBus (name = "PrepareForSleep")]
        public signal void prepare_for_sleep (bool sleeping);
    }
}
