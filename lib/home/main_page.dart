import 'package:flutter/material.dart';
import 'package:fode/home/main_body_page.dart';
import 'package:fode/res/colors.dart';
import 'package:fode/widgets/big_text.dart';
import 'package:fode/widgets/small_text.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(top: 45, bottom: 15),
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          children: [
            // showing the header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    const BigText(text: "Country"),
                    Row(
                      children: const <Widget>[
                        SmallText(text: "City"),
                        Icon(Icons.arrow_drop_down_rounded),
                      ],
                    )
                  ],
                ),
                Center(
                  child: Container(
                    width: 45,
                    height: 45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: AppColors.mainColor,
                    ),
                    child: const Icon(Icons.search,
                        color: AppColors.backgroundColor),
                  ),
                ),
              ],
            ),
            // showing the body
            const MainBodyPage(),
          ],
        ),
      ),
    );
  }
}
