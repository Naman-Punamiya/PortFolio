import 'package:flutter/material.dart';

class NavButton extends StatefulWidget {
  final String title;
  final bool isActive;
  final VoidCallback onTap;

  const NavButton({
    super.key,
    required this.title,
    required this.isActive,
    required this.onTap,
  });

  @override
  State<NavButton> createState() => _NavButtonState();
}

class _NavButtonState extends State<NavButton> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AnimatedDefaultTextStyle(
                duration: const Duration(milliseconds: 200),
                style: theme.textTheme.titleMedium!.copyWith(
                  fontSize: 17,
                  fontWeight: widget.isActive
                      ? FontWeight.w600
                      : FontWeight.w500,
                  color: widget.isActive || isHovered
                      ? theme.colorScheme.primary
                      : theme.colorScheme.onSurfaceVariant,
                ),
                child: Text(widget.title),
              ),

              const SizedBox(height: 6),

              AnimatedContainer(
                duration: const Duration(milliseconds: 250),
                curve: Curves.easeInOut,
                height: 2,
                width: widget.isActive ? 24 : 0,
                decoration: BoxDecoration(
                  color: theme.colorScheme.primary,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}