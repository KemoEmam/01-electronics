import 'package:electronics_task/core/themes/styles/app_colors.dart';
import 'package:electronics_task/core/themes/styles/app_text_styles.dart';
import 'package:electronics_task/features/actions/domain/actions_entity.dart';
import 'package:electronics_task/features/actions/presentation/manager/action_cubit/action_cubit.dart';
import 'package:electronics_task/features/leads/presentation/views/widgets/custom_lead_form_field.dart';
import 'package:electronics_task/features/leads/presentation/views/widgets/lead_info_card.dart';
import 'package:electronics_task/features/leads/presentation/views/widgets/lead_section_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class AddNewActionViewBody extends StatefulWidget {
  const AddNewActionViewBody({super.key});

  @override
  State<AddNewActionViewBody> createState() => _AddNewActionViewBodyState();
}

class _AddNewActionViewBodyState extends State<AddNewActionViewBody> {
  final _formKey = GlobalKey<FormState>();
  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;

  String? leadName, assignedTo, lastActionType, nextActionType, notes;
  DateTime? lastActionDate, nextActionDate;
  TimeOfDay? lastActionTime, nextActionTime;

  void _submitAction() {
    if (!_formKey.currentState!.validate()) {
      setState(() => _autovalidateMode = AutovalidateMode.always);
      return;
    }

    if (lastActionType == null ||
        lastActionDate == null ||
        lastActionTime == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Please complete all required Last Action fields."),
        ),
      );
      return;
    }

    _formKey.currentState!.save();

    final color = ActionEntity.actionTypeColors[lastActionType] ?? Colors.teal;
    final cubit = context.read<ActionCubit>();

    final action = ActionEntity(
      leadName: leadName,
      assignedTo: assignedTo,
      lastActionType: lastActionType,
      lastActionDate: lastActionDate,
      lastActionTime: lastActionTime,
      nextActionType: nextActionType,
      nextActionDate: nextActionDate,
      nextActionTime: nextActionTime,
      notes: notes,
      statusColor: color,
    );

    cubit.addAction(action);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    //*  To be refactored
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Form(
        key: _formKey,
        autovalidateMode: _autovalidateMode,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const LeadSectionTitle('BASIC INFO'),
            const SizedBox(height: 8),
            LeadInfoCard(
              backgroundColor: Colors.white,
              children: [
                CustomLeadsFormField(
                  fieldLabel: 'Name *',
                  labelText: 'Choose a Lead',
                  validator: (val) =>
                      val == null || val.isEmpty ? 'Required' : null,
                  onSaved: (val) => leadName = val?.trim(),
                ),
                CustomLeadsFormField(
                  fieldLabel: 'Assigned To',
                  labelText: 'Optional',
                  onSaved: (val) => assignedTo = val?.trim(),
                  validator: (val) =>
                      val == null || val.isEmpty ? 'Required' : null,
                ),
              ],
            ),
            const SizedBox(height: 16),
            LeadSectionTitle('NEW ACTION',
                backgroundColor: const Color(0xff61a3bb)),
            const SizedBox(height: 8),
            LeadInfoCard(
              backgroundColor: const Color(0xff61a3bb),
              children: [
                DropdownButtonFormField<String>(
                  value: lastActionType,
                  decoration: const InputDecoration(labelText: 'Type *'),
                  validator: (val) =>
                      val == null || val.isEmpty ? 'Required' : null,
                  items: ActionEntity.actionTypes
                      .map((type) => DropdownMenuItem(
                            value: type,
                            child: Text(type),
                          ))
                      .toList(),
                  onChanged: (val) => setState(() => lastActionType = val),
                  onSaved: (val) => lastActionType = val,
                ),
                CustomLeadsFormField(
                  fieldLabel: 'Day *',
                  labelText: lastActionDate != null
                      ? DateFormat('y/MM/dd').format(lastActionDate!)
                      : 'Pick a date',
                  readOnly: true,
                  validator: (_) => lastActionDate == null ? 'Required' : null,
                  onTap: () async {
                    final picked = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2020),
                      lastDate: DateTime(2030),
                    );
                    if (picked != null) setState(() => lastActionDate = picked);
                  },
                ),
                CustomLeadsFormField(
                  fieldLabel: 'Time *',
                  labelText: lastActionTime != null
                      ? lastActionTime!.format(context)
                      : 'Pick a time',
                  readOnly: true,
                  validator: (_) => lastActionTime == null ? 'Required' : null,
                  onTap: () async {
                    final picked = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.now(),
                    );
                    if (picked != null) setState(() => lastActionTime = picked);
                  },
                ),
              ],
            ),
            const SizedBox(height: 16),
            LeadSectionTitle('NEXT ACTION',
                backgroundColor: const Color(0xffb7bbc4)),
            const SizedBox(height: 8),
            LeadInfoCard(
              backgroundColor: const Color(0xffb7bbc4),
              children: [
                DropdownButtonFormField<String>(
                  value: nextActionType,
                  decoration: const InputDecoration(labelText: 'Type'),
                  items: ActionEntity.actionTypes
                      .map((type) => DropdownMenuItem(
                            value: type,
                            child: Text(type),
                          ))
                      .toList(),
                  onChanged: (val) => setState(() => nextActionType = val),
                  onSaved: (val) => nextActionType = val,
                ),
                CustomLeadsFormField(
                  fieldLabel: 'Day',
                  labelText: nextActionDate != null
                      ? DateFormat('y/MM/dd').format(nextActionDate!)
                      : 'Pick a date',
                  readOnly: true,
                  onTap: () async {
                    final picked = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2020),
                      lastDate: DateTime(2030),
                    );
                    if (picked != null) setState(() => nextActionDate = picked);
                  },
                ),
                CustomLeadsFormField(
                  fieldLabel: 'Time',
                  labelText: nextActionTime != null
                      ? nextActionTime!.format(context)
                      : 'Pick a time',
                  readOnly: true,
                  onTap: () async {
                    final picked = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.now(),
                    );
                    if (picked != null) setState(() => nextActionTime = picked);
                  },
                ),
              ],
            ),
            const SizedBox(height: 16),
            const LeadSectionTitle('ACCOUNT NOTES'),
            const SizedBox(height: 8),
            LeadInfoCard(
              backgroundColor: AppColors.primaryColor.withValues(alpha: 0.7),
              children: [
                CustomLeadsFormField(
                  fieldLabel: 'Enter Notes',
                  labelText: 'Add any notes...',
                  maxLines: 5,
                  fieldHeight: 120,
                  keyboardType: TextInputType.multiline,
                  onSaved: (val) => notes = val,
                ),
              ],
            ),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton.icon(
                onPressed: _submitAction,
                icon: const Icon(Icons.add),
                label: Text(
                  "Save Action",
                  style: AppTextStyles.interSemiBold14.copyWith(
                    color: Colors.white,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryColor,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
