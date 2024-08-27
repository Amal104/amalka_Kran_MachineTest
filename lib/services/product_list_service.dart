import 'package:amalka/models/Product_Model.dart';
import 'package:amalka/screens/home_page.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class ProductService {
  Future<List<Products>?> fetchProduct() async {
    List<Products> data = [];
    final _dio = Dio();
    try {
      final response = await _dio.get("https://fakestoreapi.com/products");
      if (response.statusCode == 200) {
        var json = response.data;
        if (kDebugMode) {
          print(json);
        }
        json.map((e) => data.add(Products.fromJson(e))).toList();
      } else {
        if (kDebugMode) {
          print(response.statusMessage);
        }
      }
    } catch (e) {
      rethrow;
    }
    return data;
  }

  Future LoginService(String username, String password) async {
    final _dio = Dio();
    try {
      final response = await _dio.post("https://fakestoreapi.com/auth/login",
          data: {"username": username, "password": password});
      if (kDebugMode) {
        print(response);
      }
      if (response.statusCode == 200) {
        Get.off(() => const HomePage());
      }
    } catch (e) {}
  }
}
