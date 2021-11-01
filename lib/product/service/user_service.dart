import 'dart:io';

import 'package:dio/dio.dart';
// import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shop_app/features/products/model/product_model.dart';

class UserService {
  // final String? baseurl2 = dotenv.env["HOME_IP"];
  final String baseUrl = "http://192.168.1.104:3000";

  Dio? dio;
  UserService() {
    dio = Dio(BaseOptions(baseUrl: baseUrl));
  }

  Future<List<ProductModel>> getAllProducts() async {
    final response = await dio!.get("/products");

    if (response.statusCode == HttpStatus.ok) {
      final responseBody = response.data as List;

      return responseBody.map((e) => ProductModel.fromJson(e)).toList();
    }

    throw Exception();
  }

  Future<bool> addProduct(ProductModel product) async {
    final response = await dio!.post("/product",
        data: product.toJson(),
        options: Options(headers: {"user-id": "617eac51bd672204401be315"}));

    if (response.statusCode == HttpStatus.ok) {
      return true;
    }

    return false;
  }
}
