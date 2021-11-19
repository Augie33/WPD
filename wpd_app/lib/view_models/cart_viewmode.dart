import 'package:bot_toast/bot_toast.dart';
import 'package:dio_http/dio_http.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wpd_app/api/http_client.dart';
import 'package:wpd_app/api/json_parsers/cart_parser.dart';
import 'package:wpd_app/models/cart/cart.dart';
import 'package:wpd_app/models/case/case.dart';
import 'package:wpd_app/services/service_locator.dart';
import 'package:wpd_app/ui/widgets/case_number_field.dart';
import 'package:wpd_app/ui/widgets/custom_form_field.dart';
import 'package:wpd_app/ui/widgets/loader.dart';

abstract class CartViewModelProvider {
  static final provider = ChangeNotifierProvider((ref) => CartViewModel());
}

class CartViewModel extends ChangeNotifier {
  final _requestRest = serviceLocator<RequestREST>();

  List<Case> _myCart = [];
  List<Case> get myCart => _myCart;

  bool _loading = false;
  bool get isLoading => _loading;

  Cart? cartResult;

  String? caseNumber;

  bool isMyCartEmpty() {
    if (_myCart.isEmpty) {
      return true;
    }

    return false;
  }

  void addCase(Case newCase) {
    if (_myCart.contains(newCase)) {
      BotToast.showText(text: 'You already added ${newCase.title}');
      return;
    }

    _myCart.add(newCase);
    HapticFeedback.lightImpact();
    notifyListeners();
  }

  void removeCase(int index) {
    _myCart.removeAt(index);
    notifyListeners();
    HapticFeedback.lightImpact();
  }

  void resetMyCart() {
    _myCart = [];
    notifyListeners();
    HapticFeedback.lightImpact();
    BotToast.showText(text: 'Reseted your Cart');
  }

  Future<Cart?> createCart({required String userId}) async {
    try {
      _loading = true;
      BotToast.showCustomLoading(
        toastBuilder: (_) => const AppLoader(),
      );
      final List<String> casesIds = [];

      for (var value in _myCart) {
        casesIds.add(value.id);
      }

      final cart = await _requestRest.executePost<Cart>(
        '/cart',
        const CartParser(),
        data: {
          'caseNumber': caseNumber ?? '',
          'cases': casesIds,
        },
      );

      cartResult = cart;
      HapticFeedback.lightImpact();
      BotToast.showText(
        text: 'Created the case',
      );

      _loading = false;
      BotToast.closeAllLoading();
      return cart;
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

  void showQRCart(BuildContext context, TextEditingController titleController) {
    showCaseNumberDialog(context);
  }

  void shareCart(BuildContext context, TextEditingController titleController) {
    showCaseNumberDialog(context);
  }

  Future<bool?> showCaseNumberDialog(BuildContext context) async {
    final value = await showDialog<bool>(
        context: context,
        builder: (context) {
          return const CaseNumberField();
        });

    return value;
  }
}
