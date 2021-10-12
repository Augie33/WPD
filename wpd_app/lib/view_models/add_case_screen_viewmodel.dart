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
  bool get isLoading => _loading;
  File? _file;
  File? get file => _file;

  Future<void> pickPDF() async {
    final file = await _filePickerService.pickPdfFile();

    _file = file;

    if (_file != null) {
      await _requestRest.uploadFile(
        '/cases/615d241925f8394b4b0dfcab/pdf',
        file: _file!,
      );
    }

    notifyListeners();
  }

  Future<void> submitCase(Case newCase) async {
    try {
      _loading = true;
      BotToast.showCustomLoading(
        toastBuilder: (_) => const AppLoader(),
      );

      await _requestRest.executePost<Case>(
        '/cases',
        const CaseParser(),
        data: {
          'title': newCase.title,
          'description': newCase.description,
          'url': newCase.url,
          'urlPDF':
              'https://www.wichita.gov/WPD/Investigations/Documents/Theft%20Victims%20Packet%20PDF.pdf'
        },
      );

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
