import 'package:electronics_task/core/components/custom_button.dart';
import 'package:electronics_task/core/components/custom_text_form_field.dart';
import 'package:electronics_task/core/constants/constants.dart';
import 'package:electronics_task/core/routes/routes.dart';
import 'package:electronics_task/core/themes/styles/app_colors.dart';
import 'package:electronics_task/core/themes/styles/app_text_styles.dart';
import 'package:electronics_task/features/auth/presentation/manager/signup/signup_cubit.dart';
import 'package:electronics_task/features/auth/presentation/views/widgets/email_field.dart';
import 'package:electronics_task/features/auth/presentation/views/widgets/password_field.dart';
import 'package:electronics_task/features/auth/presentation/views/widgets/terms_and_conditions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class SignupViewBody extends StatefulWidget {
  const SignupViewBody({super.key});

  @override
  State<SignupViewBody> createState() => _SignupViewBodyState();
}

class _SignupViewBodyState extends State<SignupViewBody> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;
  late String name, email, password;
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
                'Create Account',
                style: AppTextStyles.interBold24.copyWith(
                  color: AppColors.primaryColor,
                ),
              ),
              SizedBox(height: 20.h),
              Text(
                "Sign up now and start exploring all that our app has to offer. We're excited to welcome you to our community!",
                style: AppTextStyles.interRegular12.copyWith(
                  color: AppColors.textColor,
                  height: 1.6,
                ),
              ),
              SizedBox(height: 40.h),
              CustomTextFormField(
                onSaved: (value) {
                  name = value!.trim();
                },
                labelText: 'Name',
                labelTextStyle: AppTextStyles.interMedium12
                    .copyWith(color: const Color(0xffC2C2C2)),
              ),
              SizedBox(height: 20.h),
              EmailField(
                labelText: 'Email',
                onSaved: (value) {
                  email = value!.trim();
                },
                labelTextStyle: AppTextStyles.interMedium12
                    .copyWith(color: const Color(0xffC2C2C2)),
              ),
              SizedBox(height: 20.h),
              PasswordField(
                  obscureText: _obscureText,
                  onSaved: (value) {
                    password = value!.trim();
                  },
                  onToggleObscure: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  }),
              SizedBox(height: 40.h),
              CustomButton(
                text: 'Sign Up',
                onPressed: () {
                  FocusScope.of(context).unfocus();
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();

                    context
                        .read<SignupCubit>()
                        .signUpWithEmailAndPassword(email, password, name);
                  }
                },
                buttonColor: AppColors.primaryColor,
              ),
              SizedBox(height: 20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account?',
                    style: AppTextStyles.interRegular12.copyWith(
                      color: AppColors.textColor,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      context.push(Routes.signin);
                    },
                    child: Text(
                      'Sign In',
                      style: AppTextStyles.interMedium12.copyWith(
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 40.h),
              TermsAndConditions(
                labelFirstPart: "By signing up, you agree to our ",
                labelSecondPart: "Terms & Conditions ",
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
