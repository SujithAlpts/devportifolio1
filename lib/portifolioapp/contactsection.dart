import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';
import 'portifolioctrl.dart';


class ContactSection extends StatelessWidget {
  const ContactSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<PortfolioController>();
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth > 1024;
    final isTablet = screenWidth > 768 && screenWidth <= 1024;
    final isMobile = screenWidth <= 768;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 80 : (isTablet ? 40 : 16),
        vertical: isDesktop ? 80 : (isTablet ? 60 : 40),
      ),
      child: isMobile
          ? _buildMobileLayout(controller)
          : _buildDesktopLayout(controller, isDesktop),
    );
  }

  Widget _buildMobileLayout(PortfolioController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Bringing your ideas to life.',
          style: GoogleFonts.poppins(
            color: AppColors.textPrimary,
            fontSize: 28,
            fontWeight: FontWeight.w700,
            height: 1.2,
          ),
        ),
        Text(
          'Let\'s turn your vision into reality',
          style: GoogleFonts.poppins(
            color: AppColors.accentPurple,
            fontSize: 28,
            fontWeight: FontWeight.w700,
            height: 1.2,
          ),
        ),
        const SizedBox(height: 20),
        Text(
          'Have a project in mind or just want to chat? Let\'s connect!',
          style: GoogleFonts.poppins(
            color: AppColors.textSecondary,
            fontSize: 16,
            height: 1.6,
          ),
        ),
        const SizedBox(height: 32),
        _buildContactForm(controller),
      ],
    );
  }

  Widget _buildDesktopLayout(PortfolioController controller, bool isDesktop) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Bringing your ideas to life.',
                style: GoogleFonts.poppins(
                  color: AppColors.textPrimary,
                  fontSize: isDesktop ? 48 : 36,
                  fontWeight: FontWeight.w700,
                  height: 1.2,
                ),
              ),
              Text(
                'Let\'s turn your vision into reality',
                style: GoogleFonts.poppins(
                  color: AppColors.accentPurple,
                  fontSize: isDesktop ? 48 : 36,
                  fontWeight: FontWeight.w700,
                  height: 1.2,
                ),
              ),
              const SizedBox(height: 24),
              Text(
                'Have a project in mind or just want to chat? Let\'s connect!',
                style: GoogleFonts.poppins(
                  color: AppColors.textSecondary,
                  fontSize: 16,
                  height: 1.6,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 80),
        Expanded(
          flex: 1,
          child: _buildContactForm(controller),
        ),
      ],
    );
  }

  Widget _buildContactForm(PortfolioController controller) {
    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.borderColor),
        boxShadow: [
          BoxShadow(
            color: AppColors.textMuted.withOpacity(0.1),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        children: [
          _ContactField(
            label: 'Name',
            placeholder: 'Your Name',
            onChanged: (value) => controller.updateContactForm(name: value),
            controller: controller,
            fieldType: 'name',
          ),
          const SizedBox(height: 20),
          _ContactField(
            label: 'Email',
            placeholder: 'contact@example.com',
            onChanged: (value) => controller.updateContactForm(email: value),
            controller: controller,
            fieldType: 'email',
          ),
          const SizedBox(height: 20),
          _ContactField(
            label: 'Message',
            placeholder: 'Your message here...',
            maxLines: 4,
            onChanged: (value) => controller.updateContactForm(message: value),
            controller: controller,
            fieldType: 'message',
          ),
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: controller.sendMessage,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.accentPurple,
                foregroundColor: AppColors.cardBackground,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text(
                'Send Message',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ContactField extends StatelessWidget {
  final String label;
  final String placeholder;
  final int maxLines;
  final Function(String) onChanged;
  final PortfolioController controller;
  final String fieldType;

  const _ContactField({
    required this.label,
    required this.placeholder,
    required this.onChanged,
    required this.controller,
    required this.fieldType,
    this.maxLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.poppins(
            color: AppColors.textPrimary,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        Obx(() {
          String value = '';
          switch (fieldType) {
            case 'name':
              value = controller.contactName.value;
              break;
            case 'email':
              value = controller.contactEmail.value;
              break;
            case 'message':
              value = controller.contactMessage.value;
              break;
          }

          return TextFormField(
            initialValue: value,
            onChanged: onChanged,
            maxLines: maxLines,
            style: GoogleFonts.poppins(
              color: AppColors.textPrimary,
              fontSize: 14,
            ),
            decoration: InputDecoration(
              hintText: placeholder,
              hintStyle: GoogleFonts.poppins(
                color: AppColors.textMuted,
                fontSize: 14,
              ),
              filled: true,
              fillColor: AppColors.primaryDark,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: AppColors.borderColor),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: AppColors.borderColor),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: AppColors.accentPurple),
              ),
              contentPadding: const EdgeInsets.all(16),
            ),
          );
        }),
      ],
    );
  }
}
