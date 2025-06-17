import 'package:electronics_task/core/components/custom_button.dart';
import 'package:electronics_task/core/routes/routes.dart';
import 'package:electronics_task/features/auth/presentation/manager/signin_cubit/signin_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ProjectsView extends StatelessWidget {
  const ProjectsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Epic Projects View 😎'),
            const SizedBox(height: 20),
            SizedBox(
              width: 150,
              child: CustomButton(
                text: 'Sign Out',
                onPressed: () async {
                  final shouldLogout = await showDialog<bool>(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('Logout'),
                      content: const Text('Are you sure you want to sign out?'),
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
                buttonColor: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
