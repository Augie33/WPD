import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:native_pdf_view/native_pdf_view.dart';
import 'package:wpd_app/services/pdf/pdf_service.dart';

class PDFImpl implements PDFService {
  @override
  Widget showPDFUrl(String url) {
    return Platform.isIOS || Platform.isAndroid
        ? const PDF().cachedFromUrl(
            url,
            placeholder: (progress) => Center(
              child: Text('${progress.round()} %'),
            ),
            errorWidget: (error) => const Center(
              child: Icon(Icons.warning),
            ),
          )
        : const SizedBox();
  }

  @override
  Widget showPDFAsset(String path) {
    final pdfController = PdfController(
      document: PdfDocument.openAsset(path),
    );

    return PdfView(
      controller: pdfController,
    );
  }
}
