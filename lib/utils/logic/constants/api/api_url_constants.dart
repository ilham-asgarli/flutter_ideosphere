class ApiUrlConstants {
  //static const String base = "https://www.api.ideosphere.com.tr/v1/";
  static const String base = "http://172.16.0.90:3000/v1/";
  //static const String base = "http://10.0.2.2:3000/v1/";

  //static const String wsBase = "ws://api.ideosphere.com.tr/v1/";
  static const String wsBase = "ws://172.16.0.90:3000/v1/";
  //static const String wsBase = "ws://10.0.2.2:3000/v1/";

  //static const String wssBase = "wss://api.ideosphere.com.tr/v1/";
  static const String wssBase = "wss://172.16.0.90:3000/v1/";
  //static const String wssBase = "wss://10.0.2.2:3000/v1/";

  static const String socket = "${wsBase}socket";

  static const String auth = "${base}auth/";
  static const String events = "${base}events/";

  static const String checkEmail = "${auth}check-email";
  static const String signUp = "${auth}sign-up";
  static const String signIn = "${auth}sign-in";

  static const String geocodingBaseUrl =
      "https://maps.googleapis.com/maps/api/geocode/json";
}
