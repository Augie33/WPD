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
import 'package:wpd_app/services/storage/storage_service.dart';

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
  final _storageService = serviceLocator<StorageService>();

  Case? _case;

  bool _inclueInfo = true;
  bool get inclueInfo => _inclueInfo;
  bool _inclueCaseNumber = true;
  bool get inclueCaseNumber => _inclueCaseNumber;
  bool _loading = false;
  bool get isLoading => _loading;
  Case? get myCase => _case;

  Future<void> fetchCase(
      {required String? caseId, bool notifyListener = true}) async {
    try {
      _loading = true;

      var data = await _requestRest.executeGet<Case>(
        '/cases/$caseId',
        const CaseParser(),
      );

      _case = data;

      _loading = false;
      if (notifyListener) {
        notifyListeners();
      }
    } on DioError catch (e) {
      BotToast.showText(text: e.message);

      _loading = false;
      notifyListeners();
    } catch (e) {
      BotToast.showText(text: 'Error');
      _loading = false;
      notifyListeners();
    }
  }

  void getDataFromStorage() {
    _inclueCaseNumber = _storageService.getData('InclueCaseNumber') ?? true;
    _inclueInfo = _storageService.getData('InclueInfo') ?? true;
  }

  void toggleInclueInfo(bool value) async {
    _inclueInfo = value;
    await _storageService.setData('InclueInfo', value);
    notifyListeners();
  }

  void toggleInclueCaseNumber(bool value) async {
    _inclueCaseNumber = value;

    await _storageService.setData('InclueCaseNumber', value);

    notifyListeners();
  }

  Widget showPDF() {
    if (_case == null) {
      return const SizedBox();
    }

    return _pdfService.showPDF(_case!.urlPDF);
  }

  Widget showQR({required String userId, String? cartId}) {
    if (_inclueInfo && _inclueCaseNumber) {
      if (cartId == null) {
        return const SizedBox();
      }

      return _qrService.generateQR(
        value: 'http://wichitapd.herokuapp.com/view/user-cart/$cartId/$userId',
        size: 300,
      );
    } else if (_inclueCaseNumber) {
      if (cartId == null) {
        return const SizedBox();
      }
      return _qrService.generateQR(
        value: 'http://wichitapd.herokuapp.com/view/cart/$cartId',
        size: 300,
      );
    } else if (_inclueInfo) {
      return _qrService.generateQR(
        value:
            'https://wichitapd.herokuapp.com/view/user-case/${_case?.id}/$userId',
        size: 300,
      );
    } else {
      return _qrService.generateQR(
        value: 'https://wichitapd.herokuapp.com/view/case/${_case?.id}',
        size: 300,
      );
    }
  }

  Future<void> shareCase({required String userId, String? cartId}) async {
    if (_inclueInfo && _inclueCaseNumber) {
      await _shareService.shareURL(
          url: 'http://wichitapd.herokuapp.com/view/user-cart/$cartId/$userId');
    } else if (_inclueCaseNumber) {
      await _shareService.shareURL(
          url: 'http://wichitapd.herokuapp.com/view/cart/$cartId');
    } else if (_inclueInfo) {
      await _shareService.shareURL(
          url:
              'https://wichitapd.herokuapp.com/view/user-case/${_case?.id}/$userId');
    } else {
      await _shareService.shareURL(
          url: 'https://wichitapd.herokuapp.com/view/case/${_case?.id}');
    }
  }
}
