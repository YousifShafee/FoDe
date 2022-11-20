import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:fode/res/colors.dart';
import 'package:fode/widgets/big_text.dart';
import 'package:fode/widgets/icon_and_text.dart';
import 'package:fode/widgets/small_text.dart';

class MainBodyPage extends StatefulWidget {
  const MainBodyPage({super.key});

  @override
  State<MainBodyPage> createState() => _MainBodyPageState();
}

class _MainBodyPageState extends State<MainBodyPage> {
  PageController pageController = PageController(viewportFraction: 0.85);
  var _currPageValue = 0.0;
  final _scaleFactor = 0.8;
  final _height = 220.0;

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currPageValue = pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 320,
          child: PageView.builder(
            controller: pageController,
            itemCount: 5,
            itemBuilder: (context, position) {
              return _buildPageItem(position);
            },
          ),
        ),
        DotsIndicator(
          dotsCount: 5,
          position: _currPageValue,
          decorator: DotsDecorator(
            color: AppColors.greyIconColor,
            activeColor: AppColors.blueIconColor,
            size: const Size.square(9.0),
            activeSize: const Size(18.0, 9.0),
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)),
          ),
        ),
      ],
    );
  }

  Widget _buildPageItem(int position) {
    double currScale = 0.8;
    if (position == _currPageValue.floor() ||
        position == _currPageValue.floor() - 1) {
      currScale = 1 - (_currPageValue - position) * (1 - _scaleFactor);
    } else if (position == _currPageValue.floor() + 1) {
      currScale = _scaleFactor + (_currPageValue - position + 1) * (1 - _scaleFactor);
    }
    final currTrans = _height * (1 - currScale) / 2;
    Matrix4 matrix4 = Matrix4.identity();
    matrix4 = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);
    return Transform(
      transform: matrix4,
      child: Stack(
        children: <Widget>[
          Container(
            height: _height,
            margin: const EdgeInsets.only(left: 5, right: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              image: const DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("assets/image/food.jpg"),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 120,
              margin: const EdgeInsets.only(left: 30, right: 30, bottom: 30),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: AppColors.backgroundColor,
                boxShadow: const [
                  BoxShadow(
                    color: AppColors.greyIconColor,
                    blurRadius: 5.0,
                    offset: Offset(0, 5),
                  ),
                  BoxShadow(
                    color: AppColors.backgroundColor,
                    offset: Offset(-5, 0),
                  ),
                  BoxShadow(
                    color: AppColors.backgroundColor,
                    offset: Offset(5, 0),
                  ),
                ],
              ),
              child: Container(
                padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const BigText(text: "Egypt Country"),
                    const SizedBox(height: 10),
                    Row(
                      children: <Widget>[
                        Wrap(
                          children: List.generate(
                            5,
                            (index) => const Icon(
                              Icons.star,
                              color: AppColors.blueIconColor,
                              size: 15,
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        const SmallText(text: "4.5"),
                        const SizedBox(width: 10),
                        const SmallText(text: "1287"),
                        const SizedBox(width: 10),
                        const SmallText(text: "comments"),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const <Widget>[
                        IconAndText(text: "Normal", icon: Icons.circle_sharp),
                        IconAndText(text: "1.7km", icon: Icons.location_on),
                        IconAndText(
                            text: "32min", icon: Icons.access_time_rounded),
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
