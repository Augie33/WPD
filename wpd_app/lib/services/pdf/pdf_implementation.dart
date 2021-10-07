import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:wpd_app/services/pdf/pdf_service.dart';

class PDFImpl implements PDFService {
  @override
  Widget showPDF(String url) {
    return kIsWeb
        ? const SizedBox()
        : const PDF().cachedFromUrl(
            url,
            placeholder: (progress) => Center(
              child: Text('${progress.round()} %'),
            ),
            errorWidget: (error) => const Center(
              child: Icon(Icons.warning),
            ),
          );
  }
}
