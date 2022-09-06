import 'package:flutter/material.dart';
import 'package:hotel_lemon/reusable_widget/big_text.dart';
import 'package:hotel_lemon/reusable_widget/small_text.dart';
import 'package:hotel_lemon/utils/colors.dart';
import '../reusable_widget/iocn_text.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({Key? key}) : super(key: key);

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  PageController pageController = PageController(viewportFraction: 0.85);
  var _currtPaveValue = 0.0;
  final double _scaleFactor = 0.8;
  final double _height = 210;

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currtPaveValue = pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print("------------Food Page----------------");
    return Column(
      children: [
        SizedBox(
          height: 280,
          // color: Colors.white,
          child: PageView.builder(
              controller: pageController,
              itemCount: 5,
              itemBuilder: (context, index) {
                return _buildPageItem(index);
              }),
        ),

        // /Dots section

        // DotsIndicator(
        //     dotsCount:5
        //     position: _currtPaveValue,
        //     decorator: DotsDecorator(
        //       activeColor: Colors.grey.shade800,
        //       size: const Size.square(9.0),
        //       activeSize: const Size(18.0, 9.0),
        //       activeShape: RoundedRectangleBorder(
        //           borderRadius: BorderRadius.circular(Dimen.radius5)),
        //     ),
        //   );
        // }),

        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Divider(
            thickness: 1,
            color: Colors.grey.shade600,
          ),
        ), //Recommended Text
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              BigText(
                text: "Recommended",
                color: Colors.grey,
              ),
              const SizedBox(
                width: 10,
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 3),
                child: BigText(
                  text: ".",
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 2),
                child: SmallText(
                  text: "Food Pairing",
                  color: Colors.grey.shade100,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 5,
        ),

        Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height,
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: 20,
                  itemBuilder: (context, index) {
                    return Container(
                      height: 80,
                      margin: const EdgeInsets.only(
                        left: 10,
                        right: 10,
                        bottom: 10,
                      ),
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.grey.shade800,
                      ),
                      child: Row(
                        children: [
                          Container(
                            height: 80,
                            width: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              image: const DecorationImage(
                                image: AssetImage("assets/image/fish.jpg"),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20, bottom: 0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                BigText(
                                  text: "Speciial Fish",
                                  color: Colors.white,
                                  size: 16,
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                SmallText(
                                  text: "Spicy",
                                  color: Colors.white,
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                SmallText(
                                  text: "\$80",
                                  color: Colors.white,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          const Spacer(),
                          Container(
                            height: 30,
                            width: 70,
                            margin: const EdgeInsets.only(right: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.grey,
                            ),
                            child: const Center(
                              child: Icon(
                                Icons.add,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
            ),
          ],
        ),
      ],
    );
  }

  //main scrollable item
  Widget _buildPageItem(int index) {
    Matrix4 matrix = Matrix4.identity();
    if (index == _currtPaveValue.floor()) {
      var currScale = 1 - (_currtPaveValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currtPaveValue.floor() + 1) {
      var currScale =
          _scaleFactor + (_currtPaveValue - index + 1) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currtPaveValue.floor() - 1) {
      var currScale = 1 - (_currtPaveValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else {
      var currScale = 0.8;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, _height * (1 - _scaleFactor) / 2, 1);
    }
    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          Container(
            margin: const EdgeInsets.only(left: 5, right: 5),
            height: 210,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.green.shade100,
              image: const DecorationImage(
                image: AssetImage("assets/image/chickenn.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: const EdgeInsets.only(left: 30, right: 30, bottom: 20),
              padding: const EdgeInsets.only(left: 10, right: 10),
              height: 110,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey.shade600,
              ),
              child: Container(
                margin: const EdgeInsets.only(left: 10, right: 10, top: 10),
                padding: const EdgeInsets.only(bottom: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BigText(
                      text: "Chinese side",
                      color: Colors.black,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Wrap(
                          children: List.generate(
                            5,
                            // ignore: prefer_const_constructors
                            (index) => Icon(
                              Icons.star,
                              color: AppColors.mainColor,
                              size: 15,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        SmallText(text: "4.5"),
                        const SizedBox(
                          width: 10,
                        ),
                        SmallText(text: "1273"),
                        const SizedBox(
                          width: 10,
                        ),
                        SmallText(text: "Comment"),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        const IconTextWidget(
                          icon: Icons.circle,
                          iconColor: AppColors.iconColor1,
                          text: "Normal",
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        const IconTextWidget(
                          icon: Icons.location_on,
                          iconColor: AppColors.mainColor,
                          text: "1.7km",
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        const IconTextWidget(
                          icon: Icons.access_time_rounded,
                          iconColor: AppColors.iconColor2,
                          text: "30 min",
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
