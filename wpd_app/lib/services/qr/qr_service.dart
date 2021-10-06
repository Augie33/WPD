import 'package:flutter/cupertino.dart';

abstract class QRService {
  Widget generateQR({required String value, double size});
}
