import 'package:flutter/material.dart';

class PortfolioLogo extends StatelessWidget {
  final VoidCallback onTap;
  const PortfolioLogo({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: onTap,
      child: Text(
        'Portfolio',
        style: theme.textTheme.titleLarge?.copyWith(
          fontSize: 30,
          color: theme.colorScheme.onSurface,
        ),
      ),
    );
  }
}
