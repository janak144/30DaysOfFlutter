import 'package:flutter/material.dart';
import 'package:untitled/pages/cart_page.dart';
import 'package:untitled/pages/home_page.dart';
import 'package:untitled/pages/login_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled/utilits/routes.dart';
import 'package:untitled/widgets/themes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.system,
      theme: MyTheme().darkTheme(context),
      debugShowCheckedModeBanner: false,
      darkTheme: MyTheme().darkTheme(context),
      initialRoute: MyRoutes.homeRoute,
      routes: {
        "/": (context) => LoginPage(),
        MyRoutes.homeRoute: (context) => HomePage(),
        MyRoutes.loginRoute: (context) => LoginPage(),
        MyRoutes.cartRoute: (context) => CartPage(),
      },
    );
  }
}
