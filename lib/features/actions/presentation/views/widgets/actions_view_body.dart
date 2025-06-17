import 'package:electronics_task/features/actions/presentation/manager/action_cubit/action_cubit.dart';
import 'package:electronics_task/features/actions/presentation/views/widgets/actions_card.dart';
import 'package:electronics_task/features/leads/presentation/views/widgets/search_leads_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class ActionsViewBody extends StatefulWidget {
  const ActionsViewBody({super.key});

  @override
  State<ActionsViewBody> createState() => _ActionsViewBodyState();
}

class _ActionsViewBodyState extends State<ActionsViewBody> {
  DateTime selectedDate = DateTime.now();

  Future<void> _pickDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final formattedDate = DateFormat('dd/MM/yyyy').format(selectedDate);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Field
            BlocBuilder<ActionCubit, ActionState>(
              builder: (context, state) {
                final cubit = context.read<ActionCubit>();

                final items = state is ActionLoaded
                    ? state.actions
                        .map((value) => value.leadName ?? '')
                        .where((value) => value.isNotEmpty)
                        .toList()
                    : [];

                return SearchLeadsWidget(
                  hintText: "Search By Name...",
                  items: List<String>.from(items),
                  onSelected: (leadName) => cubit.searchActionByName(leadName),
                  onClearSearch: () => cubit.clearSearch(),
                );
              },
            ),

            const SizedBox(height: 15),

            // Date Picker
            InkWell(
              onTap: () => _pickDate(context),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black26),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  formattedDate,
                  style: const TextStyle(fontSize: 14),
                ),
              ),
            ),
            const SizedBox(height: 25),

            const Text(
              "Meetings To attend",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
            ),
            const SizedBox(height: 10),

            BlocBuilder<ActionCubit, ActionState>(
              builder: (context, state) {
                if (state is ActionLoaded && state.actions.isNotEmpty) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 10),
                      ...state.actions.map((action) => ActionsCard(
                            name: action.leadName ?? '',
                            time: action.lastActionTime?.format(context) ?? '-',
                            date: action.lastActionDate != null
                                ? DateFormat('dd/MM/yyyy')
                                    .format(action.lastActionDate!)
                                : '-',
                            actionType: action.lastActionType ?? 'N/A',
                            assignedTo: action.assignedTo,
                            statusColor: action.statusColor ?? Colors.orange,
                          )),
                    ],
                  );
                } else {
                  return Column(
                    children: [
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.2),
                      Icon(Icons.event_busy, size: 72, color: Colors.grey),
                      SizedBox(height: 12),
                      Center(
                        child: Text(
                          "No meetings for this day.\nTap the + icon to add one.",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 16, color: Colors.black54),
                        ),
                      ),
                    ],
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
