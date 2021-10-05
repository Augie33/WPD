import 'package:flutter/cupertino.dart';

abstract class QrService {
  Widget generateQR({required String value, double size});
}
