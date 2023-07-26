import 'package:flutter/material.dart';
import 'package:login_project/pages/cart_page.dart';
import 'package:login_project/pages/functions.dart';
import 'package:login_project/pages/home.dart';
import 'package:login_project/pages/home_custom.dart';
import 'package:login_project/pages/home_details.dart';
import 'package:login_project/pages/login_page.dart';
import 'package:login_project/utils/myroutes.dart';
import 'package:login_project/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

import 'core/store.dart';

void main() {
   runApp(VxState(
    store: MyStore(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  final String name = "My App";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        color: Colors.white,
        themeMode: ThemeMode.system,
        theme: MyThemes.lightThemeData,
        darkTheme: MyThemes.darkThemeData,
        
        home:  const Login(),
        routes: {
          MyRoutes.loginRoute: (context) => const Login(),
          MyRoutes.functionRoute: (context) => const Functions(),
          MyRoutes.homeRoute: (context) => const HomeCustom(),
          MyRoutes.cartRoute: (context) => CartPage(),
        });
     
  }
}
