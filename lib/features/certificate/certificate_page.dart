import 'package:flutter/material.dart';
import 'package:my_portfolio/core/constants/size.dart';
import 'package:my_portfolio/features/header/appbar.dart';
import 'package:my_portfolio/features/models/drawer_mobile.dart';
import 'package:my_portfolio/features/footer/footer_section.dart';
import 'package:my_portfolio/features/home/home_page.dart';

class CertificatePage extends StatelessWidget {
  final List<GlobalKey> navbarkeys;
  const CertificatePage({super.key, required this.navbarkeys});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scaffoldKey = GlobalKey<ScaffoldState>();
    final scrollController = ScrollController();
    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          key: scaffoldKey,
          endDrawer: (constraints.maxWidth >= minDesktopWidth)
              ? null
              : DrawerMobile(
                  onNavItemTap: (int navIndex) {
                    scrollToSection(navIndex, navbarkeys, context);
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
                  scrollToSection(navIndex, navbarkeys, context);
                },
              ),
              Expanded(
                child: SingleChildScrollView(
                  controller: scrollController,
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      // CertificateCard(
                      //   title: 'Flutter Certificate',
                      //   assetPath: 'assets/certificate/flutter.pdf',
                      // ),
                      // CertificateCard(
                      //   title: 'Java Certificate',
                      //   assetPath: 'assets/certificate/java.pdf',
                      // ),
                      FooterSection(),
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
