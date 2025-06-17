import 'package:flutter/material.dart';

class LeadInfoCard extends StatelessWidget {
  final List<Widget> children;
  final Color backgroundColor;

  const LeadInfoCard(
      {super.key, required this.children, required this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: children
            .map((e) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: e,
                ))
            .toList(),
      ),
    );
  }
}
