import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wpd_app/services/pdf/pdf_service.dart';

import 'package:wpd_app/services/service_locator.dart';

abstract class HelpScreenViewModelProvider {
  static final provider = ChangeNotifierProvider(
    (ref) => HelpScreenViewModel(),
  );
}

class HelpScreenViewModel extends ChangeNotifier {
  final _pdfService = serviceLocator<PDFService>();

  Widget showPdf() {
    if (Platform.isAndroid || Platform.isIOS) {
      return _pdfService.showPDFAsset('assets/manual.pdf');
    }

    return const SizedBox();
  }
}
