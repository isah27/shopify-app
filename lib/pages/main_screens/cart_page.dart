import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shopify/widgets/button.dart';
import 'package:shopify/widgets/normal_text.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    final completeorderBtn = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(20),
      color: Colors.amber.shade900,
      child: MaterialButton(
        padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: () {
          //signIn(mailController.text, passwordController.text);
        },
        child: const Text(
          "ORDER NOW",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
    final callBtn = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(8),
      shadowColor: Colors.black,
      color: Colors.white,
      child: MaterialButton(
        padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: () {
          //signIn(mailController.text, passwordController.text);
        },
        child: Text(
          "CALL TO ORDER",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20,
            color: Colors.amber.shade900,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
            size: 30,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          "Cart",
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
          ),
        ),
        backgroundColor: Colors.black.withOpacity(0.8),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              children: List.generate(1, (index) {
                return Column(children: [
                  Container(
                    color: Colors.white,
                    padding: const EdgeInsets.all(8),
                    margin: const EdgeInsets.only(
                        top: 5, left: 5, right: 5, bottom: 1),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 100,
                          width: 100,
                          decoration: const BoxDecoration(
                            // color: Colors.white,
                            image: DecorationImage(
                              image: AssetImage("assets/login-ico.png"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Container(
                          color: Colors.transparent,
                          child: Column(
                            children: [
                              SizedBox(
                                width: 210,
                                child: NormalText(
                                  text:
                                      "firefox v3 the iconic ever made with fantastic features ever made with fantastic ",
                                  size: 15,
                                  color: Colors.black.withOpacity(0.7),
                                ),
                              ),
                              const SizedBox(height: 2),
                              SizedBox(
                                width: 210,
                                child: NormalText(
                                  text: "E-Shop Express",
                                  size: 20,
                                  color: Colors.black.withOpacity(0.8),
                                ),
                              ),
                              const SizedBox(height: 5),
                              SizedBox(
                                width: 210,
                                child: NormalText(
                                  text: "N1,500",
                                  size: 20,
                                  color: Colors.amber.shade900,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 1,
                    child: Container(
                      color: Colors.black.withOpacity(0.03),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 5, right: 5),
                    color: Colors.white,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.favorite_outline,
                                  color: Colors.amber.shade900,
                                )),
                            IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.delete,
                                  color: Colors.amber.shade900,
                                )),
                            NormalText(
                              text: "Remove",
                              color: Colors.amber.shade900,
                              size: 18,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            IconButton(
                                onPressed: () {
                                  // if (counter > 1) {
                                  //   setState(() {
                                  //     counter--;
                                  //     totalPrice -= price;
                                  // },
                                  // );
                                  // }
                                },
                                icon: Icon(
                                  Icons.remove,
                                  color: Colors.amber.shade900,
                                )),
                            NormalText(
                              text: "3",
                              size: 18,
                            ),
                            IconButton(
                                onPressed: () {
                                  // setState(() {
                                  //   counter = counter + 1;
                                  //   totalPrice += price;
                                  // });
                                },
                                icon: Icon(
                                  Icons.add,
                                  color: Colors.amber.shade900,
                                ))
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 4,
                    child: Container(
                      color: Colors.black.withOpacity(0.03),
                    ),
                  ),
                ]);
              }),
            ),
            Container(
              color: Colors.white,
              padding: const EdgeInsets.only(
                  left: 10, right: 10, top: 30, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  NormalText(
                    text: "Total",
                    size: 18,
                  ),
                  NormalText(
                    text: "500",
                    size: 18,
                    color: Colors.amber.shade900,
                  )
                ],
              ),
            ),
            const SizedBox(height: 20),
            Container(
              color: Colors.transparent,
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: CustomButton(text: "ORDER NOW", onPressed: () {}),
            ),
            SizedBox(
              height: 20,
              child: Container(color: Colors.black.withOpacity(0.05)),
            ),
            Container(
              color: Colors.transparent,
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: CustomButton(
                  text: "CALL TO ORDER",
                  withBackground: false,
                  onPressed: () {}),
            ),
            const SizedBox(height: 10)
          ],
        ),
      ),
    );
  }
}
