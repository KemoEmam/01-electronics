import 'package:electronics_task/core/themes/styles/app_colors.dart';
import 'package:electronics_task/core/themes/styles/app_text_styles.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final TextInputType keyboardType;
  final bool obscureText;
  final Widget? prefixIcon;
  final Color? prefixIconColor;
  final Widget? suffixIcon;
  final Color? suffixIconColor;
  final Color borderColor;
  final Color focusedBorderColor;
  final Color enabledBorderColor;
  final void Function(String?)? onSaved;
  final double borderRadius;
  final Color? fillColor;
  final RegExp? regex;
  final String? regexErrorMessage;
  final String labelText;
  final TextStyle? labelTextStyle;
  final void Function()? onTap;
  final bool readOnly;

  const CustomTextFormField({
    this.onTap,
    super.key,
    required this.labelText,
    this.labelTextStyle,
    this.controller,
    this.validator,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.prefixIcon,
    this.borderColor = Colors.grey,
    this.focusedBorderColor = AppColors.primaryColor,
    this.enabledBorderColor = const Color(0xffeff2f2),
    this.suffixIcon,
    this.prefixIconColor,
    this.suffixIconColor,
    this.onSaved,
    this.borderRadius = 16,
    this.fillColor,
    this.regex,
    this.regexErrorMessage,
    this.onChanged,
    this.readOnly = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: readOnly,
      onTap: onTap,
      onChanged: onChanged,
      onSaved: onSaved,
      validator: validator ?? _validate,
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: labelTextStyle ??
            AppTextStyles.interMedium14
                .copyWith(color: const Color(0xffC2C2C2)),
        prefixIcon: prefixIcon,
        prefixIconColor: prefixIconColor,
        suffixIcon: suffixIcon,
        suffixIconColor: suffixIconColor ?? Colors.grey,
        fillColor: fillColor,
        filled: fillColor != null,
        // border: _borderBuilder(borderColor),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(color: borderColor),
        ),
        focusedBorder: _borderBuilder(focusedBorderColor),
        enabledBorder: _borderBuilder(enabledBorderColor),
      ),
    );
  }

  OutlineInputBorder _borderBuilder(Color color, {double width = 1.2}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(borderRadius),
      borderSide: BorderSide(color: color, width: width),
    );
  }

  String? _validate(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "This field is required";
    }

    String trimmedValue = value.trim();

    if (regex != null && !regex!.hasMatch(trimmedValue)) {
      return regexErrorMessage ?? "Invalid input";
    }

    return null;
  }
}
