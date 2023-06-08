class RouteNames {
  RouteNames._constructor();
  static final RouteNames _instance = RouteNames._constructor();

  static const String initialRoute = "/";
  static const String homeScreenRoute = "/Qr_Home";

  factory RouteNames() {
    return _instance;
  }
}
