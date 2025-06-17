import 'package:electronics_task/core/components/custom_button.dart';
import 'package:electronics_task/core/components/custom_text_form_field.dart';
import 'package:electronics_task/core/constants/constants.dart';
import 'package:electronics_task/core/themes/styles/app_colors.dart';
import 'package:electronics_task/core/themes/styles/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../manager/password/password_cubit.dart';

class PasswordViewBody extends StatefulWidget {
  const PasswordViewBody({super.key});

  @override
  State<PasswordViewBody> createState() => _PasswordViewBodyState();
}

class _PasswordViewBodyState extends State<PasswordViewBody> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;
  late String email;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: kHorizontalPadding, vertical: kVerticalPadding),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          autovalidateMode: _autovalidateMode,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Forgot Password',
                style: AppTextStyles.interBold24.copyWith(
                  color: AppColors.primaryColor,
                ),
              ),
              SizedBox(height: 20.h),
              Text(
                "At our app, we take the security of your information seriously. Enter associated email address to reset your password.",
                style: AppTextStyles.interRegular12.copyWith(
                  color: AppColors.textColor,
                  height: 1.6,
                ),
              ),
              SizedBox(height: 40.h),
              CustomTextFormField(
                onSaved: (value) {
                  email = value!.trim();
                },
                labelText: 'Email',
                labelTextStyle: AppTextStyles.interMedium12
                    .copyWith(color: const Color(0xffC2C2C2)),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.45,
              ),
              CustomButton(
                text: 'Reset Password',
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    context.read<PasswordCubit>().resetPassword(email);
                  }
                },
                buttonColor: AppColors.primaryColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
