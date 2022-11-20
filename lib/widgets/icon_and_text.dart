import 'package:flutter/material.dart';
import 'package:fode/res/colors.dart';
import 'package:fode/widgets/small_text.dart';

class IconAndText extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color iconColor;

  const IconAndText(
      {super.key,
      required this.text,
      required this.icon,
      this.iconColor = AppColors.blueIconColor});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: iconColor),
        const SizedBox(width: 5),
        SmallText(text: text)
      ],
    );
  }
}
