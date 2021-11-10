import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wpd_app/models/case/case.dart';
import 'package:wpd_app/models/custom_category/custom_category.dart';

abstract class CartViewModelProvider {
  static final provider = ChangeNotifierProvider((ref) => CartViewModel());
}

class CartViewModel extends ChangeNotifier {
  List<Case> _myCart = [];

  List<Case> get myCart => _myCart;

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
}
