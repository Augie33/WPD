import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wpd_app/models/case/case.dart';
import 'package:wpd_app/models/custom_category/custom_category.dart';

abstract class CartViewModelProvider {
  static final provider = ChangeNotifierProvider((ref) => CartViewModel());
}

class CartViewModel extends ChangeNotifier {
  List<Case> _myCart = [
    const Case(
      id: '23123',
      title: 'Test',
      caseNumber: 12312,
      category: CustomCategory(id: 'asdasd', title: 'customCat'),
      description: 'asdasdas',
      url: 'dsfsdf.g',
      urlPDF: 'google.com',
    ),
  ];

  List<Case> get myCart => _myCart;

  bool isMyCartEmpty() {
    if (_myCart.isEmpty) {
      return true;
    }

    return false;
  }

  void addCase(Case newCase) {
    _myCart.add(newCase);
    notifyListeners();
  }

  void removeCase(int index) {
    _myCart.removeAt(index);
    notifyListeners();
  }

  void resetMyCart() {
    _myCart = [];
    notifyListeners();
  }
}
