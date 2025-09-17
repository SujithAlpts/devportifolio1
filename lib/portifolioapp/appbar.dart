import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';
import 'portifolioctrl.dart';


class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<PortfolioController>();
    final screenWidth = MediaQuery.of(context).size.width;

    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Row(
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
            'Sujth.dev',
            style: GoogleFonts.poppins(
              color: AppColors.textPrimary,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
      actions: [
        if (screenWidth > 768) ...[
          ...controller.navItems.asMap().entries.map((entry) {
            final index = entry.key;
            final item = entry.value;
            return Obx(() => TextButton(
                  onPressed: () => controller.selectNavItem(index),
                  child: Text(
                    item,
                    style: GoogleFonts.poppins(
                      color: controller.selectedNavIndex.value == index
                          ? AppColors.accentPurple
                          : AppColors.textSecondary,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ));
          }).toList(),
        ] else
          Obx(() => IconButton(
                onPressed: controller.toggleMenu,
                icon: Icon(
                  controller.isMenuOpen.value ? Icons.close : Icons.menu,
                  color: AppColors.textPrimary,
                ),
              )),
        const SizedBox(width: 16),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
