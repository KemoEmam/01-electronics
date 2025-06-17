import 'package:electronics_task/features/auth/presentation/views/widgets/signup_view_body_bloc_consumer.dart';
import 'package:flutter/material.dart';

class SigninupView extends StatelessWidget {
  const SigninupView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SignupViewBodyBlocConsumer(),
      ),
    );
  }
}
