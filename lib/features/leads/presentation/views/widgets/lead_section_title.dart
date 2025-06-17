import 'package:flutter/material.dart';

class LeadSectionTitle extends StatelessWidget {
  final String title;
  final TextStyle? titleStyle;
  final Color? backgroundColor;
  const LeadSectionTitle(this.title,
      {super.key, this.backgroundColor, this.titleStyle});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black26),
        borderRadius: BorderRadius.circular(12),
        color: backgroundColor ?? Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Text(
        title,
        style: titleStyle ?? const TextStyle(fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      ),
    );
  }
}
