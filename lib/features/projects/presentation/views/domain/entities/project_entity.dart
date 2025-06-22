import 'package:flutter/material.dart';

class ProjectEntity {
  final String title;
  final String updatedDate;
  final String status;
  final Color statusColor;

  ProjectEntity({
    required this.title,
    required this.updatedDate,
    required this.status,
    required this.statusColor,
  });
}
