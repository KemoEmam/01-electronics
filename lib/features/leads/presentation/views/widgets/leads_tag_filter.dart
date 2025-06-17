import 'package:flutter/material.dart';

class LeadTagFilter extends StatelessWidget {
  final String label;
  final Color backgroundColor;
  final Color textColor;
  final double? width;

  const LeadTagFilter({
    super.key,
    required this.label,
    required this.backgroundColor,
    required this.textColor,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? MediaQuery.of(context).size.width * 0.26,
      height: 34,
      margin: const EdgeInsets.only(right: 6),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.2),
            blurRadius: 6,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      alignment: Alignment.center,
      child: Text(
        label.toUpperCase(),
        style: TextStyle(
          color: textColor,
          fontWeight: FontWeight.w600,
          fontSize: 10,
          letterSpacing: 0.2,
        ),
      ),
    );
  }
}
