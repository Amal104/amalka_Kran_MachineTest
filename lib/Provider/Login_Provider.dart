import 'package:amalka/services/product_list_service.dart';
import 'package:flutter/material.dart';

class LoginProvider extends ChangeNotifier {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  void login() async {
    await ProductService().LoginService(username.text, password.text);
  }
}
