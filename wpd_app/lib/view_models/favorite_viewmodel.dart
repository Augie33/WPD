import 'package:bot_toast/bot_toast.dart';
import 'package:dio_http/dio_http.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wpd_app/api/http_client.dart';
import 'package:wpd_app/api/json_parsers/favorite_parser.dart';
import 'package:wpd_app/models/case/case.dart';
import 'package:wpd_app/models/favorite/favorite.dart';
import 'package:wpd_app/services/service_locator.dart';

abstract class FavoriteViewModelProvider {
  static final provider = ChangeNotifierProvider(
    (ref) => FavoriteViewModel(),
  );
}

class FavoriteViewModel extends ChangeNotifier {
  final _requestRest = serviceLocator<RequestREST>();

  Favorite _favorite = const Favorite(id: '0', cases: []);

  bool _loading = false;
  bool get isLoading => _loading;
  Favorite get favorite => _favorite;

  Future<void> getFavorite({bool refresh = false}) async {
    try {
      _loading = true;
      if (refresh == true) {
        notifyListeners();
      }
      _favorite = await _requestRest.executeGet<Favorite>(
        '/favorite',
        const FavoriteParser(),
      );
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

  Future<void> favoriteCase(String caseId) async {
    try {
      _loading = true;
      notifyListeners();

      _favorite = await _requestRest.executePost<Favorite>(
        '/favorite/$caseId',
        const FavoriteParser(),
      );
      HapticFeedback.lightImpact();
      BotToast.showText(text: 'Favorite case');
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

  Future<void> unFavoriteCase(String caseId) async {
    try {
      _loading = true;
      notifyListeners();

      _favorite = await _requestRest.executeDelete<Favorite>(
        '/favorite/$caseId',
        const FavoriteParser(),
      );
      HapticFeedback.lightImpact();
      BotToast.showText(text: 'Unfavorite case');
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

  bool checkCase(Case myCase) {
    if (_favorite.cases.contains(myCase)) {
      return true;
    }

    return false;
  }
}
