import 'package:bot_toast/bot_toast.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wpd_app/api/http_client.dart';
import 'package:wpd_app/api/json_parsers/user_list_parser.dart';
import 'package:wpd_app/models/user/user.dart';
import 'package:wpd_app/services/service_locator.dart';

abstract class ShowAccountsScreenViewModelProvider {
  static final provider = ChangeNotifierProvider(
    (ref) => ShowAccountsScreenViewModel(),
  );
}

class ShowAccountsScreenViewModel extends ChangeNotifier {
  final _requestRest = serviceLocator<RequestREST>();

  List<User> accounts = [];

  bool _loading = false;
  bool get isLoading => _loading;

  Future<void> getUsers({bool refresh = false}) async {
    try {
      _loading = true;

      if (refresh == true) {
        notifyListeners();
      }

      var data = await _requestRest.executeGet<List<User>>(
        '/users?limit=1000',
        const UserListParser(),
      );

      accounts = data;
      _loading = false;
      notifyListeners();
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
