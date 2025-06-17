import 'package:electronics_task/core/components/show_snack_bar.dart';
import 'package:electronics_task/core/themes/styles/app_colors.dart';
import 'package:electronics_task/features/auth/presentation/manager/password/password_cubit.dart';
import 'package:electronics_task/features/auth/presentation/views/widgets/password_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PasswordViewBodyBlocConsumer extends StatelessWidget {
  const PasswordViewBodyBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PasswordCubit, PasswordState>(
      listener: (context, state) {
        if (state is PasswordSuccess) {
          showSnackBar(
            context: context,
            title: "Success",
            message:
                "Password reset link sent to your email. Kindly check your inbox.",
            backgroundColor: AppColors.successColor,
            icon: Icons.check,
          );
        } else if (state is PasswordFailure) {
          showSnackBar(
            context: context,
            title: "Error",
            message: state.message,
            backgroundColor: AppColors.errorColor,
            icon: Icons.error,
          );
        }
      },
      builder: (context, state) => const PasswordViewBody(),
    );
  }
}
