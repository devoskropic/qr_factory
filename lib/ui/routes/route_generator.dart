import 'package:flutter/material.dart';
import 'package:qr_factory/business_logic/business_logic_imports.dart';
import 'package:qr_factory/ui/screen_imports.dart';
import 'route_names.dart';

class RouteGenerator {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.initialRoute:
        return MaterialPageRoute(
          builder: (context) {
            return BlocProvider<SplashScreenCubit>(
              create: (context) => SplashScreenCubit(),
              child: const SplashScreen(),
            );
          },
        );
      case RouteNames.homeScreenRoute:
        return MaterialPageRoute(
          builder: (context) {
            return BlocProvider<QrCodeBloc>(
              create: (context) => QrCodeBloc(),
              child: const QrHome(),
            );
          },
        );
      default:
        return null;
    }
  }
}
