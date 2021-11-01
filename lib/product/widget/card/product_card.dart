import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/features/products/model/product_model.dart';
import 'package:shop_app/product/model/user_model.dart';

class ProductCard extends StatelessWidget {
  final ProductModel productModel;
  const ProductCard({Key? key, required this.productModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: ListTile(
      trailing: IconButton(
        icon: const Icon(Icons.add_shopping_cart),
        onPressed: () {
          context.read<User>().addItemToCart(productModel);
        },
      ),
      title: buildImageSizedBox(context),
      subtitle: buildWrap(),
    ));
  }

  Wrap buildWrap() {
    return Wrap(
      spacing: 10,
      children: [
        Text(productModel.name!),
        Text(productModel.price!.toString())
      ],
    );
  }

  Widget buildImageSizedBox(BuildContext context) {
    return Container(
      width: 10,
      child: Row(
        children: [
          SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
              child: Image.network(productModel.image!)),
          IconButton(
              onPressed: () {
                context.read<User>().removeItemFromCart(productModel);
              },
              icon: const Icon(Icons.exposure_minus_1)),
          Text("${context.watch<User>().cartProducts[productModel] ?? 0}"),
          IconButton(
            padding: EdgeInsets.zero,
            onPressed: () {
              context.read<User>().addItemToCart(productModel);
            },
            icon: const Icon(Icons.plus_one),
          ),
        ],
      ),
    );
  }
}
