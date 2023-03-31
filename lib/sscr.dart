// Old splash screen view

import 'dart:async';
import 'package:flutter/material.dart';
// import 'package:qr_factory/ui/qr_screen.dart';
import 'package:qr_factory/ui/screens/qr_home/qr_home.dart';

class Sscr extends StatefulWidget {
  const Sscr({Key? key}) : super(key: key);

  @override
  State<Sscr> createState() => _SscrState();
}

class _SscrState extends State<Sscr> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      debugPrint('Takin\' 2 seconds');
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (BuildContext context) => const QrHome(),
        ),
      );
    });
    // Timer(const Duration(milliseconds: 3000), () {
    //   debugPrint('Takin\' 3 seconds');
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/logo207y.png', height: 230),
            const Text(
              'Iniciando...',
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
