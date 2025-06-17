import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color buttonColor;
  final Color textColor;
  final double borderRadius;
  final TextStyle? textStyle;
  final double? fontSize;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.buttonColor,
    this.textColor = Colors.white,
    this.borderRadius = 16,
    this.textStyle,
    this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        minimumSize: const Size(double.infinity, 56),
        textStyle: textStyle ?? TextStyle(fontSize: fontSize),
        foregroundColor: textColor,
        backgroundColor: buttonColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: textStyle?.copyWith(color: textColor) ??
            TextStyle(
                fontSize: fontSize ?? 16,
                color: textColor,
                fontWeight: FontWeight.bold),
      ),
    );
  }
}
