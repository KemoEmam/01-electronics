import 'package:electronics_task/core/themes/styles/app_colors.dart';
import 'package:electronics_task/core/themes/styles/app_text_styles.dart';
import 'package:electronics_task/features/leads/domain/entities/leads_entity.dart';
import 'package:electronics_task/features/leads/presentation/manager/leads_cubit/leads_cubit.dart';
import 'package:electronics_task/features/leads/presentation/views/widgets/lead_account_section.dart';
import 'package:electronics_task/features/leads/presentation/views/widgets/lead_basic_section.dart';
import 'package:electronics_task/features/leads/presentation/views/widgets/lead_section_title.dart';
import 'package:electronics_task/features/leads/presentation/views/widgets/leads_tag_filter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddNewLeadViewBody extends StatefulWidget {
  const AddNewLeadViewBody({super.key});

  @override
  State<AddNewLeadViewBody> createState() => _AddNewLeadViewBodyState();
}

class _AddNewLeadViewBodyState extends State<AddNewLeadViewBody> {
  final _formKey = GlobalKey<FormState>();
  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;

  String? name, phone, city, project, assignedTo, budgetMin, budgetMax, status;

  void _submitLead() {
    if (!_formKey.currentState!.validate()) {
      setState(() => _autovalidateMode = AutovalidateMode.always);
      return;
    }
    _formKey.currentState!.save();

    final color = LeadsEntity.statusColors[status] ?? Colors.teal;
    final cubit = context.read<LeadsCubit>();

    final lead = LeadsEntity(
      name: name,
      phone: phone,
      city: city,
      project: project,
      budget: (budgetMin != null && budgetMax != null)
          ? '\$${budgetMin}M - \$${budgetMax}M'
          : null,
      assignedTo: assignedTo,
      barColor: color,
      tags: [
        if (status != null)
          LeadTagFilter(
            label: status!,
            backgroundColor: color,
            textColor: Colors.white,
          ),
        LeadTagFilter(
            label: 'CAMPAIGN',
            backgroundColor: Colors.white,
            textColor: Colors.black),
        LeadTagFilter(
            label: 'ACTION TAKEN',
            backgroundColor: Colors.white,
            textColor: Colors.black),
      ],
    );

    cubit.addLead(lead);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Form(
        key: _formKey,
        autovalidateMode: _autovalidateMode,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const LeadSectionTitle('BASIC INFO'),
            LeadBasicSection(
              onSavedName: (val) => name = val?.trim(),
              onSavedAssignedTo: (val) => assignedTo = val?.trim(),
              onSavedPhone: (val) => phone = val?.trim(),
              onStatusChanged: (val) => setState(() => status = val),
            ),
            const SizedBox(height: 30),
            const LeadSectionTitle('ACCOUNT INTERESTS'),
            LeadAccountSection(
              onSavedCity: (val) => city = val?.trim(),
              onSavedProject: (val) => project = val?.trim(),
              onSavedBudgetMin: (val) => budgetMin = val?.trim(),
              onSavedBudgetMax: (val) => budgetMax = val?.trim(),
            ),
            const SizedBox(height: 20),
            Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(minWidth: 180),
                child: ElevatedButton.icon(
                  onPressed: _submitLead,
                  icon: const Icon(Icons.add, color: Colors.white),
                  label: Text(
                    "Add Lead",
                    style: AppTextStyles.interSemiBold14
                        .copyWith(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 12),
                    backgroundColor: AppColors.primaryColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
