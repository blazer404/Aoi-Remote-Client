abstract class DeviceSettingsInterface {
  Future<void> setPrefs(String name, String ip, String port, String token) async {}

  void getName() {}

  void getIp() {}

  void getPort() {}

  void getToken() {}
}
