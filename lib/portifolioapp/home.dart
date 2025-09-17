import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'appbar.dart';
import 'colors.dart';
import 'contactsection.dart';
import 'footer.dart';
import 'herosection.dart';
import 'portifolioctrl.dart';
import 'servicesection.dart';

class PortfolioHomePage extends StatelessWidget {
  const PortfolioHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<PortfolioController>();

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const CustomAppBar(),
      drawer: MediaQuery.of(context).size.width <= 768
          ? _buildMobileDrawer(controller, context)
          : null,
      body: Container(
        decoration: BoxDecoration(
          gradient: AppColors.backgroundGradient,
        ),
        child: const SingleChildScrollView(
          child: Column(
            children: [
              HeroSection(),
              ServicesSection(),
              ContactSection(),
              Footer(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMobileDrawer(PortfolioController controller, BuildContext ctx) {
    return Drawer(
      backgroundColor: AppColors.cardBackground,
      child: SafeArea(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  Container(
                    width: 8,
                    height: 8,
                    decoration: const BoxDecoration(
                      color: AppColors.accentPurple,
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'Nadhir.dev',
                    style: GoogleFonts.poppins(
                      color: AppColors.textPrimary,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            const Divider(color: AppColors.borderColor),
            ...controller.navItems.asMap().entries.map((entry) {
              final index = entry.key;
              final item = entry.value;
              return Obx(() => ListTile(
                    title: Text(
                      item,
                      style: GoogleFonts.poppins(
                        color: controller.selectedNavIndex.value == index
                            ? AppColors.accentPurple
                            : AppColors.textSecondary,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    onTap: () {
                      controller.selectNavItem(index);
                      Navigator.pop(ctx);
                    },
                    selected: controller.selectedNavIndex.value == index,
                    selectedTileColor: AppColors.accentPurple.withOpacity(0.1),
                  ));
            }).toList(),
          ],
        ),
      ),
    );
  }
}
