import 'package:flutter/material.dart';
import 'package:my_portfolio/app/theme/app_colors.dart';
import 'package:my_portfolio/app/theme/app_contact.dart';
import 'package:my_portfolio/app/theme/app_layout.dart';
import 'package:my_portfolio/app/theme/app_radius.dart';
import 'package:my_portfolio/app/theme/app_spacing.dart';
import 'package:my_portfolio/core/lists/social_data.dart';
import 'package:url_launcher/url_launcher.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      width: double.infinity,
      color: theme.scaffoldBackgroundColor,
      padding: const EdgeInsets.fromLTRB(
        AppSpacing.lg,
        AppLayout.footerSectionVerticalPadding,
        AppSpacing.lg,
        AppLayout.footerSectionVerticalPadding,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: AppLayout.contactSectionMaxWidth),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Divider(
                      color: theme.dividerColor.withValues(alpha: 1),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: AppSpacing.sm),
                    child: Text(
                      AppContact.connectTitle,
                      style: theme.textTheme.titleMedium?.copyWith(
                        color: theme.colorScheme.primary,
                        fontWeight: FontWeight.w700,
                        fontSize: AppLayout.footerConnectLabelSize,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      color: theme.dividerColor.withValues(alpha: 0.75),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: AppLayout.footerConnectGap),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                // spacing: AppLayout.footerSocialGap,
                // runSpacing: AppLayout.footerSocialGap,
                // alignment: WrapAlignment.center,
                children: [
                  _SocialIconButton(
                    label: 'GitHub',
                    asset: 'Github_white.png',
                    url: socialData.github,
                  ),
                  SizedBox(width: AppSpacing.lg),
                  _SocialIconButton(
                    label: 'LinkedIn',
                    asset: 'linkedin_white.png',
                    url: socialData.linkedin,
                  ),
                  SizedBox(width: AppSpacing.md),
                  _SocialIconButton(
                    label: 'Instagram',
                    asset: 'Instagram_white.png',
                    url: socialData.instagram,
                  ),
                  SizedBox(width: AppSpacing.md),
                  _SocialIconButton(
                    label: 'Discord',
                    asset: 'Discord_white.png',
                    url: socialData.email,
                  ),
                ],
              ),
              const SizedBox(height: AppLayout.footerBottomGap),
              Text(
                AppContact.footerTitle,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
              const SizedBox(height: AppSpacing.xs),
              Text(
                AppContact.footerSubtitle,
                style: theme.textTheme.bodySmall?.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SocialIconButton extends StatelessWidget {
  const _SocialIconButton({
    required this.label,
    required this.asset,
    required this.url,
  });

  final String label;
  final String asset;
  final String url;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InkWell(
      onTap: () async {
        await launchUrl(
          Uri.parse(url),
          mode: LaunchMode.externalApplication,
        );
      },
      borderRadius: BorderRadius.circular(AppRadius.xl),
      child: Column(
        children: [
          Container(
            width: AppLayout.footerSocialIconSize,
            height: AppLayout.footerSocialIconSize,
            decoration: BoxDecoration(
              color: theme.colorScheme.surface,
              shape: BoxShape.circle,
              border: Border.all(
                color: theme.dividerColor.withValues(alpha: 0.75),
                width: 2,
              ),
            ),
            alignment: Alignment.center,
            child: Image.asset(asset, width: 24,color: theme.colorScheme.onSurface,),
          ),
          const SizedBox(height: AppSpacing.xs/2),
          Text(
            label,
            style: theme.textTheme.bodySmall?.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }
}
