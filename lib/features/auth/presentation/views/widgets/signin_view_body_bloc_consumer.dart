import 'package:electronics_task/core/components/custom_progress_hud.dart';
import 'package:electronics_task/core/components/show_snack_bar.dart';
import 'package:electronics_task/core/routes/routes.dart';
import 'package:electronics_task/features/auth/presentation/manager/signin_cubit/signin_cubit.dart';
import 'package:electronics_task/features/auth/presentation/views/widgets/signin_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SigninViewBodyBlocConsumer extends StatelessWidget {
  const SigninViewBodyBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SigninCubit, SigninState>(
      listener: (context, state) {
        if (state is SigninSuccess) {
          context.go(Routes.dashboard);
        }

        if (state is SigninFailure) {
          showSnackBar(
            context: context,
            title: 'Error',
            message: state.message,
            backgroundColor: Colors.red,
            icon: Icons.error,
          );
        }
      },
      builder: (context, state) {
        return CustomProgressHud(
          isLoading: state is SigninLoading ? true : false,
          child: const SigninViewBody(),
        );
      },
    );
  }
}
