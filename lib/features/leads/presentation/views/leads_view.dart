import 'package:electronics_task/core/components/custom_app_bar.dart';
import 'package:electronics_task/features/leads/presentation/views/add_new_lead_view.dart';
import 'package:electronics_task/features/leads/presentation/views/widgets/leads_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LeadsView extends StatelessWidget {
  const LeadsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        backgroundColor: Colors.white,
        title: "Leads",
        showBackButton: false,
        trailing: IconButton(
            onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AddNewLeadView(),
                )),
            icon: const Icon(Icons.add_circle_outlined, size: 30)),
        topPadding: 40.h,
        toolbarHeight: 82.h,
      ),
      body: LeadsViewBody(),
    );
  }
}
