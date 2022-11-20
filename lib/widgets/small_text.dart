import 'package:flutter/material.dart';
import 'package:fode/res/colors.dart';

class SmallText extends StatelessWidget {
  final Color color;
  final String text;
  final double size;
  final double height;

  const SmallText(
      {super.key,
      this.color = AppColors.smallTextColor,
      required this.text,
      this.size = 12,
      this.height=1.2});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontFamily: 'Roboto',
        fontSize: size,
        height: height,
      ),
    );
  }
}
