import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wpd_app/api/http_client.dart';
import 'package:wpd_app/services/service_locator.dart';

abstract class AddCaseScreenViewModelProvider {
  static final provider = ChangeNotifierProvider(
    (ref) => AddCaseScreenViewModel(),
  );
}

class AddCaseScreenViewModel extends ChangeNotifier {
  final _requestRest = serviceLocator<RequestREST>();

  bool _loading = false;
  bool get isLoading => _loading;
}
