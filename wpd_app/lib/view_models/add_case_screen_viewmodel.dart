import 'dart:io';

import 'package:bot_toast/bot_toast.dart';
import 'package:cross_file/cross_file.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dio/dio.dart';
import 'package:wpd_app/api/http_client.dart';
import 'package:wpd_app/api/json_parsers/case_parser.dart';
import 'package:wpd_app/api/json_parsers/pdf_case_parser.dart';
import 'package:wpd_app/api/json_parsers/void_parser.dart';
import 'package:wpd_app/models/case/case.dart';
import 'package:wpd_app/models/custom_category/custom_category.dart';
import 'package:wpd_app/services/file_picker/file_picker_service.dart';
import 'package:wpd_app/services/service_locator.dart';
import 'package:wpd_app/ui/widgets/loader.dart';

abstract class AddCaseScreenViewModelProvider {
  static final provider = ChangeNotifierProvider.autoDispose(
    (ref) => AddCaseScreenViewModel(),
  );
}

class AddCaseScreenViewModel extends ChangeNotifier {
  final _requestRest = serviceLocator<RequestREST>();
  final _filePickerService = serviceLocator<FilePickerService>();

  bool _loading = false;
  bool _uploadFromDevice = true;
  XFile? _file;
  CustomCategory? _selectedCateogry;

  bool get isLoading => _loading;
  bool get uploadFromDevice => _uploadFromDevice;
  CustomCategory? get selectedCateogry => _selectedCateogry;
  XFile? get file => _file;

  void setUploadFromDevice(bool value, {bool notifyListener = true}) {
    _uploadFromDevice = value;
    if (notifyListener) {
      notifyListeners();
    }
  }

  set file(value) => _file = value;

  void selectedCategory(CustomCategory? category,
      {bool notifyListener = true}) {
    _selectedCateogry = category;

    if (notifyListener) {
      notifyListeners();
    }
  }

  Future<void> pickPDF() async {
    final file = await _filePickerService.pickPdfFile();

    _file = file;

    notifyListeners();
  }

  String? getFilePath() {
    var path = _file?.path.toString().split('/').last;

    if (Platform.isWindows) {
      path = _file?.path.toString().split('\\').last;
    }

    return path;
  }

  Future<Case?> submitCase(Case newCase) async {
    try {
      _loading = true;
      BotToast.showCustomLoading(
        toastBuilder: (_) => const AppLoader(),
      );

      final urlPdf = uploadFromDevice ? '' : newCase.urlPDF;

      final data = await _requestRest.executePost<Case>(
        '/cases',
        const CaseParser(),
        data: {
          'title': newCase.title,
          'description': newCase.description,
          'url': newCase.url,
          'urlPDF': urlPdf,
          'category': newCase.category.id,
        },
      );

      if (_file != null) {
        await _requestRest.uploadFile(
          '/cases/${data.id}/pdf',
          const PDFCaseParser(),
          file: _file!,
        );
      }
      HapticFeedback.lightImpact();
      BotToast.showText(text: 'Added ${newCase.title} case');

      _loading = false;
      BotToast.closeAllLoading();

      return data;
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

  Future<void> editCase(Case oldCase) async {
    try {
      _loading = true;
      BotToast.showCustomLoading(
        toastBuilder: (_) => const AppLoader(),
      );

      await _requestRest.executePut<void>(
        '/cases/${oldCase.id}',
        const VoidParser(),
        data: {
          'title': oldCase.title,
          'description': oldCase.description,
          'url': oldCase.url,
          'urlPDF': oldCase.urlPDF,
          'category': oldCase.category.id,
        },
      );

      if (_file != null && uploadFromDevice) {
        await _requestRest.uploadFile(
          '/cases/${oldCase.id}/pdf',
          const PDFCaseParser(),
          file: _file!,
        );
      }
      HapticFeedback.lightImpact();
      BotToast.showText(text: 'Edit ${oldCase.title} case');
      notifyListeners();
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
