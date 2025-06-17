import 'package:flutter/material.dart';

class ActionsCard extends StatelessWidget {
  final String name;
  final String time;
  final String date;
  final String actionType;
  final String? assignedTo;
  final Color statusColor;

  const ActionsCard({
    super.key,
    required this.name,
    required this.time,
    required this.date,
    required this.actionType,
    required this.statusColor,
    this.assignedTo,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Top Row: Lead name + action type chip
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: statusColor.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  actionType,
                  style: TextStyle(fontSize: 12, color: statusColor),
                ),
              ),
            ],
          ),

          const SizedBox(height: 8),

          // Colored bar below top row
          Container(
            height: 3,
            decoration: BoxDecoration(
              color: statusColor,
              borderRadius: BorderRadius.circular(2),
            ),
          ),

          const SizedBox(height: 10),

          // Time
          Text("Time: $time", style: const TextStyle(fontSize: 13)),

          const SizedBox(height: 4),

          // Date
          Text("Date: $date", style: const TextStyle(fontSize: 13)),

          const SizedBox(height: 4),

          // Assigned To (if provided)
          if (assignedTo != null && assignedTo!.isNotEmpty)
            Text("Assigned To: $assignedTo",
                style: const TextStyle(fontSize: 13)),
        ],
      ),
    );
  }
}
