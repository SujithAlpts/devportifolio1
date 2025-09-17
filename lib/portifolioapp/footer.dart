import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';


class Footer extends StatelessWidget {
  const Footer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth > 768;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 80 : 20,
        vertical: 40,
      ),
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(color: AppColors.borderColor),
        ),
      ),
      child: isDesktop
          ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildLeftContent(),
                _buildRightContent(),
              ],
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildLeftContent(),
                const SizedBox(height: 24),
                _buildRightContent(),
              ],
            ),
    );
  }

  Widget _buildLeftContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Sujith S S',
          style: GoogleFonts.poppins(
            color: AppColors.textPrimary,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          'Based in India, Kerala',
          style: GoogleFonts.poppins(
            color: AppColors.textMuted,
            fontSize: 14,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          '© 2025 Sujith. All rights reserved.',
          style: GoogleFonts.poppins(
            color: AppColors.textMuted,
            fontSize: 12,
          ),
        ),
      ],
    );
  }

  Widget _buildRightContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          'Website Built with Flutter',
          style: GoogleFonts.poppins(
            color: AppColors.textMuted,
            fontSize: 12,
          ),
        ),
        // const SizedBox(height: 4),
        // Text(
        //   'and Material Design.',
        //   style: GoogleFonts.poppins(
        //     color: AppColors.textMuted,
        //     fontSize: 12,
        //   ),
        // ),
        const SizedBox(height: 12),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            _FooterIcon(Icons.code),
            const SizedBox(width: 12),
            _FooterIcon(Icons.link),
            const SizedBox(width: 12),
            _FooterIcon(Icons.work_outline),
            const SizedBox(width: 12),
            _FooterIcon(Icons.alternate_email),
          ],
        ),
      ],
    );
  }
}

class _FooterIcon extends StatelessWidget {
  final IconData icon;

  const _FooterIcon(this.icon);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      borderRadius: BorderRadius.circular(6),
      child: Container(
        width: 32,
        height: 32,
        decoration: BoxDecoration(
          color: AppColors.cardBackground,
          borderRadius: BorderRadius.circular(6),
          border: Border.all(color: AppColors.borderColor),
        ),
        child: Icon(
          icon,
          color: AppColors.textMuted,
          size: 16,
        ),
      ),
    );
  }
}
