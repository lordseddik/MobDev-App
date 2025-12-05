import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../constants/app_colors.dart';

/// Reusable custom text field widget for the application
class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final String? labelText;
  final IconData? prefixIcon;
  final Widget? suffixIcon;
  final bool obscureText;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final void Function(String)? onSubmitted;
  final int? maxLines;
  final int? minLines;
  final int? maxLength;
  final bool enabled;
  final bool readOnly;
  final EdgeInsetsGeometry? contentPadding;
  final Color? fillColor;
  final Color? hintColor;
  final Color? textColor;
  final Color? borderColor;
  final Color? focusedBorderColor;
  final double? borderRadius;
  final TextStyle? textStyle;
  final TextStyle? hintStyle;
  final List<TextInputFormatter>? inputFormatters;
  final FocusNode? focusNode;
  final TextCapitalization textCapitalization;

  const CustomTextField({
    super.key,
    this.controller,
    this.hintText,
    this.labelText,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
    this.keyboardType,
    this.validator,
    this.onChanged,
    this.onSubmitted,
    this.maxLines = 1,
    this.minLines,
    this.maxLength,
    this.enabled = true,
    this.readOnly = false,
    this.contentPadding,
    this.fillColor,
    this.hintColor,
    this.textColor,
    this.borderColor,
    this.focusedBorderColor,
    this.borderRadius,
    this.textStyle,
    this.hintStyle,
    this.inputFormatters,
    this.focusNode,
    this.textCapitalization = TextCapitalization.none,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      validator: validator,
      onChanged: onChanged,
      onFieldSubmitted: onSubmitted,
      maxLines: obscureText ? 1 : maxLines,
      minLines: minLines,
      maxLength: maxLength,
      enabled: enabled,
      readOnly: readOnly,
      focusNode: focusNode,
      textCapitalization: textCapitalization,
      inputFormatters: inputFormatters,
      style: textStyle ?? TextStyle(color: textColor ?? AppColors.textPrimary),
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: TextStyle(color: hintColor ?? AppColors.textHint),
        hintText: hintText,
        hintStyle:
            hintStyle ?? TextStyle(color: hintColor ?? AppColors.textHint),
        prefixIcon: prefixIcon != null
            ? Icon(prefixIcon, color: hintColor ?? AppColors.textHint)
            : null,
        suffixIcon: suffixIcon,
        filled: true,
        fillColor: fillColor ?? AppColors.inputBackground,
        contentPadding:
            contentPadding ??
            const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 10),
          borderSide: BorderSide(color: borderColor ?? AppColors.inputBorder),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 10),
          borderSide: BorderSide(
            color: focusedBorderColor ?? AppColors.inputFocusedBorder,
            width: 2,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 10),
          borderSide: const BorderSide(color: AppColors.error),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 10),
          borderSide: const BorderSide(color: AppColors.error, width: 2),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 10),
          borderSide: BorderSide(color: borderColor ?? AppColors.inputBorder),
        ),
        counterStyle: TextStyle(color: hintColor ?? AppColors.textHint),
      ),
    );
  }
}
