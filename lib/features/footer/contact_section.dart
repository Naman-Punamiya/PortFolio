import 'package:flutter/material.dart';
import 'package:my_portfolio/app/theme/app_colors.dart';
import 'package:my_portfolio/app/theme/app_contact.dart';
import 'package:my_portfolio/app/theme/app_layout.dart';
import 'package:my_portfolio/app/theme/app_radius.dart';
import 'package:my_portfolio/app/theme/app_shadows.dart';
import 'package:my_portfolio/app/theme/app_spacing.dart';
import 'package:my_portfolio/core/constants/size.dart';
import 'package:my_portfolio/core/repositories/contact_message_repository.dart';
import 'package:my_portfolio/core/utils/contact_message_utils.dart';
import 'package:my_portfolio/core/utils/contact_utils.dart';
import 'package:my_portfolio/features/models/custom_textfield.dart';

class ContactSection extends StatefulWidget {
  final ContactUtils contact;

  const ContactSection({super.key, required this.contact});

  @override
  State<ContactSection> createState() => _ContactSectionState();
}

class _ContactSectionState extends State<ContactSection> {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _subjectController = TextEditingController();
  final _messageController = TextEditingController();

  late final ContactMessageRepository _repository;

  bool _isSending = false;

  @override
  void initState() {
    super.initState();

    _repository = ContactMessageRepository();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _subjectController.dispose();
    _messageController.dispose();

    super.dispose();
  }

  Future<void> sendMessage() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    setState(() {
      _isSending = true;
    });

    try {
      final message = ContactMessageUtils(
        name: _nameController.text.trim(),
        email: _emailController.text.trim(),
        subject: _subjectController.text.trim(),
        message: _messageController.text.trim(),
      );

      await _repository.sendMessage(message);
      FocusScope.of(context).unfocus();
      _nameController.clear();
      _emailController.clear();
      _subjectController.clear();
      _messageController.clear();

      _formKey.currentState?.reset();

      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          behavior: SnackBarBehavior.floating,
          backgroundColor: Theme.of(context).colorScheme.primary,
          content: const Text(
            "Thank you! Your message has been sent successfully.",
          ),
        ),
      );
    } catch (e) {
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text("Something went wrong.\nPlease try again later."),
        ),
      );
    } finally {
      if (mounted) {
        setState(() {
          _isSending = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      width: double.infinity,
      color: theme.scaffoldBackgroundColor,
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.lg,
        vertical: AppSpacing.xl,
      ),
      child: Stack(
        children: [
          Positioned(
            top: -AppSpacing.xl,
            right: -AppSpacing.xl,
            child: _DecorCircle(
              size: 180,
              color: theme.colorScheme.primary.withValues(alpha: 0.06),
            ),
          ),
          Positioned(
            bottom: AppSpacing.xl,
            right: AppSpacing.lg,
            child: _DecorDots(
              color: theme.colorScheme.primary.withValues(alpha: 0.12),
            ),
          ),
          Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: AppLayout.contactSectionMaxWidth,
              ),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final isDesktop = constraints.maxWidth >= minDesktopWidth;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      isDesktop
                          ? _buildDesktopContent(context)
                          : _buildMobileContent(context),
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDesktopContent(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: AppLayout.contactInfoColumnMaxWidth,
          ),
          child: _ContactIntro(theme: theme, contact: widget.contact),
        ),
        const SizedBox(width: AppLayout.contactSectionGap),
        Expanded(child: _buildContactForm(context, theme)),
      ],
    );
  }

  Widget _buildMobileContent(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _ContactIntro(theme: theme, contact: widget.contact),
        const SizedBox(height: AppSpacing.xl),
        _buildContactForm(context, theme),
      ],
    );
  }

  Widget _buildContactForm(BuildContext context, ThemeData theme) {
    return Container(
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(AppRadius.lg),
        border: Border.all(color: theme.dividerColor.withValues(alpha: 0.45)),
        boxShadow: AppShadows.medium,
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: IgnorePointer(
          ignoring: _isSending,
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: CustomTextfield(
                        controller: _nameController,
                        hintText: AppContact.nameHint,
                        maxLine: 1,
                        prefixIcon: Icons.person_outline_rounded,
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return "Please enter your name";
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(width: AppSpacing.md),
                    Expanded(
                      child: CustomTextfield(
                        controller: _emailController,
                        hintText: AppContact.emailHint,
                        maxLine: 1,
                        prefixIcon: Icons.mail_outline_rounded,
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return "Please enter your email";
                          }

                          final emailRegex = RegExp(
                            r'^[^@\s]+@[^@\s]+\.[^@\s]+$',
                          );

                          if (!emailRegex.hasMatch(value)) {
                            return "Enter a valid email";
                          }

                          return null;
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: AppSpacing.md),

                CustomTextfield(
                  hintText: "Subject",
                  maxLine: 1,
                  controller: _subjectController,
                  prefixIcon: Icons.subject_outlined,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Please enter a subject";
                    }
                    return null;
                  },
                ),

                const SizedBox(height: AppSpacing.md),
                CustomTextfield(
                  hintText: AppContact.messageHint,
                  maxLine: 9,
                  controller: _messageController,
                  prefixIcon: Icons.message_outlined,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Please enter your message";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: AppSpacing.md),
                SizedBox(
                  width: double.infinity,
                  height: AppLayout.contactButtonHeight,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(AppRadius.md),
                      gradient: LinearGradient(
                        colors: [
                          theme.colorScheme.primary,
                          theme.colorScheme.primary.withValues(alpha: 0.82),
                        ],
                      ),
                    ),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(AppRadius.md),
                        onTap: _isSending ? null : sendMessage,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: AppSpacing.md,
                          ),
                          child: Row(
                            children: [
                              _isSending
                                  ? SizedBox(
                                      width: 22,
                                      height: 22,
                                      child: CircularProgressIndicator(
                                        strokeWidth: 2,
                                        color: theme.colorScheme.surface,
                                      ),
                                    )
                                  : Icon(
                                      Icons.send_outlined,
                                      color: theme.colorScheme.surface,
                                      size: 22,
                                    ),
                              const Spacer(),
                              Text(
                                AppContact.sendButtonLabel,
                                style: theme.textTheme.labelLarge?.copyWith(
                                  color: theme.colorScheme.surface,
                                  fontSize: 16,
                                ),
                              ),
                              const Spacer(),
                              Icon(
                                Icons.arrow_forward_rounded,
                                color: theme.colorScheme.surface,
                                size: 24,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ContactIntro extends StatelessWidget {
  final ThemeData theme;
  final ContactUtils contact;

  const _ContactIntro({required this.theme, required this.contact});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppContact.sectionLabel,
          style: theme.textTheme.labelLarge?.copyWith(
            color: theme.colorScheme.primary,
            fontSize: 18,
            fontWeight: FontWeight.w700,
            letterSpacing: 1.5,
          ),
        ),
        const SizedBox(height: AppSpacing.sm),
        Text(
          contact.title,
          style: theme.textTheme.headlineMedium?.copyWith(
            fontSize: 44,
            height: 1.1,
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: AppSpacing.md),
        Text(
          contact.subtitle,
          style: theme.textTheme.bodyLarge?.copyWith(
            color: AppColors.textSecondary,
            height: 1.7,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: AppSpacing.md),
        Container(
          width: 48,
          height: 3,
          decoration: BoxDecoration(
            color: theme.colorScheme.primary,
            borderRadius: BorderRadius.circular(AppRadius.xl),
          ),
        ),
        const SizedBox(height: AppSpacing.xl),
        _ContactInfoCard(
          theme: theme,
          icon: Icons.email_outlined,
          title: AppContact.emailTitle,
          primaryText: contact.email,
          secondaryText: AppContact.emailSubtitle,
        ),
        const SizedBox(height: AppSpacing.md),
        _ContactInfoCard(
          theme: theme,
          icon: Icons.work_outline_rounded,
          title: AppContact.availabilityTitle,
          primaryText: contact.availability,
          secondaryText: "",
        ),
        const SizedBox(height: AppSpacing.md),
        _ContactInfoCard(
          theme: theme,
          icon: Icons.location_on_outlined,
          title: AppContact.locationTitle,
          primaryText: contact.location,
          secondaryText: AppContact.locationSubtitle,
        ),
      ],
    );
  }
}

// class _ContactForm extends StatelessWidget {
//   const _ContactForm({required this.theme});

//   final ThemeData theme;

//   @override
//   Widget build(BuildContext context) {
//     }
// }

class _ContactInfoCard extends StatelessWidget {
  const _ContactInfoCard({
    required this.theme,
    required this.icon,
    required this.title,
    required this.primaryText,
    required this.secondaryText,
    this.showList = false,
    this.listItems = const [],
  });

  final ThemeData theme;
  final IconData icon;
  final String title;
  final String? primaryText;
  final String secondaryText;
  final bool showList;
  final List<String> listItems;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(AppRadius.md),
        border: Border.all(color: theme.dividerColor.withValues(alpha: 0.45)),
        boxShadow: AppShadows.small,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: AppLayout.contactInfoCardIconSize,
            height: AppLayout.contactInfoCardIconSize,
            decoration: BoxDecoration(
              color: theme.colorScheme.primary.withValues(alpha: 0.10),
              shape: BoxShape.circle,
            ),
            alignment: Alignment.center,
            child: Icon(icon, color: theme.colorScheme.primary, size: 26),
          ),
          const SizedBox(width: AppSpacing.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textPrimary,
                  ),
                ),
                const SizedBox(height: AppSpacing.xs),
                primaryText != null
                    ? Text(
                        primaryText!,
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: AppColors.textPrimary,
                          height: 1.4,
                          fontSize: 13,
                        ),
                      )
                    : const SizedBox.shrink(),
                // Text(
                //   primaryText ,
                //   style: theme.textTheme.bodyMedium?.copyWith(
                //     color: AppColors.textPrimary,
                //     height: 1.4,
                //     fontSize: 15,
                //   ),
                // ),
                // Text(
                // primaryText,
                // style: theme.textTheme.bodyMedium?.copyWith(
                // color: AppColors.textPrimary,
                // height: 1.4,
                // fontSize: 15,
                // ),
                // ),
                if (showList) ...[
                  const SizedBox(height: AppSpacing.xs),
                  for (final item in listItems)
                    Padding(
                      padding: const EdgeInsets.only(top: 2),
                      child: Row(
                        children: [
                          Icon(
                            Icons.check,
                            size: 16,
                            color: theme.colorScheme.primary,
                          ),
                          const SizedBox(width: AppSpacing.xs),
                          Text(
                            item,
                            style: theme.textTheme.bodyMedium?.copyWith(
                              color: AppColors.textSecondary,
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                    ),
                ] else ...[
                  const SizedBox(height: AppSpacing.xs),
                  Text(
                    secondaryText,
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: AppColors.textSecondary,
                      fontSize: 12,
                    ),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _DecorCircle extends StatelessWidget {
  const _DecorCircle({required this.size, required this.color});

  final double size;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
    );
  }
}

class _DecorDots extends StatelessWidget {
  const _DecorDots({required this.color});

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: List.generate(
        12,
        (index) => Container(
          width: 6,
          height: 6,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
      ),
    );
  }
}
