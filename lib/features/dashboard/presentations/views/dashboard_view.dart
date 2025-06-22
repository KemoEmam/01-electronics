import 'package:electronics_task/features/dashboard/presentations/views/widgets/dashboard_drawer.dart';
import 'package:flutter/material.dart';

import 'widgets/dashboard_view_body.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DashboardDrawer(),
      body: const SafeArea(
        child: DashboardViewBody(),
      ),
    );
  }
}
