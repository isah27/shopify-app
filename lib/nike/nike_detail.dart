import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shopify/nike/nike.dart';
import 'package:shopify/nike/widget/transition.dart';
import 'package:shopify/widgets/button.dart';

class NikeDetailPage extends StatefulWidget {
  const NikeDetailPage({Key? key, required this.shoes}) : super(key: key);
  final Shoes shoes;
  @override
  State<NikeDetailPage> createState() => _NikeDetailPageState();
}

class _NikeDetailPageState extends State<NikeDetailPage> {
  int valueIndexColor = 0;
  int valueIndexSize = 1;

  double shoeSizes(int index, Size size) {
    switch (index) {
      case 0:
        return (size.height * 0.09);

      case 1:
        return (size.height * 0.07);
      case 2:
        return (size.height * 0.05);
      case 3:
        return (size.height * 0.04);
      default:
        return (size.height * 0.05);
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Container(
          // margin: const EdgeInsets.only(left: 10),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              Positioned(
                top: -size.height * 0.15,
                right: -size.height * 0.1,
                child: TweenAnimationBuilder<double>(
                  duration: const Duration(milliseconds: 250),
                  tween: Tween(begin: 0, end: 1),
                  builder: (context, value, child) {
                    return AnimatedContainer(
                      duration: const Duration(
                        milliseconds: 400,
                      ),
                      height: value * (size.height * 0.5),
                      width: value * (size.width * 0.5),
                      decoration: BoxDecoration(
                        color: widget.shoes.listImage[valueIndexColor].color,
                        shape: BoxShape.circle,
                      ),
                    );
                  },
                ),
              ),
              Positioned(
                top: 40,
                left: 10,
                right: 16,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.arrow_back_rounded,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.favorite_outline,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: size.height * 0.2,
                right: 0,
                left: 0,
                child: FittedBox(
                  child: Text(
                    widget.shoes.category,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[100],
                    ),
                  ),
                ),
              ),
              AnimatedPositioned(
                duration: const Duration(milliseconds: 250),
                top: size.height * 0.22,
                right: shoeSizes(valueIndexSize, size),
                left: shoeSizes(valueIndexSize, size),
                child: Hero(
                  tag: widget.shoes.name,
                  child: Image(
                    image: AssetImage(
                        widget.shoes.listImage[valueIndexColor].image),
                  ),
                ),
              ),
              Positioned(
                top: size.height * 0.6,
                left: 16,
                right: 16,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ShakeTransition(
                          child: Column(
                            children: [
                              Text(
                                widget.shoes.category,
                                style: const TextStyle(
                                    fontWeight: FontWeight.w600, fontSize: 16),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                widget.shoes.name,
                                style: const TextStyle(
                                    fontWeight: FontWeight.w600, fontSize: 20),
                              ),
                            ],
                          ),
                        ),
                        ShakeTransition(
                          left: false,
                          child: Text(
                            widget.shoes.price,
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                    ShakeTransition(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 8),
                          Row(
                            children: List.generate(
                              5,
                              (index) => Icon(
                                Icons.star,
                                color: widget.shoes.punctuation > index
                                    ? widget
                                        .shoes.listImage[valueIndexColor].color
                                    : Colors.white,
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            "SIZE",
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 16),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: List.generate(
                                4,
                                (index) => GestureDetector(
                                      onTap: () {
                                        valueIndexSize = index;
                                        setState(() {});
                                      },
                                      child: Container(
                                        alignment: Alignment.topCenter,
                                        margin: const EdgeInsets.only(right: 8),
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 8, horizontal: 10),
                                        decoration: BoxDecoration(
                                          color: index == valueIndexSize
                                              ? widget
                                                  .shoes
                                                  .listImage[valueIndexColor]
                                                  .color
                                              : Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Text(
                                          '${index + 7}',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 22,
                                            color: index == valueIndexSize
                                                ? Colors.white
                                                : Colors.black,
                                          ),
                                        ),
                                      ),
                                    )),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: size.height * 0.84,
                left: 16,
                right: 16,
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ShakeTransition(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "COLOR",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Row(
                              children: List.generate(
                                widget.shoes.listImage.length,
                                (index) => GestureDetector(
                                  onTap: () {
                                    valueIndexColor = index;
                                    setState(() {});
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.only(right: 8),
                                    height: 30,
                                    width: 30,
                                    decoration: BoxDecoration(
                                      color: widget.shoes
                                          .listImage[valueIndexColor].color,
                                      shape: BoxShape.circle,
                                      border: index == 0
                                          ? Border.all(
                                              color: Colors.white, width: 2)
                                          : null,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      ShakeTransition(
                        left: false,
                        child: SizedBox(
                          width: 100,
                          child: CustomButton(
                            text: "BUY",
                            onPressed: () {},
                            provideColor: true,
                            color:
                                widget.shoes.listImage[valueIndexColor].color,
                          ),
                        ),
                      )
                    ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
