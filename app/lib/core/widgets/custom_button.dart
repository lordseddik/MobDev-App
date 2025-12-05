import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

/// Reusable custom button widget for the application
class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final Color? backgroundColor;
  final Color? textColor;
  final double? width;
  final double? height;
  final double? fontSize;
  final FontWeight? fontWeight;
  final EdgeInsetsGeometry? padding;
  final BorderRadius? borderRadius;
  final bool isLoading;
  final IconData? icon;
  final bool isOutlined;

  const CustomButton({
    super.key,
    required this.text,
    this.onPressed,
    this.backgroundColor,
    this.textColor,
    this.width,
    this.height,
    this.fontSize,
    this.fontWeight,
    this.padding,
    this.borderRadius,
    this.isLoading = false,
    this.icon,
    this.isOutlined = false,
  });

  @override
  Widget build(BuildContext context) {
    final buttonBackgroundColor = backgroundColor ?? AppColors.primary;
    final buttonTextColor = textColor ?? AppColors.textPrimary;

    return SizedBox(
      width: width ?? double.infinity,
      height: height ?? 50,
      child: isOutlined
          ? OutlinedButton(
              onPressed: isLoading ? null : onPressed,
              style: OutlinedButton.styleFrom(
                foregroundColor: buttonBackgroundColor,
                padding: padding ?? const EdgeInsets.symmetric(vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: borderRadius ?? BorderRadius.circular(10),
                ),
                side: BorderSide(color: buttonBackgroundColor, width: 2),
              ),
              child: _buildButtonChild(buttonBackgroundColor),
            )
          : ElevatedButton(
              onPressed: isLoading ? null : onPressed,
              style: ElevatedButton.styleFrom(
                backgroundColor: buttonBackgroundColor,
                foregroundColor: buttonTextColor,
                padding: padding ?? const EdgeInsets.symmetric(vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: borderRadius ?? BorderRadius.circular(10),
                ),
                disabledBackgroundColor: AppColors.disabled,
              ),
              child: _buildButtonChild(buttonTextColor),
            ),
    );
  }

  Widget _buildButtonChild(Color color) {
    if (isLoading) {
      return SizedBox(
        height: 20,
        width: 20,
        child: CircularProgressIndicator(
          strokeWidth: 2,
          valueColor: AlwaysStoppedAnimation<Color>(color),
        ),
      );
    }

    if (icon != null) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: fontSize ?? 16, color: color),
          const SizedBox(width: 8),
          Text(
            text,
            style: TextStyle(
              fontSize: fontSize ?? 16,
              fontWeight: fontWeight ?? FontWeight.bold,
              color: color,
            ),
          ),
        ],
      );
    }

    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize ?? 16,
        fontWeight: fontWeight ?? FontWeight.bold,
        color: color,
      ),
    );
  }
}
