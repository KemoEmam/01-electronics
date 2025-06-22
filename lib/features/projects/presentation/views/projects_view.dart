import 'package:electronics_task/core/components/custom_app_bar.dart';
import 'package:electronics_task/features/projects/presentation/views/widgets/projects_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProjectsView extends StatelessWidget {
  const ProjectsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        backgroundColor: Colors.white,
        title: "Projects",
        showBackButton: false,
        topPadding: 40.h,
        toolbarHeight: 82.h,
      ),
      body: const SafeArea(
        child: ProjectsViewBody(),
      ),
    );
  }
}
