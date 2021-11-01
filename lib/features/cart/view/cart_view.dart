import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/product/model/user_model.dart';

class CartView extends StatelessWidget {
  const CartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Expanded(
          child: ListView.builder(
              itemCount: context.watch<User>().cartItems.length,
              itemBuilder: (context, index) {
                final product = context.watch<User>().cartItems[index];
                return Column(
                  children: [
                    Image.network(product.image!),
                    Text("${context.watch<User>().cartProducts[product]}")
                  ],
                );
              }),
        ),
        ElevatedButton(
          onPressed:
              context.watch<User>().cartProductsTotalCost < 100 ? null : () {},
          child: context.watch<User>().cartProductsTotalCost < 100
              ? const Text("minimum 100 TL")
              : const Text("buy"),
        )
      ],
    ));
  }
}
