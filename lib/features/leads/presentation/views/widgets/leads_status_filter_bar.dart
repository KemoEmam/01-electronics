import 'package:electronics_task/features/leads/presentation/manager/leads_cubit/leads_cubit.dart';
import 'package:electronics_task/features/leads/presentation/views/widgets/icon_filter.dart';
import 'package:electronics_task/features/leads/presentation/views/widgets/status_filter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LeadsStatusFilterBar extends StatelessWidget {
  const LeadsStatusFilterBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      child: Row(
        children: [
          StatusFilter(
            label: 'ALL',
            color: Colors.black87,
            textColor: Colors.white,
            onTap: () => context.read<LeadsCubit>().clearSearch(),
          ),
          StatusFilter(
            label: 'NEW',
            color: const Color(0xFF8ebb8e),
            textColor: Colors.black,
            onTap: () => context.read<LeadsCubit>().filterByStatus('NEW'),
          ),
          StatusFilter(
            label: 'HOT',
            color: const Color(0xFFcd5c5c),
            textColor: Colors.black,
            onTap: () => context.read<LeadsCubit>().filterByStatus('HOT'),
          ),
          StatusFilter(
            label: 'WARM',
            color: const Color(0xFFfe8b00),
            textColor: Colors.black,
            onTap: () => context.read<LeadsCubit>().filterByStatus('WARM'),
          ),
          StatusFilter(
            label: 'COLD',
            color: const Color(0xFF87ceeb),
            textColor: Colors.black,
            onTap: () => context.read<LeadsCubit>().filterByStatus('COLD'),
          ),
          const IconFilter(icon: Icons.filter_list),
        ],
      ),
    );
  }
}
