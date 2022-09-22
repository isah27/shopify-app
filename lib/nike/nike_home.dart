import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shopify/nike/data.dart';
import 'package:shopify/nike/nike.dart';
import 'package:shopify/nike/nike_detail.dart';
import 'package:shopify/widgets/normal_text.dart';

class NikeHome extends StatefulWidget {
  const NikeHome({Key? key}) : super(key: key);

  @override
  State<NikeHome> createState() => _NikeHomeState();
}

class _NikeHomeState extends State<NikeHome> {
  final _pageController = PageController(viewportFraction: 0.75);

  double currentPage = 0.0;
  double indexPage = 0.0;
  void _listener() {
    setState(() {
      currentPage = _pageController.page!;
      if (currentPage >= 0 && currentPage < 0.7) {
        indexPage = 0;
      } else if (currentPage > 0.7 && currentPage < 1.7) {
        indexPage = 1;
      } else if (currentPage > 1.7 && currentPage < 2.7) {
        indexPage = 2;
      }
    });
  }

  @override
  void initState() {
    _pageController.addListener(_listener);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown.shade900,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: 50,
            child: Row(
              children: List.generate(
                  listCategory.length,
                  (index) => Padding(
                        padding: const EdgeInsets.only(right: 16),
                        child: Text(
                          listCategory[index],
                          style: const TextStyle(
                              fontWeight: FontWeight.w800,
                              fontSize: 20,
                              color: Colors.white),
                        ),
                      )),
            ),
          ),
          Expanded(
            child: PageView.builder(
                controller: _pageController,
                physics: const BouncingScrollPhysics(),
                itemCount: listShoes.length,
                itemBuilder: (context, index) {
                  final shoes = listShoes[index];
                  final listTitle = shoes.category.split(" ");
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(PageRouteBuilder(
                          pageBuilder: (context, animation, _) {
                        return NikeDetailPage(shoes:shoes);
                      }));
                    },
                    child: Padding(
                      padding:
                          EdgeInsets.only(right: index == indexPage ? 30 : 60),
                      child: Transform.translate(
                        offset: Offset(index == indexPage ? 0 : 20, 0),
                        child: LayoutBuilder(builder: (context, constraints) {
                          return Container(
                            margin: const EdgeInsets.symmetric(vertical: 30),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(36),
                              color: Colors.white,
                            ),
                            child: Stack(
                              clipBehavior: Clip.none,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 40),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      Text(
                                        shoes.category,
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      Text(
                                        shoes.name,
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 28,
                                          fontWeight: FontWeight.w800,
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        shoes.price,
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      FittedBox(
                                        child: Text(
                                          "${listTitle[0]}\n ${listTitle[0]}",
                                          style: const TextStyle(
                                            color: Colors.grey,
                                            fontSize: 40,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Positioned(
                                  top: constraints.maxHeight * 0.2,
                                  left: constraints.maxWidth * 0.3,
                                  right: constraints.maxWidth * 0.016,
                                  bottom: constraints.maxHeight * 0.2,
                                  child: Hero(
                                    tag: shoes.name,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(45),
                                          bottomRight: Radius.circular(45),
                                          topRight: Radius.circular(10),
                                          bottomLeft: Radius.circular(10),
                                        ),
                                        image: DecorationImage(
                                          image: AssetImage(
                                              shoes.listImage[0].image),
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                      // child: Image(
                                      //   image:
                                      // ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  bottom: 0,
                                  left: 0,
                                  child: Material(
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    color: shoes.listImage[0].color,
                                    borderRadius: const BorderRadius.only(
                                      topRight: Radius.circular(36),
                                      bottomLeft: Radius.circular(36),
                                    ),
                                    child: InkWell(
                                      onTap: () {},
                                      child: const SizedBox(
                                        height: 80,
                                        width: 80,
                                        child: Icon(
                                          Icons.add,
                                          size: 40,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        }),
                      ),
                    ),
                  );
                }),
          ),
          Container(
            height: 120,
            color: listShoes[0].listImage[0].color,
          ),
        ],
      ),
    );
  }
}
