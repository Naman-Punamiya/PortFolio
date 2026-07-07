import 'package:flutter/material.dart';
import 'package:my_portfolio/core/constants/size.dart';
import 'package:my_portfolio/features/models/custom_textfield.dart';
import 'package:my_portfolio/app/theme/app_spacing.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      width: double.maxFinite,
      padding: const EdgeInsets.fromLTRB(
        AppSpacing.lg,
        AppSpacing.lg,
        AppSpacing.lg,
        AppSpacing.lg,
      ),
      color: theme.colorScheme.surfaceVariant,
      child: Column(
        children: [
          Text(
            "Get in Touch",
            style: theme.textTheme.titleLarge?.copyWith(
              color: theme.colorScheme.onSurface,
            ),
          ),
          const SizedBox(height: AppSpacing.xxl),
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 700, maxHeight: 100),
            child: LayoutBuilder(
              builder: (context, constraints) {
                if (constraints.maxWidth >= minDesktopWidth) {
                  return buildnameEmailFieldMobile();
                } else {
                  return buildnameEmailFieldDesktop();
                }
              },
            ),
          ),
          const SizedBox(height: AppSpacing.md),
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 700),
            child: CustomTextfield(
              hintText: "Your Message",
              maxLine: 10,
              controller: null,
            ),
          ),
          const SizedBox(height: AppSpacing.md),
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 700),
            child: SizedBox(
              height: 50,
              width: double.maxFinite,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text("Send"),
                ),
            ),
          ),
          const SizedBox(height: AppSpacing.lg),

          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: ConstrainedBox(
          //     constraints: BoxConstraints(maxWidth: 700),
          //     child: Divider(),
          //   ),
          // ),
          // SizedBox(height: 15),
          // Wrap(
          //   spacing: 12,
          //   runSpacing: 12,
          //   alignment: WrapAlignment.center,
          //   children: [
          //     InkWell(
          //       onTap: () {
          //         js.context.callMethod("open",[SnsLinks.github]);
          //       },
          //       child: Image.asset("flutter.png", width: 28),
          //     ),
          //     InkWell(
          //       onTap: () {
          //         js.context.callMethod("open",[SnsLinks.linkedin]);
          //       },
          //       child: Image.asset("flutter.png", width: 28),
          //     ),
          //     InkWell(
          //       onTap: () {
          //         js.context.callMethod("open",[SnsLinks.instagram]);
          //       },
          //       child: Image.asset("flutter.png", width: 28),
          //     ),
          //     InkWell(
          //       onTap: () {
          //         js.context.callMethod("open",[SnsLinks.telegram]);
          //       },
          //       child: Image.asset("flutter.png", width: 28),
          //     ),
          //     InkWell(
          //       onTap: () {
          //         js.context.callMethod("open",[SnsLinks.github]);
          //       },
          //       child: Image.asset("flutter.png", width: 28),
          //     ),
          //   ],
          // ),
        ],
      ),
    );
  }
}

Column buildnameEmailFieldMobile() {
  return Column(
    children: [
      Flexible(
        child: CustomTextfield(
          hintText: "Your Name",
          maxLine: 1,
          controller: null,
        ),
      ),
      const SizedBox(height: AppSpacing.md),
      Flexible(
        child: CustomTextfield(
          hintText: "Your Email",
          maxLine: 1,
          controller: null,
        ),
      ),
    ],
  );
}

Row buildnameEmailFieldDesktop() {
  return Row(
    children: [
      Flexible(
        child: CustomTextfield(
          hintText: "Your Name",
          maxLine: 1,
          controller: null,
        ),
      ),
      const SizedBox(width: AppSpacing.md),
      Flexible(
        child: CustomTextfield(
          hintText: "Your Email",
          maxLine: 1,
          controller: null,
        ),
      ),
    ],
  );
}
