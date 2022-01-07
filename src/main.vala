namespace WaybarBatteryModule {
    public int main (string[] args) {
        try {
            Login1 ? login1 = Bus.get_proxy_sync (
                BusType.SYSTEM,
                "org.freedesktop.login1",
                "/org/freedesktop/login1");
            if (login1 == null) {
                stderr.printf ("Could not connect to login1 service...\n");
                return 1;
            }

            new Client (login1);
        } catch (Error e) {
            stderr.printf ("Could not connect to login1 service...\n");
            return 1;
        }
        return 0;
    }
}
