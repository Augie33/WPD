import 'package:bot_toast/bot_toast.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wpd_app/api/http_client.dart';
import 'package:wpd_app/api/json_parsers/user_parser.dart';
import 'package:wpd_app/api/json_parsers/void_parser.dart';
import 'package:wpd_app/models/user/user.dart';
import 'package:wpd_app/services/qr/qr_service.dart';
import 'package:wpd_app/services/service_locator.dart';
import 'package:wpd_app/ui/widgets/loader.dart';

abstract class SingalAccountScreenViewModelProvider {
  static final provider = ChangeNotifierProvider(
    (ref) => SingalAccountScreenViewModel(),
  );
}

class SingalAccountScreenViewModel extends ChangeNotifier {
  final _requestRest = serviceLocator<RequestREST>();
  final _qrService = serviceLocator<QRService>();

  User? _user;

  bool _loading = false;
  bool get isLoading => _loading;
  User? get user => _user;

  Future<void> fetchUser({required String? userId}) async {
    try {
      _loading = true;

      var data = await _requestRest.executeGet<User>(
        '/users/$userId',
        const UserParser(),
      );

      _user = data;
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

  Future<void> removeAccount({required String? userId}) async {
    try {
      _loading = true;
      BotToast.showCustomLoading(
        toastBuilder: (_) => const AppLoader(),
      );

      await _requestRest.executeDelete<void>(
        '/users/$userId',
        const VoidParser(),
      );
      HapticFeedback.lightImpact();
      BotToast.showText(
        text: 'Deleted ${_user?.firstName} ${_user?.lastName}',
      );
      _user = null;
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

  Widget showQR() {
    return _qrService.generateQR(
      value: 'https://wichitapd.herokuapp.com/view/user/${_user?.id}',
      size: 200,
    );
  }
}
