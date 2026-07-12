import 'package:flutter/material.dart';
import 'package:my_portfolio/core/constants/size.dart';
import 'package:my_portfolio/core/models/certificate_card.dart';
import 'package:my_portfolio/core/repositories/certificate_repository.dart';
import 'package:my_portfolio/core/repositories/social_repository.dart';
import 'package:my_portfolio/core/utils/certificate_utils.dart';
import 'package:my_portfolio/core/utils/social_utils.dart';
import 'package:my_portfolio/features/header/appbar.dart';
import 'package:my_portfolio/features/models/drawer_mobile.dart';
import 'package:my_portfolio/features/footer/footer_section.dart';
import 'package:my_portfolio/features/home/home_page.dart';

class CertificatePage extends StatefulWidget {
  final List<GlobalKey> navbarkeys;
  const CertificatePage({super.key, required this.navbarkeys});

  @override
  State<CertificatePage> createState() => _CertificatePageState();
}

class _CertificatePageState extends State<CertificatePage> {
  late final CertificateRepository _repository;
  late final Future<List<CertificateUtils>> _certificateFuture;
  late final SocialRepository _socialRepository;
  late final Future<SocialUtils> _socialFuture;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    _repository = CertificateRepository();
    _certificateFuture = _repository.getCertificates();

    _socialRepository = SocialRepository();
    _socialFuture = _socialRepository.getSocials();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scaffoldKey = GlobalKey<ScaffoldState>();
    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          key: scaffoldKey,
          endDrawer: (constraints.maxWidth >= minDesktopWidth)
              ? null
              : DrawerMobile(
                  onNavItemTap: (int navIndex) {
                    scrollToSection(navIndex, widget.navbarkeys, context);
                    scaffoldKey.currentState?.closeEndDrawer();
                  },
                ),
          backgroundColor: theme.scaffoldBackgroundColor,
          body: Column(
            children: [
              CustomAppBar(
                activeIndex: 4,
                onLogoTap: () {},
                onMenuTap: () {
                  scaffoldKey.currentState?.openEndDrawer();
                },
                onNavMenuTap: (int navIndex) {
                  scrollToSection(navIndex, widget.navbarkeys, context);
                }, onResumeTap: () {  },
              ),
              Expanded(
                child: SingleChildScrollView(
                  controller: _scrollController,
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      const SizedBox(height: 60),

                      Icon(
                        Icons.workspace_premium_rounded,
                        size: 70,
                        color: theme.colorScheme.primary,
                      ),

                      const SizedBox(height: 20),

                      Text(
                        "Certificates",
                        style: theme.textTheme.displaySmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 12),

                      SizedBox(
                        width: 650,
                        child: Text(
                          "Courses, certifications, workshops and achievements that showcase my continuous learning journey.",
                          textAlign: TextAlign.center,
                          style: theme.textTheme.bodyLarge?.copyWith(
                            color: theme.colorScheme.onSurface.withOpacity(.7),
                          ),
                        ),
                      ),

                      const SizedBox(height: 40),

                      Container(
                        width: 120,
                        height: 4,
                        decoration: BoxDecoration(
                          color: theme.colorScheme.primary,
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),

                      const SizedBox(height: 50),

                      FutureBuilder<List<CertificateUtils>>(
                        future: _certificateFuture,
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Padding(
                              padding: EdgeInsets.symmetric(vertical: 80),
                              child: Center(child: CircularProgressIndicator()),
                            );
                          }

                          if (snapshot.hasError) {
                            return Padding(
                              padding: const EdgeInsets.all(40),
                              child: Text(
                                snapshot.error.toString(),
                                style: const TextStyle(color: Colors.red),
                              ),
                            );
                          }

                          final certificates = snapshot.data ?? [];

                          if (certificates.isEmpty) {
                            return const Padding(
                              padding: EdgeInsets.symmetric(vertical: 80),
                              child: Center(
                                child: Text(
                                  "No certificates found.",
                                  style: TextStyle(fontSize: 18),
                                ),
                              ),
                            );
                          }

                          return LayoutBuilder(
                            builder: (context, constraints) {
                              int crossAxisCount = 3;

                              if (constraints.maxWidth < 700) {
                                crossAxisCount = 1;
                              } else if (constraints.maxWidth < 1100) {
                                crossAxisCount = 2;
                              }

                              return GridView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 50,
                                ),
                                itemCount: certificates.length,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: crossAxisCount,
                                      crossAxisSpacing: 30,
                                      mainAxisSpacing: 30,
                                      childAspectRatio: 0.85,
                                    ),
                                itemBuilder: (context, index) {
                                  return CertificateCard(
                                    certificate: certificates[index],
                                  );
                                },
                              );
                            },
                          );
                        },
                      ),

                      const SizedBox(height: 80),

                      FutureBuilder<SocialUtils>(
                        future: _socialFuture,
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const SizedBox.shrink();
                          }

                          if (snapshot.hasError) {
                            return Center(
                              child: Text(snapshot.error.toString()),
                            );
                          }

                          if (!snapshot.hasData) {
                            return const SizedBox.shrink();
                          }

                          return FooterSection(social: snapshot.data!);
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
