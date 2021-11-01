import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/product/model/user_model.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shop_app/product/service/user_service.dart';

import 'features/tabs/view/tab_view.dart';

Future main() async {
  // await dotenv.load(fileName: ".env");

  runApp(MultiProvider(
    providers: [
      Provider<UserService>(create: (context) => UserService()),
      ChangeNotifierProvider(create: (context) => User(context))
    ],
    child: MyApp(),
  ));
}

// ignore: use_key_in_widget_constructors
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return MaterialApp(
      title: 'Material App',
      // ignore: prefer_const_constructors
      home: TabView(),
      debugShowCheckedModeBanner: false,
    );
  }
}
