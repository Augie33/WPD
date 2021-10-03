import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wpd_app/api/http_client.dart';
import 'package:wpd_app/api/json_parsers/case_list_parser.dart';
import 'package:wpd_app/models/case/case.dart';
import 'package:wpd_app/services/service_locator.dart';

abstract class SearchScreenViewModelProvider {
  static final provider =
      ChangeNotifierProvider((ref) => SearchCaseViewModel());
}

class SearchCaseViewModel extends ChangeNotifier {
  final _requestRest = serviceLocator<RequestREST>();

  List<Case> myCases = [];

  bool _loading = false;
  bool get isLoading => _loading;

  Future<void> searchCases(String search) async {
    _loading = true;
    notifyListeners();

    var data = await _requestRest.executeGet<List<Case>>(
      '/cases?sort=title&all=$search',
      const CaseListParser(),
    );

    myCases = data;
    _loading = false;
    notifyListeners();
  }
}
