import 'package:electronics_task/features/leads/presentation/manager/leads_cubit/leads_cubit.dart';
import 'package:electronics_task/features/leads/presentation/views/widgets/lead_card.dart';
import 'package:electronics_task/features/leads/presentation/views/widgets/leads_status_filter_bar.dart';
import 'package:electronics_task/features/leads/presentation/views/widgets/search_leads_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LeadsViewBody extends StatelessWidget {
  const LeadsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 8.h),
      child: Column(
        children: [
          BlocBuilder<LeadsCubit, LeadsState>(
            builder: (context, state) {
              final cubit = context.read<LeadsCubit>();

              final items = state is LeadsLoaded
                  ? state.leads
                      .map((lead) => lead.name ?? '')
                      .where((n) => n.isNotEmpty)
                      .toList()
                  : [];

              return SearchLeadsWidget(
                hintText: "Search leads...",
                items: items.cast<String>(),
                onSelected: (leadName) => cubit.searchLeadByName(leadName),
                onClearSearch: () => cubit.clearSearch(),
              );
            },
          ),
          SizedBox(height: 16.h),
          LeadsStatusFilterBar(),
          SizedBox(height: 12.h),
          Expanded(
            child: BlocBuilder<LeadsCubit, LeadsState>(
              builder: (context, state) {
                if (state is LeadsLoading) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (state is LeadsLoaded) {
                  final leads = state.leads;

                  if (leads.isEmpty) {
                    final cubit = context.read<LeadsCubit>();

                    final bool hasFilters = cubit.activeStatusFilter != null ||
                        (cubit.searchQuery?.isNotEmpty ?? false);

                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.info_outline,
                              size: 64, color: Colors.grey),
                          const SizedBox(height: 12),
                          Text(
                            hasFilters
                                ? "No leads match your current filter or search."
                                : "No leads found.\nTap the + icon to add one.",
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                fontSize: 16, color: Colors.black54),
                          ),
                        ],
                      ),
                    );
                  }

                  return ListView.builder(
                    itemCount: leads.length,
                    itemBuilder: (context, index) {
                      final lead = leads[index];
                      return LeadCard(
                        name: lead.name!,
                        phone: lead.phone,
                        city: lead.city,
                        project: lead.project,
                        budget: lead.budget,
                        assignedTo: lead.assignedTo,
                        barColor: lead.barColor,
                        tags: lead.tags,
                      );
                    },
                  );
                }

                return const SizedBox();
              },
            ),
          )
        ],
      ),
    );
  }
}
