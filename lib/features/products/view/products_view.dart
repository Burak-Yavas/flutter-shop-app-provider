import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/features/products/model/product_model.dart';
import 'package:shop_app/features/products/viewmodel/products_view_model.dart';
import 'package:shop_app/product/model/user_model.dart';
import 'package:shop_app/product/widget/card/product_card.dart';

class ProductsView extends ProductsViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [buildActionChip()],
      ),
      body: ListView.builder(
          itemCount: products.length,
          itemBuilder: (context, index) {
            return ProductCard(productModel: products[index]);
          }),
    );
  }

  ActionChip buildActionChip() {
    return ActionChip(
        avatar: const Icon(
          Icons.check,
          color: Colors.green,
        ),
        label: Text("${context.watch<User>().cartProductsTotalCost} TL"),
        onPressed: () {});
  }
}
