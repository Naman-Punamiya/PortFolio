import 'package:flutter/material.dart';
import 'package:my_portfolio/app/theme/app_spacing.dart';
import 'package:my_portfolio/app/theme/app_text_styles.dart';

class Mytext extends StatelessWidget {
  final String text;
  const Mytext({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        0,
        AppSpacing.sm + AppSpacing.xs + AppSpacing.xs,
        AppSpacing.sm + AppSpacing.xs + AppSpacing.xs,
        0,
      ),
      child: Text(
        text,
        textAlign: TextAlign.left,
        style: AppTextStyles.caption.copyWith(fontWeight: FontWeight.w500),
      ),
    );
  }
}
