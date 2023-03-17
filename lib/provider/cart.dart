import 'package:flutter/material.dart';
import 'package:medicine_app/Models/medicineModel.dart';

class Cart with ChangeNotifier {
  List SelctedProduct = [];
  double Price = 0;

  addPrdouct(MedicineModel Product) {
    SelctedProduct.add(Product);
    Price += Product.Price.round();

    notifyListeners();
  }

  RemoveProduct(MedicineModel Product) {
    SelctedProduct.remove(Product);
    Price -= Product.Price.round();

    notifyListeners();
  }
}
