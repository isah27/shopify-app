import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shopify/widgets/cart.dart';
import 'package:shopify/widgets/normal_text.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> with TickerProviderStateMixin {
  final currencyFormatter = NumberFormat("#,##0.00", "en_US");

  @override
  Widget build(BuildContext context) {
    final TabController _tabController = TabController(length: 1, vsync: this);
    var size = MediaQuery.of(context).size;
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.amber.shade900,
      //   title: IconButton(
      //       onPressed: () {},
      //       icon: Icon(Icons.arrow_back, color: Colors.white)),
      //   actions: [
      //     Container(
      //       color: Colors.transparent,
      //       width: 300,
      //       child: Center(
      //         child: NormalText(
      //           text: "Detail Information",
      //           size: 20,
      //           color: Colors.white,
      //           isbBold: true,
      //         ),
      //       ),
      //     ),
      //     Cart(),
      //   ],
      // ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.transparent,
          width: size.width,
          height: size.height,
          child: Stack(
            children: [
              Positioned(
                top: 0,
                bottom: size.height / 2 - 20,
                left: 0,
                right: 0,
                child: Container(
                  // height: 20,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    image: DecorationImage(
                      image: AssetImage("assets/nike3.jpg"),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              // back button and price text
              Positioned(
                top: 35,
                left: 10,
                right: 10,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // back button
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.7),
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.white.withOpacity(0.5),
                            blurRadius: 4,
                            spreadRadius: 4,
                            offset: const Offset(1, 3),
                          )
                        ],
                      ),
                      child: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(
                            Icons.arrow_back_ios,
                            size: 35,
                            color: Colors.amber.shade900,
                          )),
                    ),
                    // price
                    Container(
                      padding: const EdgeInsets.only(right: 10, left: 10),
                      margin:
                          const EdgeInsets.only(left: 20, right: 10, top: 10),
                      width: size.width / 3,
                      height: 50,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(35),
                            topRight: Radius.circular(20),
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(35),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.5),
                              blurRadius: 4,
                              spreadRadius: 4,
                              // offset: Offset(1, 1),
                            )
                          ]),
                      child: FittedBox(
                        child: NormalText(
                          text: "₦${currencyFormatter.format(10000)}",
                          size: 20,
                          color: Colors.amber.shade900,
                          isbBold: true,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: size.height / 2 - 60,
                bottom: 20,
                left: 5,
                right: 5,
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(60),
                      topRight: Radius.circular(60),
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 30),
                        // product name
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SizedBox(
                              height: 30,
                              width: size.width / 2 + 50,
                              child: FittedBox(
                                child: NormalText(
                                  text: "Nike canvas ",
                                  size: 25,
                                  color: Colors.black,
                                  isbBold: true,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 20),
                          padding: const EdgeInsets.only(left: 10),
                          color: Colors.transparent,
                          child: NormalText(
                            text: "Description",
                            color: Colors.black.withOpacity(1.0),
                            isbBold: true,
                            size: 20,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 10),
                          padding: const EdgeInsets.only(
                              left: 10, right: 10, bottom: 7),
                          width: MediaQuery.of(context).size.width,
                          child: NormalText(
                            size: 16,
                            color: Colors.black.withOpacity(0.5),
                            text:
                                "very nice product,product, probably one of their best canvas very nice product, probably one of their best canvas",
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 15),
                          padding: const EdgeInsets.only(left: 10),
                          child: Row(
                            children: [
                              Wrap(
                                children: List.generate(
                                    5,
                                    (index) => Icon(Icons.star,
                                        color: index < 4
                                            ? Colors.amber.shade900
                                            : Colors.black12)),
                              ),
                              const SizedBox(width: 5),
                              NormalText(
                                text: "(${4.toString()}.0)",
                                size: 14,
                              )
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 15),
                          color: Colors.transparent,
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: NormalText(
                            text: "Similar Products",
                            size: 18,
                            isbBold: true,
                            color: Colors.black.withOpacity(0.7),
                          ),
                        ),
                        Container(
                          height: 180,
                          color: Colors.black12.withOpacity(0.1),
                          width: double.maxFinite,
                          child:
                              TabBarView(controller: _tabController, children: [
                            ListView.builder(
                              itemCount: 10,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (BuildContext context, int index) {
                                return Container(
                                  margin: const EdgeInsets.only(left: 8),
                                  width: 150,
                                  height: 200,
                                  decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    color: Colors.white,
                                    image: DecorationImage(
                                      image: AssetImage("assets/nike4.jpg"),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                );
                              },
                            )
                          ]),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        child: Padding(
          padding:
              const EdgeInsets.only(right: 10, left: 10, top: 2, bottom: 2),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.black.withOpacity(0.1),
                ),
                child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.call,
                      color: Colors.amber.shade900,
                    )),
              ),
              Material(
                elevation: 5,
                borderRadius: BorderRadius.circular(20),
                color: Colors.amber.shade900,
                child: MaterialButton(
                    padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                    minWidth: 270,
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Icon(Icons.add_shopping_cart_outlined,
                            color: Colors.white),
                        SizedBox(width: 50),
                        Text(
                          "Add to cart",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
