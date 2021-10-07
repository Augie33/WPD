import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dio/dio.dart';
import 'package:wpd_app/api/http_client.dart';
import 'package:wpd_app/api/json_parsers/case_parser.dart';
import 'package:wpd_app/models/case/case.dart';
import 'package:wpd_app/services/pdf/pdf_service.dart';
import 'package:wpd_app/services/qr/qr_service.dart';
import 'package:wpd_app/services/service_locator.dart';
import 'package:wpd_app/services/share/share_service.dart';

abstract class SingalCaseScreenViewModelProvider {
  static final provider = ChangeNotifierProvider(
    (ref) => SingalCaseScreenViewModel(),
  );
}

class SingalCaseScreenViewModel extends ChangeNotifier {
  final _requestRest = serviceLocator<RequestREST>();
  final _qrService = serviceLocator<QRService>();
  final _pdfService = serviceLocator<PDFService>();
  final _shareService = serviceLocator<ShareService>();

  Case? _case;

  bool _inclueInfo = false;
  bool get inclueInfo => _inclueInfo;
  bool _loading = false;
  bool get isLoading => _loading;
  Case? get myCase => _case;

  Future<void> fetchCase({required String? caseId}) async {
    try {
      _loading = true;

      var data = await _requestRest.executeGet<Case>(
        '/cases/$caseId',
        const CaseParser(),
      );

      _case = data;

      _loading = false;
      notifyListeners();
    } on DioError catch (e) {
      BotToast.showText(text: e.message);

      print(e.message);

      _loading = false;
      notifyListeners();
    } catch (e) {
      BotToast.showText(text: 'Error');
      _loading = false;
      notifyListeners();
    }
  }

  void toggleInclueInfo(bool value) {
    _inclueInfo = value;
    print(_inclueInfo);
    notifyListeners();
  }

  Widget showPDF() {
    if (_case == null) {
      return const SizedBox();
    }

    return _pdfService.showPDF(_case!.urlPDF);
  }

  Widget showQR() {
    // TODO: ADD URL (include your info or not)
    if (_inclueInfo) {
      return _qrService.generateQR(
          value: 'https://andrewducnguyen.dev/user_case', size: 300);
    } else {
      return _qrService.generateQR(
          value: 'https://andrewducnguyen.dev/cases2', size: 300);
    }
  }

  Future<void> shareCase() async {
    // TODO: ADD URL (include your info or not)
    await _shareService.shareURL(url: 'https://www.google.com');
  }
}
