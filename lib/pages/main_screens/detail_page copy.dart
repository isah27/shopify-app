// ignore: file_names
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shopify/widgets/cart.dart';
import 'package:shopify/widgets/normal_text.dart';

class WrongPage extends StatefulWidget {
  const WrongPage({Key? key}) : super(key: key);

  @override
  State<WrongPage> createState() => _WrongPageState();
}

// ignore: camel_case_types
class _WrongPageState extends State<WrongPage> {
  final currencyFormatter = NumberFormat("#,##0.00", "en_US");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber.shade900,
        actions: [
          Container(
            color: Colors.transparent,
            width: 300,
            child: Center(
              child: NormalText(
                text: "Wrong Page",
                size: 30,
                color: Colors.white,
                isbBold: true,
              ),
            ),
          ),
          const Cart(),
        ],
      ),
      body: Container(color: Colors.red),
    );
  }
}
