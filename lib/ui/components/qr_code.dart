import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'dart:io';

class QrCode {
  QrImage myQR({required String url}) {
    return QrImage(
      size: 220.0,
      version: QrVersions.auto,
      padding: const EdgeInsets.all(15.0),
      // semanticsLabel: 'Test QR',
      backgroundColor: Colors.brown.shade300,
      data: url,
      dataModuleStyle: const QrDataModuleStyle(
        color: Colors.black,
        dataModuleShape: QrDataModuleShape.circle,
      ),
      eyeStyle: const QrEyeStyle(
        eyeShape: QrEyeShape.square,
        color: Colors.black,
      ),
      errorStateBuilder: (ctx, err) {
        return const Center(
          child: Text(
            "Algo salió mal...",
            textAlign: TextAlign.center,
          ),
        );
      },
      constrainErrorBounds: true,
      errorCorrectionLevel: QrErrorCorrectLevel.H,
    );
  }

  QrImage imgUrlQR({required String url, required String imgUrl}) {
    return QrImage(
      size: 220.0,
      version: QrVersions.auto,
      padding: const EdgeInsets.all(15.0),
      backgroundColor: Colors.brown.shade300,
      embeddedImage: NetworkImage(imgUrl, scale: BorderSide.strokeAlignCenter),
      embeddedImageStyle: QrEmbeddedImageStyle(
        size: const Size(90, 90),
        color: Colors.transparent,
      ),
      data: url,
      dataModuleStyle: const QrDataModuleStyle(
        color: Colors.black,
        dataModuleShape: QrDataModuleShape.circle,
      ),
      eyeStyle: const QrEyeStyle(
        eyeShape: QrEyeShape.square,
        color: Colors.black,
      ),
      errorStateBuilder: (ctx, err) {
        return const Center(
          child: Text(
            "Algo salió mal...",
            textAlign: TextAlign.center,
          ),
        );
      },
      constrainErrorBounds: true,
      errorCorrectionLevel: QrErrorCorrectLevel.H,
    );
  }

  QrImage imgFileQR({required String url, required File imgFile}) {
    return QrImage(
      size: 220.0,
      version: QrVersions.auto,
      padding: const EdgeInsets.all(15.0),
      backgroundColor: Colors.brown.shade300,
      embeddedImage: FileImage(imgFile),
      embeddedImageStyle: QrEmbeddedImageStyle(
        size: const Size(90, 90),
        color: Colors.transparent,
      ),
      data: url,
      dataModuleStyle: const QrDataModuleStyle(
        color: Colors.black,
        dataModuleShape: QrDataModuleShape.circle,
      ),
      eyeStyle: const QrEyeStyle(
        eyeShape: QrEyeShape.square,
        color: Colors.black,
      ),
      errorStateBuilder: (ctx, err) {
        return const Center(
          child: Text(
            "Algo salió mal...",
            textAlign: TextAlign.center,
          ),
        );
      },
      constrainErrorBounds: true,
      errorCorrectionLevel: QrErrorCorrectLevel.H,
    );
  }
}
