import 'package:electronics_task/features/leads/presentation/views/widgets/add_new_lead_view_body.dart';
import 'package:electronics_task/features/leads/presentation/views/widgets/custom_top_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddNewLeadView extends StatelessWidget {
  const AddNewLeadView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100.h),
        child: CustomTopBar(
          sectionLabel: "Leads",
          title: "Add New Lead",
        ),
      ),
      body: AddNewLeadViewBody(),
    );
  }
}
