import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/features/products/model/product_model.dart';
import 'package:shop_app/features/products/viewmodel/products.dart';
import 'package:shop_app/product/service/user_service.dart';

abstract class ProductsViewModel extends State<Products> {
  List<ProductModel> products = [];

  @override
  void initState() {
    super.initState();
    getAllProducts();
  }

  Future<void> getAllProducts() async {
    products = await context.read<UserService>().getAllProducts();
    setState(() {});
  }
}
