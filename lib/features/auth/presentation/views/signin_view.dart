import 'package:electronics_task/features/auth/presentation/views/widgets/signin_view_body_bloc_consumer.dart';
import 'package:flutter/material.dart';

class SigninView extends StatelessWidget {
  const SigninView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: SigninViewBodyBlocConsumer(),
      ),
    );
  }
}
