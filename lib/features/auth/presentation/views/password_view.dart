import 'package:electronics_task/features/auth/presentation/views/widgets/password_view_body_bloc_consumer.dart';
import 'package:flutter/material.dart';

class PasswordView extends StatelessWidget {
  const PasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PasswordViewBodyBlocConsumer(),
      ),
    );
  }
}
