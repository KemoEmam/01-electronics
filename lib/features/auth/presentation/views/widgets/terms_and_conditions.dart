import 'package:flutter/material.dart';

class TermsAndConditions extends StatelessWidget {
  final String labelFirstPart;
  final String labelSecondPart;
  final String labelThirdPart;
  final String labelfourthPart;

  final TextStyle? firstPartStyle;
  final TextStyle? secondPartStyle;
  final TextStyle? thirdPartStyle;
  final TextStyle? fourthPartStyle;

  const TermsAndConditions({
    super.key,
    this.labelFirstPart = "By logging, you agree to our ",
    this.labelSecondPart = "Terms & Conditions ",
    this.labelThirdPart = "PrivacyPolicy.",
    this.labelfourthPart = "and ",
    this.firstPartStyle,
    this.secondPartStyle,
    this.thirdPartStyle,
    this.fourthPartStyle,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: labelFirstPart,
            style: firstPartStyle ??
                const TextStyle(
                  color: Color(0xFFC8C8C8),
                  fontSize: 16.0,
                ),
          ),
          TextSpan(
            text: labelSecondPart,
            style: secondPartStyle ??
                const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                ),
          ),
          TextSpan(
            text: labelfourthPart,
            style: fourthPartStyle ??
                const TextStyle(
                  color: Color(0xFFC8C8C8),
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                ),
          ),
          TextSpan(
            text: labelThirdPart,
            style: thirdPartStyle ??
                const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  height: 1.8,
                  fontSize: 16.0,
                ),
          ),
        ],
      ),
    );
  }
}
