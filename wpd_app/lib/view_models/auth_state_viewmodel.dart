import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wpd_app/api/http_client.dart';
import 'package:wpd_app/api/json_parsers/auth_parser.dart';
import 'package:wpd_app/models/auth/auth.dart';
import 'package:wpd_app/services/secure_storage/secure_storage_service.dart';
import 'package:wpd_app/services/service_locator.dart';

abstract class AuthStateViewModelProvider {
  static final provider = ChangeNotifierProvider((ref) => AuthStateViewModel());
}

class AuthStateViewModel extends ChangeNotifier {
  final _scureStorageService = serviceLocator<ScureStorageService>();
  final _requestRest = serviceLocator<RequestREST>();

  bool _loading = false;
  bool _loggedIn = false;

  bool get isLoading => _loading;
  bool get isLoggedIn => _loggedIn;

  Future<void> login(String email, String password) async {
    _loading = true;
    notifyListeners();

    try {
      _loading = true;
      notifyListeners();

      var data = await _requestRest
          .executePost<Auth>('/auth/login', const AuthParser(), data: {
        'email': email,
        'password': password,
      });

      print(data);

      await Future.delayed(const Duration(seconds: 2));
      _loggedIn = true;

      // if (data.success && data.user.role == 'provider') {
      // await _scureStorageService.setToken(data.token);
      // await _requestRest.setTokenInRest();

      // setUser(data.user);

      // // Check if user has provider, if not it will push him to no provider page
      // final provider = await getProvider();
      // if (provider == null) {
      //   return Modular.to.pushReplacementNamed('/no_provider');
      // }

      // setProvider(provider);
      // return Modular.to.pushReplacementNamed('/home');
      // } else {
      // BotToast.showText(
      //   text: 'Please, check your email',
      // );
      // }
    } catch (e) {
      print(e);
    }

    _loading = false;
    notifyListeners();
  }
}
