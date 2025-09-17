import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';


class ServicesSection extends StatelessWidget {
  const ServicesSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth > 1024;
    final isTablet = screenWidth > 768 && screenWidth <= 1024;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 80 : (isTablet ? 40 : 20),
        vertical: 80,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Bringing Ideas to Life in Flutter',
            style: GoogleFonts.poppins(
              color: AppColors.textPrimary,
              fontSize: isDesktop ? 36 : (isTablet ? 32 : 28),
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'I specialize in building engaging mobile apps with Flutter, blending beautiful design and robust performance',
            style: GoogleFonts.poppins(
              color: AppColors.textSecondary,
              fontSize: 16,
              height: 1.6,
            ),
          ),
          const SizedBox(height: 48),
          LayoutBuilder(
            builder: (context, constraints) {
              if (isDesktop) {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Expanded(
                        child: _ServiceCard(
                      icon: Icons.code_outlined,
                      title: 'What I can do',
                      description:
                          'I build high-quality mobile and web applications with Flutter that bring your ideas to life.',
                      items: [
                        'Cross-Platform Mobile Apps (iOS & Android)',
                        'Flutter Web & Desktop Apps',
                        'State Management (GetX, Provider)',
                        'Firebase & Cloud Integration',
                        'API Development & Integration',
                      ],
                    )),
                    SizedBox(width: 24),
                    Expanded(
                        child: _ServiceCard(
                      icon: Icons.build_outlined,
                      title: 'Tools I Use',
                      description:
                          'I work with modern tools and technologies to deliver scalable, robust apps.',
                      items: [
                        'Frontend (Flutter): Dart, Flutter, Flutter Web',
                        'Backend & APIs: Firebase, REST',
                        'State Management: GetX, Provider',
                        'Design: Figma'
                      ],
                    )),
                    SizedBox(width: 24),
                    Expanded(
                        child: _ServiceCard(
                      icon: Icons.palette_outlined,
                      title: 'UI/UX Design',
                      description:
                          'As a developer with a design-first mindset, I focus on building user-friendly and visually engaging apps.',
                      items: [
                        'Pixel-Perfect Flutter UI',
                        'Responsive Layouts for Mobile & Web',
                        'Custom Widgets & Animations',
                        'User-Centered Designs',
                        'Wireframes & Prototypes'
                      ],
                    )),
                  ],
                );
              } else {
                return Column(
                  children: const [
                    _ServiceCard(
                      icon: Icons.code_outlined,
                      title: 'What I can do',
                      description:
                          'I can help develop solutions that will help you grow your business.',
                      items: [
                        'UI/UX Design',
                        'Fullstack Web Development',
                        'Mobile App Development',
                        'Database Design',
                        'API Integration',
                      ],
                    ),
                    SizedBox(height: 24),
                    _ServiceCard(
                      icon: Icons.build_outlined,
                      title: 'Tools I Use',
                      description:
                          'I use the latest tools and technologies to build functional and scalable products.',
                      items: [
                        'Frontend: Flutter, CSS, React, TypeScript',
                        'Backend: Node.js, Fastify, MongoDB, PostgreSQL',
                        'Design: Figma, Framer, Photoshop',
                      ],
                    ),
                    SizedBox(height: 24),
                    _ServiceCard(
                      icon: Icons.palette_outlined,
                      title: 'UI/UX Design',
                      description:
                          'I am a designer first, developer second. I can help design clean and modern interfaces.',
                      items: [
                        'User-Centered Design',
                        'Modern & Clean UI',
                        'Responsive Layouts',
                        'Wireframes & Prototypes',
                      ],
                    ),
                  ],
                );
              }
            },
          ),
          const SizedBox(height: 48),
          Center(
            child: OutlinedButton.icon(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                foregroundColor: AppColors.textPrimary,
                side: const BorderSide(color: AppColors.borderColor),
                padding: const EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 16,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              icon: const Icon(Icons.visibility_outlined),
              label: Text(
                'View My Projects',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ServiceCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  final List<String> items;

  const _ServiceCard({
    required this.icon,
    required this.title,
    required this.description,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.borderColor),
        boxShadow: [
          BoxShadow(
            color: AppColors.textMuted.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: AppColors.accentPurple.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              icon,
              color: AppColors.accentPurple,
              size: 24,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            title,
            style: GoogleFonts.poppins(
              color: AppColors.textPrimary,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            description,
            style: GoogleFonts.poppins(
              color: AppColors.textSecondary,
              fontSize: 14,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 16),
          ...items
              .map((item) => Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 4,
                          height: 4,
                          margin: const EdgeInsets.only(top: 8, right: 12),
                          decoration: const BoxDecoration(
                            color: AppColors.accentPurple,
                            shape: BoxShape.circle,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            item,
                            style: GoogleFonts.poppins(
                              color: AppColors.textMuted,
                              fontSize: 13,
                              height: 1.4,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ))
              .toList(),
        ],
      ),
    );
  }
}
