import 'package:electronics_task/features/actions/presentation/views/widgets/add_new_action_view_body.dart';
import 'package:electronics_task/features/leads/presentation/views/widgets/custom_top_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddNewActionView extends StatelessWidget {
  const AddNewActionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100.h),
        child: CustomTopBar(
          sectionLabel: "Actions",
          title: "Add New Action",
        ),
      ),
      body: AddNewActionViewBody(),
    );
  }
}
