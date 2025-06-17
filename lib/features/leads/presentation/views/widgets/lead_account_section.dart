import 'package:electronics_task/features/leads/presentation/views/widgets/custom_lead_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LeadAccountSection extends StatelessWidget {
  final void Function(String?) onSavedBudgetMin;
  final void Function(String?) onSavedBudgetMax;
  final void Function(String?) onSavedCity;
  final void Function(String?) onSavedProject;

  const LeadAccountSection({
    super.key,
    required this.onSavedBudgetMin,
    required this.onSavedBudgetMax,
    required this.onSavedCity,
    required this.onSavedProject,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: CustomLeadsFormField(
                fieldLabel: 'Budget Min *',
                labelText: 'min',
                keyboardType: TextInputType.number,
                validator: (val) =>
                    val == null || val.isEmpty ? 'Required' : null,
                onSaved: onSavedBudgetMin,
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: CustomLeadsFormField(
                fieldLabel: 'Budget Max *',
                labelText: 'max',
                keyboardType: TextInputType.number,
                validator: (val) =>
                    val == null || val.isEmpty ? 'Required' : null,
                onSaved: onSavedBudgetMax,
              ),
            ),
          ],
        ),
        SizedBox(height: 5.h),
        const CustomLeadsFormField(
            fieldLabel: 'Unit Type', labelText: 'Choose a Unit Type'),
        SizedBox(height: 5.h),
        CustomLeadsFormField(
          fieldLabel: 'Location *',
          labelText: 'Choose a Location',
          validator: (val) =>
              val == null || val.isEmpty ? 'Location is required' : null,
          onSaved: onSavedCity,
        ),
        SizedBox(height: 5.h),
        CustomLeadsFormField(
          fieldLabel: 'Project *',
          labelText: 'Choose a Project',
          validator: (val) =>
              val == null || val.isEmpty ? 'Project is required' : null,
          onSaved: onSavedProject,
        ),
      ],
    );
  }
}
