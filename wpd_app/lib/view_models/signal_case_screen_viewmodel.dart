import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dio/dio.dart';
import 'package:wpd_app/api/http_client.dart';
import 'package:wpd_app/api/json_parsers/case_parser.dart';
import 'package:wpd_app/models/case/case.dart';
import 'package:wpd_app/services/service_locator.dart';

abstract class SingalCaseScreenViewModelProvider {
  static final provider = ChangeNotifierProvider(
    (ref) => SingalCaseScreenViewModel(),
  );
}

class SingalCaseScreenViewModel extends ChangeNotifier {
  final _requestRest = serviceLocator<RequestREST>();

  Case? _case;

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
}
