import 'package:electronics_task/core/helper/functions.dart';
import 'package:electronics_task/core/themes/styles/app_colors.dart';
import 'package:electronics_task/core/themes/styles/app_text_styles.dart';
import 'package:electronics_task/features/dashboard/presentations/views/widgets/leads_chart_section.dart';
import 'package:electronics_task/features/dashboard/presentations/views/widgets/summary_tile_widget.dart';
import 'package:electronics_task/features/dashboard/presentations/views/widgets/weekly_activity_section.dart';
import 'package:flutter/material.dart';

class DashboardViewBody extends StatelessWidget {
  const DashboardViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final user = getUser();
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 36),
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: const BorderRadius.vertical(
                    bottom: Radius.circular(24),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Builder(
                            builder: (context) => IconButton(
                              icon: const Icon(Icons.menu_rounded,
                                  color: Colors.white),
                              onPressed: () {
                                Scaffold.of(context).openDrawer();
                              },
                              padding: EdgeInsets.zero,
                              constraints: const BoxConstraints(),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                _getGreeting(),
                                style: const TextStyle(
                                  color: Colors.white70,
                                  fontSize: 14,
                                ),
                              ),
                              const SizedBox(height: 6),
                              Text(
                                'Hi ${user.name} 👋',
                                style: AppTextStyles.interBold18.copyWith(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                            ],
                          ),
                        ],
                      ),
                      Transform.translate(
                        offset: const Offset(0, 12),
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 20,
                              backgroundColor:
                                  Colors.white.withValues(alpha: 0.2),
                              child: IconButton(
                                icon: const Icon(Icons.notifications_none,
                                    color: Colors.white, size: 25),
                                onPressed: () {},
                              ),
                            ),
                            const SizedBox(width: 6),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 16),
                    Wrap(
                      spacing: 25,
                      runSpacing: 14,
                      children: const [
                        SummaryTile(
                          backgroundColor: Color(0xFFE0F0FF),
                          title: 'Leads',
                          count: '42',
                          icon: Icons.people_alt,
                          color: Colors.blue,
                        ),
                        SummaryTile(
                          title: 'Actions',
                          count: '15',
                          icon: Icons.check_circle,
                          color: Colors.green,
                        ),
                        SummaryTile(
                          title: 'Clients',
                          count: '12',
                          icon: Icons.person_outline,
                          color: Colors.orange,
                        ),
                        SummaryTile(
                          title: 'Meetings',
                          count: '3',
                          icon: Icons.calendar_today,
                          color: Colors.purple,
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    const LeadsChartSection(),
                    const SizedBox(height: 24),
                    const WeeklyActivitySection(),
                    const SizedBox(height: 24),
                    Text(
                      'Upcoming Action',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Card(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 2,
                      child: ListTile(
                        leading: const Icon(Icons.phone, color: Colors.blue),
                        title: const Text('Call Kemo E.'),
                        subtitle: const Text('June 17 at 12:30 PM'),
                        trailing: IconButton(
                          icon: const Icon(Icons.more_vert),
                          onPressed: () {},
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  String _getGreeting() {
    final hour = DateTime.now().hour;
    if (hour < 12) return 'Good morning';
    if (hour < 17) return 'Good afternoon';
    return 'Good evening';
  }
}
