import 'package:electronics_task/core/components/custom_button.dart';
import 'package:electronics_task/core/constants/constants.dart';
import 'package:electronics_task/core/routes/routes.dart';
import 'package:electronics_task/core/themes/styles/app_colors.dart';
import 'package:electronics_task/core/themes/styles/app_text_styles.dart';
import 'package:electronics_task/features/auth/presentation/manager/signin_cubit/signin_cubit.dart';
import 'package:electronics_task/features/auth/presentation/views/widgets/email_field.dart';
import 'package:electronics_task/features/auth/presentation/views/widgets/password_field.dart';
import 'package:electronics_task/features/auth/presentation/views/widgets/terms_and_conditions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class SigninViewBody extends StatefulWidget {
  const SigninViewBody({super.key});

  @override
  State<SigninViewBody> createState() => _SigninViewBodyState();
}

class _SigninViewBodyState extends State<SigninViewBody> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;
  late String email, password;
  bool _obscureText = true;
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
                'Welcome Back',
                style: AppTextStyles.interBold24.copyWith(
                  color: AppColors.primaryColor,
                ),
              ),
              SizedBox(height: 20.h),
              Text(
                "We're excited to have you back, can't wait to\nsee what you've been up to since you last\nlogged in.",
                style: AppTextStyles.interRegular12.copyWith(
                  color: AppColors.textColor,
                  height: 1.6,
                ),
              ),
              SizedBox(height: 40.h),
              EmailField(
                labelText: 'Email',
                labelTextStyle: AppTextStyles.interMedium12
                    .copyWith(color: const Color(0xffC2C2C2)),
                onSaved: (value) {
                  email = value!.trim();
                },
              ),
              SizedBox(height: 20.h),
              PasswordField(
                obscureText: _obscureText,
                onToggleObscure: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
                onSaved: (value) {
                  password = value!.trim();
                },
              ),
              SizedBox(height: 10.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      context.push(Routes.password);
                    },
                    child: Text(
                      'Forgot Password?',
                      style: AppTextStyles.interRegular12.copyWith(
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.h),
              CustomButton(
                text: 'Login',
                onPressed: () {
                  FocusScope.of(context).unfocus();
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();

                    context
                        .read<SigninCubit>()
                        .signInWithEmailAndPassword(email, password);
                  }
                },
                buttonColor: AppColors.primaryColor,
              ),
              SizedBox(height: 20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Don\'t have an account?',
                    style: AppTextStyles.interRegular12.copyWith(
                      color: AppColors.textColor,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      context.push(Routes.signup);
                    },
                    child: Text(
                      'Sign Up',
                      style: AppTextStyles.interMedium12.copyWith(
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 40.h),
              TermsAndConditions(
                firstPartStyle: AppTextStyles.interRegular12.copyWith(
                  color: AppColors.textColor,
                ),
                secondPartStyle: AppTextStyles.interMedium12.copyWith(
                  color: AppColors.primaryColor,
                ),
                thirdPartStyle: AppTextStyles.interRegular12.copyWith(
                  color: AppColors.textColor,
                ),
                fourthPartStyle: AppTextStyles.interRegular12.copyWith(
                  color: AppColors.textColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
