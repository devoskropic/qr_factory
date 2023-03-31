import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_factory/ui/routes/route_names.dart';
// import 'package:equatable/equatable.dart';

part 'splash_screen_state.dart';

class SplashScreenCubit extends Cubit<SplashScreenState> {
  SplashScreenCubit() : super(SplashScreenState());

  int _seconds = 0;

  void onReady(BuildContext context) {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      _seconds += 1;
      if (_seconds == 3) {
        timer.cancel();
        Navigator.pushNamedAndRemoveUntil(
          context,
          RouteNames.rHomeScreenRoute,
          (page) => false,
        );
      }
    });
  }

  void onScreenTap() {
    _seconds = 2;
  }
}
