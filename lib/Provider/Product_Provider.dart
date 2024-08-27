import 'package:amalka/services/product_list_service.dart';
import 'package:flutter/material.dart';

import '../models/Product_Model.dart';

class ProductProvider extends ChangeNotifier {
  List<Products>? products = [];
  var isLoading = true;

  void fetchproduct() async {
    isLoading = true;

    products = await ProductService().fetchProduct();

    isLoading = false;
    notifyListeners();
  }
}
