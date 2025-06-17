import 'package:electronics_task/core/themes/styles/app_colors.dart';
import 'package:electronics_task/core/themes/styles/app_text_styles.dart';
import 'package:flutter/material.dart';

class CustomLeadsFormField extends StatelessWidget {
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
  final int? maxLines;

  final String? fieldLabel;
  final double fieldHeight;

  const CustomLeadsFormField({
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
    this.enabledBorderColor = Colors.black26,
    this.suffixIcon,
    this.prefixIconColor,
    this.suffixIconColor,
    this.onSaved,
    this.borderRadius = 8,
    this.fillColor,
    this.regex,
    this.regexErrorMessage,
    this.onChanged,
    this.onTap,
    this.readOnly = false,
    this.fieldLabel,
    this.fieldHeight = 55,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (fieldLabel != null)
          Padding(
            padding: const EdgeInsets.only(bottom: 6),
            child: Text(
              fieldLabel!,
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
            ),
          ),
        TextFormField(
          maxLines: maxLines,
          readOnly: readOnly,
          onTap: onTap,
          onChanged: onChanged,
          onSaved: onSaved,
          validator: validator,
          controller: controller,
          keyboardType: keyboardType,
          obscureText: obscureText,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          style: const TextStyle(fontSize: 12),
          decoration: InputDecoration(
            labelText: labelText,
            labelStyle: labelTextStyle ??
                AppTextStyles.interRegular12.copyWith(color: Colors.black45),
            prefixIcon: prefixIcon,
            prefixIconColor: prefixIconColor,
            suffixIcon: suffixIcon,
            suffixIconColor: suffixIconColor ?? Colors.grey,
            fillColor: fillColor,
            filled: fillColor != null,
            border: _borderBuilder(borderColor),
            focusedBorder: _borderBuilder(focusedBorderColor),
            enabledBorder: _borderBuilder(enabledBorderColor),
            contentPadding: EdgeInsets.symmetric(
                horizontal: 12, vertical: (fieldHeight - 30) / 2),
          ),
        )
      ],
    );
  }

  OutlineInputBorder _borderBuilder(Color color, {double width = 1.2}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(borderRadius),
      borderSide: BorderSide(color: color, width: width),
    );
  }
}
