import 'package:flutter/material.dart';

import '/theme.dart';

const ButtonHeight = 32.0;

class ShopMenuButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color baseColor;
  final Color highlightColor;

  const ShopMenuButton({
    required this.text,
    required this.onPressed,
    this.baseColor = EcoColors.primaryDark,
    this.highlightColor = EcoColors.primaryLight,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(3.0),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(5.0)),
      child: InkWell(
        highlightColor: highlightColor,
        customBorder: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        onTap: onPressed,
        child: Ink(
          decoration: BoxDecoration(
            color: baseColor,
            borderRadius: const BorderRadius.all(Radius.circular(5)),
          ),
          height: ButtonHeight,
          child: Center(
            child: Text(
              text,
              style: const TextStyle(color: EcoColors.text),
            ),
          ),
        ),
      ),
    );
  }
}
