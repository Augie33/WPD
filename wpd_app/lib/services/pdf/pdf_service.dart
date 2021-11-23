import 'package:flutter/cupertino.dart';

abstract class PDFService {
  Widget showPDFUrl(String url);

  Widget showPDFAsset(String path);
}
