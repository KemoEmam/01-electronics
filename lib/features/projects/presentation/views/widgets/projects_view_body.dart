import 'package:electronics_task/core/constants/constants.dart';
import 'package:electronics_task/core/themes/styles/app_text_styles.dart';
import 'package:electronics_task/features/projects/presentation/views/domain/entities/project_entity.dart';
import 'package:electronics_task/features/projects/presentation/views/widgets/project_card.dart';
import 'package:electronics_task/features/projects/presentation/views/widgets/state_card.dart';
import 'package:flutter/material.dart';

class ProjectsViewBody extends StatelessWidget {
  const ProjectsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final cardWidth = (screenWidth - 64) / 2;

    final List<ProjectEntity> recentProjects = [
      ProjectEntity(
        title: 'CRM Redesign',
        updatedDate: 'June 20, 2025',
        status: 'Active',
        statusColor: Colors.green,
      ),
      ProjectEntity(
        title: 'Sales Pipeline',
        updatedDate: 'June 18, 2025',
        status: 'Pending',
        statusColor: Colors.orange,
      ),
      ProjectEntity(
        title: 'Client Onboarding',
        updatedDate: 'June 15, 2025',
        status: 'Completed',
        statusColor: Colors.blueGrey,
      ),
    ];

    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: kVerticalPadding),
      child: Center(
        child: Column(
          children: [
            Wrap(
              spacing: 16,
              runSpacing: 16,
              children: [
                StatCard(
                  title: 'Project Fields',
                  subtitle: 'Track and manage your project data.',
                  icon: Icons.dashboard_customize,
                  width: cardWidth,
                ),
                StatCard(
                  title: 'JIRA Import',
                  subtitle: 'Import projects and issues from JIRA.',
                  icon: Icons.import_export,
                  width: cardWidth,
                ),
                StatCard(
                  title: 'Project\nCollaboration',
                  subtitle: 'Work together on projects seamlessly.',
                  icon: Icons.people_outline,
                  width: cardWidth,
                ),
                StatCard(
                  title: 'Workload\nManagment',
                  subtitle: 'Distribute tasks and balance team effort.',
                  icon: Icons.timeline,
                  width: cardWidth,
                ),
              ],
            ),
            const SizedBox(height: 26),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Recent Projects',
                  style: AppTextStyles.interSemiBold16.copyWith(
                    color: Colors.black87,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12),
            ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: recentProjects.length,
              separatorBuilder: (_, __) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                return ProjectCard(project: recentProjects[index]);
              },
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
