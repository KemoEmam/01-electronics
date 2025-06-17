import 'package:electronics_task/core/components/custom_progress_hud.dart';
import 'package:electronics_task/core/components/show_snack_bar.dart';
import 'package:electronics_task/core/routes/routes.dart';
import 'package:electronics_task/core/themes/styles/app_colors.dart';
import 'package:electronics_task/features/auth/presentation/manager/signup/signup_cubit.dart';
import 'package:electronics_task/features/auth/presentation/views/widgets/signup_view_body.dart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SignupViewBodyBlocConsumer extends StatelessWidget {
  const SignupViewBodyBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignupCubit, SignupState>(
      listener: (context, state) {
        if (state is SignupSuccess) {
          showSnackBar(
            context: context,
            title: "Success",
            message: "Account created successfully",
            backgroundColor: AppColors.successColor,
            icon: Icons.check,
          );
          SchedulerBinding.instance.addPostFrameCallback((_) {
            Future.delayed(
              const Duration(seconds: 2),
              () {
                if (context.mounted) {
                  context.go(Routes.signin);
                }
              },
            );
          });
        } else if (state is SignupFailure) {
          showSnackBar(
            context: context,
            title: "Error",
            message: state.message,
            backgroundColor: AppColors.errorColor,
            icon: Icons.error,
          );
        }
      },
      builder: (context, state) {
        return CustomProgressHud(
          isLoading: state is SignupLoading ? true : false,
          child: const SignupViewBody(),
        );
      },
    );
  }
}
