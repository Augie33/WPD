import 'package:bot_toast/bot_toast.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wpd_app/api/http_client.dart';
import 'package:wpd_app/api/json_parsers/auth_parser.dart';
import 'package:wpd_app/models/auth/auth.dart';
import 'package:wpd_app/models/user/user.dart';
import 'package:wpd_app/services/secure_storage/secure_storage_service.dart';
import 'package:wpd_app/services/service_locator.dart';

abstract class AuthStateViewModelProvider {
  static final provider = ChangeNotifierProvider((ref) => AuthStateViewModel());
}

class AuthStateViewModel extends ChangeNotifier {
  final _scureStorageService = serviceLocator<ScureStorageService>();
  final _requestRest = serviceLocator<RequestREST>();

  bool _splashing = true;
  User? _myUser;
  bool _loading = false;
  bool _loggedIn = false;

  bool get splashing => _splashing;
  User? get myUser => _myUser;
  bool get isLoading => _loading;
  bool get isLoggedIn => _loggedIn;

  set splashing(bool value) {
    _splashing = value;
    notifyListeners();
  }

  void setUpWithToken(User? user) {
    _myUser = user;
    _loggedIn = true;
  }

  Future<void> login(
    BuildContext context,
    String email,
    String password,
  ) async {
    try {
      _loading = true;
      notifyListeners();
      var data = await _requestRest
          .executePost<Auth>('/auth/login', const AuthParser(), data: {
        'email': email,
        'password': password,
      });

      if (!data.success) {
        _loggedIn = false;

        BotToast.showText(text: 'Please, type correct email & password');
      }

      _myUser = data.user;

      // save the token inside scure storage if the user use mobile (iOS/Android)
      if (!kIsWeb) {
        await _scureStorageService.setToken(data.token);
      }

      // set the token header
      _requestRest.setUpToken(data.token);

      BotToast.showText(text: 'Success');
      // nav
      _loggedIn = true;
      _loading = false;
      notifyListeners();
    } on DioError catch (e) {
      BotToast.showText(text: e.message);

      if (e.response?.statusCode == 401) {
        BotToast.showText(text: 'Please, type correct email & password');
      }
      _loading = false;
      notifyListeners();
    } catch (e) {
      BotToast.showText(text: 'Error');
      _loading = false;
      notifyListeners();
    }
  }
}
