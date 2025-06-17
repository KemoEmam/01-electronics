import 'package:flutter/material.dart';

class ActionEntity {
  final String? leadName;
  final String? status;
  final String? lastActionType;
  final DateTime? lastActionDate;
  final TimeOfDay? lastActionTime;
  final String? nextActionType;
  final DateTime? nextActionDate;
  final TimeOfDay? nextActionTime;
  final String? notes;
  final Color? statusColor;
  final String? assignedTo;

  ActionEntity({
    this.assignedTo,
    this.leadName,
    this.status,
    this.lastActionType,
    this.lastActionDate,
    this.lastActionTime,
    this.nextActionType,
    this.nextActionDate,
    this.nextActionTime,
    this.notes,
    this.statusColor,
  });

  static const List<String> actionTypes = [
    'Scheduled',
    'Completed',
    'Rescheduled',
    'Cancelled',
  ];

  static const Map<String, Color> actionTypeColors = {
    'Scheduled': Color(0xFFFF9800),
    'Completed': Color(0xFF4CAF50),
    'Rescheduled': Color(0xFF2196F3),
    'Cancelled': Color(0xFFF44336),
  };
}
