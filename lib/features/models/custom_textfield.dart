import 'package:flutter/material.dart';
import 'package:my_portfolio/app/theme/app_colors.dart';
import 'package:my_portfolio/app/theme/app_layout.dart';
import 'package:my_portfolio/app/theme/app_radius.dart';
import 'package:my_portfolio/app/theme/app_spacing.dart';

class CustomTextfield extends StatelessWidget {
  final TextEditingController? controller;
  final int maxLine;
  final String hintText;
  final IconData? prefixIcon;
  final String? Function(String?)? validator;

  const CustomTextfield({
    super.key,
    this.controller,
    required this.maxLine,
    required this.hintText,
    this.prefixIcon, 
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isMultiline = maxLine > 1;
    return SizedBox(
      height: isMultiline
          ? AppLayout.contactMessageHeight
          : AppLayout.contactInputHeight,
      child: TextFormField(
        controller: controller,
        maxLines: maxLine,
        validator: validator,
        style: theme.textTheme.bodyMedium?.copyWith(
          color: theme.colorScheme.onSurface,
        ),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: theme.textTheme.bodyMedium?.copyWith(
            color: AppColors.textSecondary,
          ),
          prefixIcon: prefixIcon == null
              ? null
              : Icon(
                  prefixIcon,
                  size: 20,
                  color: theme.colorScheme.primary,
                ),
          contentPadding: EdgeInsets.symmetric(
            horizontal: AppSpacing.md,
            vertical: isMultiline ? AppSpacing.md : AppSpacing.sm + AppSpacing.xs,
          ),
          filled: true,
          fillColor: theme.colorScheme.surface,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppRadius.md),
            borderSide: BorderSide(
              color: theme.dividerColor.withValues(alpha: 0.5),
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppRadius.md),
            borderSide: BorderSide(
              color: theme.dividerColor.withValues(alpha: 0.5),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppRadius.md),
            borderSide: BorderSide(
              color: theme.colorScheme.primary.withValues(alpha: 0.7),
              width: 1.5,
            ),
          ),
        ),
      ),
    );
  }
}
