import 'package:flutter/material.dart';
import 'package:shopify/pages/authentication/login.dart';
import 'package:shopify/pages/authentication/signup.dart';
import 'package:shopify/pages/main_screens/cart_page.dart';
import 'package:shopify/pages/main_screens/detail_page%20copy.dart';
import 'package:shopify/pages/main_screens/detail_page.dart';
import 'package:shopify/pages/main_screens/home.dart';

class AppRoute {
  Route onGeneratedRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case "/":
        return MaterialPageRoute(builder: (_) => const LoginPage());

      case "/signup":
        return MaterialPageRoute(builder: (_) => const SignUp());

      case "/home":
        return MaterialPageRoute(builder: (_) => const HomePage());

      case "/cart":
        return MaterialPageRoute(builder: (_) => const CartPage());

      case "/detail":
        return MaterialPageRoute(builder: (_) => const DetailPage());

      default:
        return MaterialPageRoute(builder: (_) => const WrongPage());
    }
  }
}
