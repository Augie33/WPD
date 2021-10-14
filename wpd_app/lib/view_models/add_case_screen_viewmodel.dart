import 'dart:io';

import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dio/dio.dart';
import 'package:wpd_app/api/http_client.dart';
import 'package:wpd_app/api/json_parsers/case_parser.dart';
import 'package:wpd_app/models/case/case.dart';
import 'package:wpd_app/services/file_picker/file_picker_service.dart';
import 'package:wpd_app/services/service_locator.dart';
import 'package:wpd_app/ui/widgets/loader.dart';

abstract class AddCaseScreenViewModelProvider {
  static final provider = ChangeNotifierProvider(
    (ref) => AddCaseScreenViewModel(),
  );
}

class AddCaseScreenViewModel extends ChangeNotifier {
  final _requestRest = serviceLocator<RequestREST>();
  final _filePickerService = serviceLocator<FilePickerService>();

  bool _loading = false;
  bool _uploadFromDevice = false;
  File? _file;

  bool get isLoading => _loading;
  bool get uploadFromDevice => _uploadFromDevice;
  File? get file => _file;

  set uploadFromDevice(value) {
    _uploadFromDevice = value;
    notifyListeners();
  }

  Future<void> pickPDF() async {
    final file = await _filePickerService.pickPdfFile();

    _file = file;

    notifyListeners();
  }

  Future<void> submitCase(Case newCase) async {
    try {
      _loading = true;
      BotToast.showCustomLoading(
        toastBuilder: (_) => const AppLoader(),
      );

      final urlPdf = uploadFromDevice ? '' : newCase.urlPDF;

      await _requestRest.executePost<Case>(
        '/cases',
        const CaseParser(),
        data: {
          'title': newCase.title,
          'description': newCase.description,
          'url': newCase.url,
          'urlPDF': urlPdf,
        },
      );

      // if (_file != null) {
      //   await _requestRest.uploadFile(
      //     '/cases/${myCase.id}/pdf',
      //     file: _file!,
      //   );
      // }

      BotToast.showText(text: 'Added ${newCase.title} case');

      _loading = false;
      BotToast.closeAllLoading();
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
}
