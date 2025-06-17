import 'package:electronics_task/features/leads/presentation/views/widgets/leads_tag_filter.dart';
import 'package:flutter/material.dart';

class LeadsEntity {
  final String? name;
  final String? phone;
  final String? city;
  final String? project;
  final String? budget;
  final String? assignedTo;
  final Color? barColor;
  final List<LeadTagFilter>? tags;

  LeadsEntity({
    this.name,
    this.phone,
    this.city,
    this.project,
    this.budget,
    this.assignedTo,
    this.barColor,
    this.tags,
  });

  static const List<String> statusOptions = ['HOT', 'NEW', 'WARM', 'COLD'];

  static const Map<String, Color> statusColors = {
    'HOT': Color(0xFFcd5c5c),
    'NEW': Color(0xFF8ebb8e),
    'WARM': Color(0xFFfe8b00),
    'COLD': Color(0xFF87ceeb),
  };
}
