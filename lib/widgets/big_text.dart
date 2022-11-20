import 'package:flutter/material.dart';
import 'package:fode/res/colors.dart';

class BigText extends StatelessWidget {
  final Color color;
  final String text;
  final double size;
  final TextOverflow overFlow;

  const BigText(
      {super.key,
      this.color = AppColors.bigTextColor,
      required this.text,
      this.overFlow = TextOverflow.ellipsis,
      this.size = 20});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      overflow: overFlow,
      style: TextStyle(
        color: color,
        fontWeight: FontWeight.w400,
        fontFamily: 'Roboto',
        fontSize: size,
      ),
    );
  }
}
