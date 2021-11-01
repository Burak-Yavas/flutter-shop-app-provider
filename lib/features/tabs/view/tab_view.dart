import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/features/cart/view/cart_view.dart';
import 'package:shop_app/features/products/viewmodel/products.dart';
import 'package:shop_app/product/model/user_model.dart';

class TabView extends StatelessWidget {
  const TabView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        bottomNavigationBar: buildBottomAppBar(context),
        body: const TabBarView(children: [CartView(), Products()]),
      ),
    );
  }

  BottomAppBar buildBottomAppBar(BuildContext context) {
    return BottomAppBar(
      color: Colors.grey,
      elevation: 20,
      child: TabBar(tabs: [
        const Tab(
            icon: Icon(
          Icons.shopping_cart_outlined,
        )),
        Tab(
          icon: Stack(
            children: [
              const Icon(Icons.shopping_basket),
              Positioned(
                  top: 0,
                  right: 0,
                  height: 10,
                  width: 10,
                  child: buildCircleAvatarCounter(context)),
            ],
          ),
        )
      ]),
    );
  }

  CircleAvatar buildCircleAvatarCounter(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.red,
      child: Text(context.watch<User>().numberOfProduct.toString(),
          style: Theme.of(context)
              .textTheme
              .overline!
              .copyWith(color: Colors.white)),
    );
  }
}
