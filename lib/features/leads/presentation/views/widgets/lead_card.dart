import 'package:electronics_task/features/leads/presentation/views/widgets/leads_tag_filter.dart';
import 'package:flutter/material.dart';

class LeadCard extends StatelessWidget {
  final String name;
  final Color? barColor;
  final List<LeadTagFilter>? tags;
  final String? phone;
  final String? city;
  final String? project;
  final String? budget;
  final String? assignedTo;
  final String? role;

  const LeadCard({
    super.key,
    required this.name,
    this.barColor,
    this.tags,
    this.phone,
    this.city,
    this.project,
    this.budget,
    this.assignedTo,
    this.role,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 4),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            offset: Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Name (required)
          Text(
            name,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),

          // Colored bar
          Container(
            height: 5,
            margin: const EdgeInsets.only(top: 8, bottom: 12),
            decoration: BoxDecoration(
              color: barColor ?? Colors.grey,
              borderRadius: BorderRadius.circular(4),
            ),
          ),

          // Tags
          if (tags != null && tags!.isNotEmpty)
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(children: tags!),
            ),

          const SizedBox(height: 10),

          // Optional Info
          if (role != null) ...[
            Text(role!, style: const TextStyle(fontSize: 13)),
            const SizedBox(height: 2),
          ],
          if (phone != null) ...[
            Text(phone!, style: const TextStyle(fontSize: 13)),
            const SizedBox(height: 2),
          ],
          if (city != null) ...[
            Text(city!, style: const TextStyle(fontSize: 13)),
            const SizedBox(height: 2),
          ],
          if (project != null) ...[
            Text(project!, style: const TextStyle(fontSize: 13)),
            const SizedBox(height: 2),
          ],
          if (budget != null) ...[
            Text("Budget Range: $budget", style: const TextStyle(fontSize: 13)),
            const SizedBox(height: 2),
          ],
          if (assignedTo != null) ...[
            Text("Assigned To: $assignedTo",
                style: const TextStyle(fontSize: 13)),
          ],
        ],
      ),
    );
  }
}
