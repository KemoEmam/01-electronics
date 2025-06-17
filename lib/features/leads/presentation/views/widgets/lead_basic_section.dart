import 'package:electronics_task/features/leads/domain/entities/leads_entity.dart';
import 'package:electronics_task/features/leads/presentation/views/widgets/custom_lead_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LeadBasicSection extends StatelessWidget {
  final void Function(String?) onSavedName;
  final void Function(String?) onSavedAssignedTo;
  final void Function(String?) onSavedPhone;
  final void Function(String?) onStatusChanged;

  const LeadBasicSection({
    super.key,
    required this.onSavedName,
    required this.onSavedAssignedTo,
    required this.onSavedPhone,
    required this.onStatusChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomLeadsFormField(
          fieldLabel: 'Name *',
          labelText: 'Enter a Name',
          validator: (val) =>
              val == null || val.isEmpty ? 'Name is required' : null,
          onSaved: onSavedName,
        ),
        SizedBox(height: 5.h),
        CustomLeadsFormField(
          fieldLabel: 'Assigned to *',
          labelText: 'Choose a Sales Person',
          validator: (val) =>
              val == null || val.isEmpty ? 'Assigned To is required' : null,
          onSaved: onSavedAssignedTo,
        ),
        SizedBox(height: 5.h),
        const CustomLeadsFormField(
            fieldLabel: 'Gender', labelText: 'Choose a Gender'),
        SizedBox(height: 5.h),
        const CustomLeadsFormField(
            fieldLabel: 'Title', labelText: 'Choose a Title'),
        SizedBox(height: 5.h),
        Row(
          children: [
            Expanded(
              child: CustomLeadsFormField(
                fieldLabel: 'Phone',
                labelText: 'Optional',
                keyboardType: TextInputType.phone,
                onSaved: onSavedPhone,
              ),
            ),
          ],
        ),
        SizedBox(height: 5.h),
        const CustomLeadsFormField(
            fieldLabel: 'Email', labelText: 'Enter an Email'),
        const SizedBox(height: 15),
        DropdownButtonFormField<String>(
          dropdownColor: Colors.white,
          onChanged: onStatusChanged,
          validator: (val) => val == null ? 'Status is required' : null,
          decoration: InputDecoration(
            labelText: 'Status *',
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          ),
          items: LeadsEntity.statusOptions
              .map((status) => DropdownMenuItem<String>(
                    value: status,
                    child: Text(status),
                  ))
              .toList(),
        ),
      ],
    );
  }
}
