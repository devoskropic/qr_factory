import 'package:flutter/material.dart';

import 'package:qr_factory/business_logic/business_logic_imports.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SplashScreenCubit screenCubit = context.watch<SplashScreenCubit>();
    screenCubit.onReady(context);
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: GestureDetector(
        onTap: screenCubit.onScreenTap,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Image.asset('assets/images/logo207y.png', height: 230)],
          ),
        ),
      ),
    );
  }
}
