import 'package:electronics_task/core/routes/routes.dart';
import 'package:electronics_task/core/themes/styles/app_images.dart';
import 'package:electronics_task/features/auth/presentation/manager/signin_cubit/signin_cubit.dart';
import 'package:electronics_task/features/dashboard/presentations/views/widgets/drawer_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class DashboardDrawer extends StatelessWidget {
  const DashboardDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Drawer(
      child: Column(
        children: [
          Container(
            height: screenHeight / 2.5,
            width: double.infinity,
            color: const Color(0xff105a97),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(32.0),
                child: Image.asset(
                  AppImages.imagesNegative,
                  width: 180,
                  height: 180,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              color: Theme.of(context).scaffoldBackgroundColor,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: MediaQuery.of(context).size.height * 0.1),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DrawerItem(
                      icon: Icons.home_outlined,
                      label: 'H O M E',
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                    const SizedBox(height: 12),
                    DrawerItem(
                      icon: Icons.logout,
                      iconColor: Colors.redAccent,
                      label: 'S I G N  O U T',
                      onTap: () async {
                        final shouldLogout = await showDialog<bool>(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: const Text('Logout'),
                            content: const Text(
                                'Are you sure you want to sign out?'),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context, false),
                                child: const Text('Cancel'),
                              ),
                              TextButton(
                                onPressed: () => Navigator.pop(context, true),
                                child: const Text('Logout'),
                              ),
                            ],
                          ),
                        );

                        if (shouldLogout == true) {
                          // ignore: use_build_context_synchronously
                          await context.read<SigninCubit>().signOut();
                          // ignore: use_build_context_synchronously
                          context.go(Routes.signin);
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
