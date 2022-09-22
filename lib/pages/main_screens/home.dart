import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopify/class/bloc/app_bloc.dart';
import 'package:shopify/class/bloc/app_state.dart';
import 'package:shopify/class/repository/repository.dart';
import 'package:shopify/pages/main_screens/detail_page.dart';
import 'package:shopify/widgets/cart.dart';
import 'package:shopify/widgets/loading.dart';
import 'package:shopify/widgets/normal_text.dart';
import 'package:intl/intl.dart';
import 'package:shopify/widgets/text_field.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final currencyFormatter = NumberFormat("#,##0.00", "en_US");
  final TextEditingController _controller = TextEditingController();
  final baseUrl = "https://nazzy-shopify-api.herokuapp.com";

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: BlocProvider.of<ShopifyBloc>(context),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber.shade900,
          actions: [
            Container(
              margin: const EdgeInsets.only(top: 8, bottom: 8),
              height: 10,
              width: MediaQuery.of(context).size.width - 50,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: CustomTextField(
                  hintText: "Search",
                  controller: _controller,
                  isSearch: true,
                  validator: (value) {
                    return null;
                  },
                  icon: Icons.search),
            ),
            const Cart(),
          ],
        ),
        body: BlocBuilder<ShopifyBloc, ShopifyState>(
          // bloc: BlocProvider.of<ShopifyBloc>(context),
          builder: (context, state) {
            if (state is LoadingState) {
              return CircularProgressIndicator();
              // return const LoadingPage();
            } else if (state is ErrorsState) {
              return Container(
                color: Colors.red,
                child: Center(
                  child: Text(state.error),
                ),
              );
            }

            if (state is LoadedState) {
              return Container(
                color: Colors.black.withOpacity(0.05),
                height: double.maxFinite,
                child: GridView.count(
                  padding: const EdgeInsets.only(top: 10),
                  mainAxisSpacing: 5,
                  crossAxisSpacing: 5,
                  physics: const BouncingScrollPhysics(),
                  crossAxisCount: 2,
                  children: List.generate(
                    state.data.length,
                    (index) {
                      return GestureDetector(
                        onTap: (() {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const DetailPage()));
                        }),
                        child: Container(
                          padding: const EdgeInsets.only(left: 5, right: 5),
                          height: 250,
                          width: MediaQuery.of(context).size.width / 2 - 100,
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.4),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: FittedBox(
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 35,
                                  child: FittedBox(
                                      child: NormalText(
                                    text: state.data[index].name!,
                                    size: 25,
                                    isbBold: true,
                                  )),
                                ),
                                Container(
                                  width: 200,
                                  height: 170,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      image: DecorationImage(
                                        image: NetworkImage(
                                            "$baseUrl${state.data[index].image}"),
                                        fit: BoxFit.fill,
                                      ),
                                      shape: BoxShape.circle
                                      // borderRadius: BorderRadius.only(
                                      //   topLeft: Radius.circular(15),
                                      //   topRight: Radius.circular(15),
                                      // ),
                                      ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    const SizedBox(width: 150),
                                    Container(
                                      height: 50,
                                      width: 50,
                                      padding: const EdgeInsets.all(2),
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          color: Colors.amber.shade900,
                                          shape: BoxShape.circle),
                                      child: FittedBox(
                                          child: NormalText(
                                        text:
                                            "₦${currencyFormatter.format(10500)}",
                                        color: Colors.white,
                                        isbBold: true,
                                      )),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              );
            } else if (state is AuthenticatedState) {
              return Container(color: Colors.yellow);
            } else if (state is LoginLoadingState) {
              return Container(color: Colors.green);
            } else if (state is InitialState) {
              return Container(color: Colors.blue);
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}
