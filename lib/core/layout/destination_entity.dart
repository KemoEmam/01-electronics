import 'package:electronics_task/core/themes/styles/app_images.dart';
import 'package:electronics_task/features/actions/presentation/views/actions_view.dart';
import 'package:electronics_task/features/dashboard/presentations/views/dashboard_view.dart';
import 'package:electronics_task/features/leads/presentation/views/leads_view.dart';
import 'package:electronics_task/features/projects/presentation/views/projects_view.dart';
import 'package:flutter/material.dart';

class DestinationEntity {
  final String icon;
  final String label;
  final Widget screen;

  DestinationEntity(
      {required this.screen, required this.icon, required this.label});
}

List<DestinationEntity> getDestinationEntity(BuildContext context) {
  return [
    DestinationEntity(
      icon: AppImages.imagesDashboard,
      label: "Dashboard",
      screen: const DashboardView(),
    ),
    DestinationEntity(
      icon: AppImages.imagesLeads,
      label: "Leads",
      screen: const LeadsView(),
    ),
    DestinationEntity(
      icon: AppImages.imagesActions,
      label: "Actions",
      screen: const ActionsView(),
    ),
    DestinationEntity(
      icon: AppImages.imagesProjects,
      label: "Projects",
      screen: const ProjectsView(),
    ),
  ];
}
