import 'package:flutter/material.dart';

class TechChip extends StatelessWidget {
  final String text;

  const TechChip({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
      decoration: BoxDecoration(
        color: theme.colorScheme.primary.withOpacity(.08),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Text(
        text,
        style: theme.textTheme.bodySmall?.copyWith(fontSize: 12, fontWeight: FontWeight.w600),
      ),
    );
  }
}
