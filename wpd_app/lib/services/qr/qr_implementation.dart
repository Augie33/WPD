import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';
import 'package:wpd_app/services/qr/qr.dart';

class QrImpl1 implements QrService {
  @override
  Widget generateQR({required String value, double size = 200}) {
    return PrettyQr(
      image: const AssetImage('assets/logo.png'),
      elementColor: Colors.yellow.shade800,
      typeNumber: 3,
      size: size,
      data: value,
      errorCorrectLevel: QrErrorCorrectLevel.M,
      roundEdges: true,
    );
  }
}

class QrImpl2 implements QrService {
  @override
  Widget generateQR({required String value, double size = 200}) {
    return QrImage(
      data: value,
      foregroundColor: Colors.yellow.shade800,
      version: QrVersions.auto,
      size: size,
    );
  }
}
