// import 'package:flutter/material.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';

// // import 'core/colors/app_colors.dart';
// // import 'controllers/portfolio_controller.dart';
// // import 'widgets/custom_app_bar.dart';
// // import 'widgets/hero_section.dart';
// // import 'widgets/services_section.dart';
// // import 'widgets/contact_section.dart';
// // import 'widgets/footer.dart';
// class AppColors {
//   static const Color primaryDark = Color(0xFFF8FAFC); // Light background
//   static const Color secondaryDark = Color(0xFFE2E8F0); // Light secondary
//   static const Color accentPurple =
//       Color(0xFF3B82F6); // Light blue as main accent
//   static const Color accentBlue = Color(0xFF1E40AF); // Darker blue for contrast
//   static const Color textPrimary =
//       Color(0xFF1E293B); // Dark text on light background
//   static const Color textSecondary = Color(0xFF64748B); // Medium gray text
//   static const Color textMuted = Color(0xFF94A3B8); // Light gray text
//   static const Color cardBackground = Color(0xFFFFFFFF); // White cards
//   static const Color borderColor = Color(0xFFE2E8F0); // Light border
//   static const Color gradientStart = Color(0xFF3B82F6); // Light blue
//   static const Color gradientEnd =
//       Color(0xFFEF4444); // Orange for minimal accent

//   static LinearGradient get primaryGradient => const LinearGradient(
//         colors: [gradientStart, gradientEnd],
//         begin: Alignment.topLeft,
//         end: Alignment.bottomRight,
//       );

//   static LinearGradient get backgroundGradient => const LinearGradient(
//         colors: [primaryDark, Color(0xFFF1F5F9)],
//         begin: Alignment.topCenter,
//         end: Alignment.bottomCenter,
//       );
// }
// // class AppColors {
// //   static const Color primaryDark = Color(0xFF0A0A0A);
// //   static const Color secondaryDark = Color(0xFF1A1A1A);
// //   static const Color accentPurple = Color(0xFF8B5CF6);
// //   static const Color accentBlue = Color(0xFF3B82F6);
// //   static const Color textPrimary = Color(0xFFFFFFFF);
// //   static const Color textSecondary = Color(0xFFB3B3B3);
// //   static const Color textMuted = Color(0xFF6B7280);
// //   static const Color cardBackground = Color(0xFF111111);
// //   static const Color borderColor = Color(0xFF2A2A2A);
// //   static const Color gradientStart = Color(0xFF8B5CF6);
// //   static const Color gradientEnd = Color(0xFF3B82F6);

// //   static LinearGradient get primaryGradient => const LinearGradient(
// //         colors: [gradientStart, gradientEnd],
// //         begin: Alignment.topLeft,
// //         end: Alignment.bottomRight,
// //       );

// //   static LinearGradient get backgroundGradient => const LinearGradient(
// //         colors: [primaryDark, Color(0xFF1A1A2E)],
// //         begin: Alignment.topCenter,
// //         end: Alignment.bottomCenter,
// //       );
// // }

// // lib/controllers/portfolio_controller.dart
// // import 'package:get/get.dart';

// class PortfolioController extends GetxController {
//   final RxInt selectedNavIndex = 0.obs;
//   final RxBool isMenuOpen = false.obs;
//   final RxString contactName = ''.obs;
//   final RxString contactEmail = ''.obs;
//   final RxString contactMessage = ''.obs;

//   final List<String> navItems = ['Home', 'Projects', 'Contact'];

//   void selectNavItem(int index) {
//     selectedNavIndex.value = index;
//     isMenuOpen.value = false;
//   }

//   void toggleMenu() {
//     isMenuOpen.toggle();
//   }

//   void updateContactForm({String? name, String? email, String? message}) {
//     if (name != null) contactName.value = name;
//     if (email != null) contactEmail.value = email;
//     if (message != null) contactMessage.value = message;
//   }

//   void sendMessage() {
//     if (contactName.value.isNotEmpty &&
//         contactEmail.value.isNotEmpty &&
//         contactMessage.value.isNotEmpty) {
//       Get.snackbar(
//         'Success',
//         'Message sent successfully!',
//         backgroundColor: AppColors.accentPurple,
//         colorText: AppColors.textPrimary,
//       );
//       // Clear form
//       contactName.value = '';
//       contactEmail.value = '';
//       contactMessage.value = '';
//     }
//   }
// }

// // lib/widgets/custom_app_bar.dart
// // import 'package:flutter/material.dart';
// // import 'package:get/get.dart';
// // import 'package:google_fonts/google_fonts.dart';
// // import '../core/colors/app_colors.dart';
// // import '../controllers/portfolio_controller.dart';

// class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
//   const CustomAppBar({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final controller = Get.find<PortfolioController>();

//     return AppBar(
//       backgroundColor: Colors.transparent,
//       elevation: 0,
//       title: Row(
//         children: [
//           Container(
//             width: 8,
//             height: 8,
//             decoration: const BoxDecoration(
//               color: AppColors.accentPurple,
//               shape: BoxShape.circle,
//             ),
//           ),
//           const SizedBox(width: 8),
//           Text(
//             'Nadhir.dev',
//             style: GoogleFonts.poppins(
//               color: AppColors.textPrimary,
//               fontSize: 20,
//               fontWeight: FontWeight.w600,
//             ),
//           ),
//         ],
//       ),
//       actions: [
//         if (Get.width > 768) ...[
//           ...controller.navItems.asMap().entries.map((entry) {
//             final index = entry.key;
//             final item = entry.value;
//             return Obx(() => TextButton(
//                   onPressed: () => controller.selectNavItem(index),
//                   child: Text(
//                     item,
//                     style: GoogleFonts.poppins(
//                       color: controller.selectedNavIndex.value == index
//                           ? AppColors.accentPurple
//                           : AppColors.textSecondary,
//                       fontSize: 16,
//                       fontWeight: FontWeight.w500,
//                     ),
//                   ),
//                 ));
//           }).toList(),
//         ] else
//           IconButton(
//             onPressed: controller.toggleMenu,
//             icon: const Icon(Icons.menu, color: AppColors.textPrimary),
//           ),
//         const SizedBox(width: 16),
//       ],
//     );
//   }

//   @override
//   Size get preferredSize => const Size.fromHeight(kToolbarHeight);
// }

// // lib/widgets/hero_section.dart
// // import 'package:flutter/material.dart';
// // import 'package:google_fonts/google_fonts.dart';
// // import '../core/colors/app_colors.dart';

// class HeroSection extends StatelessWidget {
//   const HeroSection({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final isDesktop = MediaQuery.of(context).size.width > 768;

//     return Container(
//       padding: EdgeInsets.symmetric(
//         horizontal: isDesktop ? 80 : 20,
//         vertical: isDesktop ? 100 : 60,
//       ),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           if (isDesktop) ...[
//             Container(
//               width: 120,
//               height: 120,
//               decoration: BoxDecoration(
//                 shape: BoxShape.circle,
//                 gradient: AppColors.primaryGradient,
//               ),
//               child: const Icon(
//                 Icons.person,
//                 size: 60,
//                 color: AppColors.textPrimary,
//               ),
//             ),
//             const SizedBox(width: 40),
//           ],
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 if (!isDesktop) ...[
//                   Center(
//                     child: Container(
//                       width: 80,
//                       height: 80,
//                       decoration: BoxDecoration(
//                         shape: BoxShape.circle,
//                         gradient: AppColors.primaryGradient,
//                       ),
//                       child: const Icon(
//                         Icons.person,
//                         size: 40,
//                         color: AppColors.textPrimary,
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 20),
//                 ],
//                 RichText(
//                   text: TextSpan(
//                     children: [
//                       TextSpan(
//                         text: "Hey, I'm ",
//                         style: GoogleFonts.poppins(
//                           color: AppColors.textPrimary,
//                           fontSize: isDesktop ? 48 : 32,
//                           fontWeight: FontWeight.w700,
//                           height: 1.2,
//                         ),
//                       ),
//                       TextSpan(
//                         text: "Nadhir",
//                         style: GoogleFonts.poppins(
//                           color: AppColors.accentPurple,
//                           fontSize: isDesktop ? 48 : 32,
//                           fontWeight: FontWeight.w700,
//                           height: 1.2,
//                         ),
//                       ),
//                       TextSpan(
//                         text: "✨",
//                         style: GoogleFonts.poppins(
//                           fontSize: isDesktop ? 48 : 32,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 const SizedBox(height: 8),
//                 RichText(
//                   text: TextSpan(
//                     children: [
//                       TextSpan(
//                         text: "A ",
//                         style: GoogleFonts.poppins(
//                           color: AppColors.textPrimary,
//                           fontSize: isDesktop ? 48 : 32,
//                           fontWeight: FontWeight.w700,
//                           height: 1.2,
//                         ),
//                       ),
//                       TextSpan(
//                         text: "Software Developer",
//                         style: GoogleFonts.poppins(
//                           color: AppColors.accentBlue,
//                           fontSize: isDesktop ? 48 : 32,
//                           fontWeight: FontWeight.w700,
//                           height: 1.2,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 const SizedBox(height: 24),
//                 Text(
//                   "A fullstack developer with solid foundations in design,\npassionate about crafting seamless user experiences I thrive at the intersection\nof creativity and functionality.",
//                   style: GoogleFonts.poppins(
//                     color: AppColors.textSecondary,
//                     fontSize: isDesktop ? 18 : 16,
//                     height: 1.6,
//                   ),
//                   maxLines: isDesktop ? null : 4,
//                   overflow: isDesktop ? null : TextOverflow.ellipsis,
//                 ),
//                 const SizedBox(height: 32),
//                 Row(
//                   children: [
//                     ElevatedButton(
//                       onPressed: () {},
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: AppColors.accentPurple,
//                         foregroundColor: AppColors.textPrimary,
//                         padding: const EdgeInsets.symmetric(
//                           horizontal: 24,
//                           vertical: 12,
//                         ),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(8),
//                         ),
//                       ),
//                       child: Row(
//                         mainAxisSize: MainAxisSize.min,
//                         children: [
//                           const Icon(Icons.mail_outline, size: 20),
//                           const SizedBox(width: 8),
//                           Text(
//                             'Contact Me',
//                             style: GoogleFonts.poppins(
//                               fontWeight: FontWeight.w500,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     const SizedBox(width: 16),
//                     OutlinedButton(
//                       onPressed: () {},
//                       style: OutlinedButton.styleFrom(
//                         foregroundColor: AppColors.textPrimary,
//                         side: const BorderSide(color: AppColors.borderColor),
//                         padding: const EdgeInsets.symmetric(
//                           horizontal: 24,
//                           vertical: 12,
//                         ),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(8),
//                         ),
//                       ),
//                       child: Row(
//                         mainAxisSize: MainAxisSize.min,
//                         children: [
//                           const Icon(Icons.visibility_outlined, size: 20),
//                           const SizedBox(width: 8),
//                           Text(
//                             'View Projects',
//                             style: GoogleFonts.poppins(
//                               fontWeight: FontWeight.w500,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 24),
//                 Row(
//                   children: [
//                     _SocialButton(Icons.code),
//                     const SizedBox(width: 12),
//                     _SocialButton(Icons.link),
//                     const SizedBox(width: 12),
//                     _SocialButton(Icons.work_outline),
//                     const SizedBox(width: 12),
//                     _SocialButton(Icons.close),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class _SocialButton extends StatelessWidget {
//   final IconData icon;

//   const _SocialButton(this.icon);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 40,
//       height: 40,
//       decoration: BoxDecoration(
//         color: AppColors.cardBackground,
//         borderRadius: BorderRadius.circular(8),
//         border: Border.all(color: AppColors.borderColor),
//       ),
//       child: Icon(
//         icon,
//         color: AppColors.textSecondary,
//         size: 20,
//       ),
//     );
//   }
// }

// // lib/widgets/services_section.dart
// // import 'package:flutter/material.dart';
// // import 'package:google_fonts/google_fonts.dart';
// // import '../core/colors/app_colors.dart';

// class ServicesSection extends StatelessWidget {
//   const ServicesSection({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final isDesktop = MediaQuery.of(context).size.width > 768;

//     return Container(
//       padding: EdgeInsets.symmetric(
//         horizontal: isDesktop ? 80 : 20,
//         vertical: 80,
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             'Building Digital Experiences',
//             style: GoogleFonts.poppins(
//               color: AppColors.textPrimary,
//               fontSize: isDesktop ? 36 : 28,
//               fontWeight: FontWeight.w700,
//             ),
//           ),
//           const SizedBox(height: 16),
//           Text(
//             'I specialize in creating stunning user experiences and developing high-quality applications that stand out.',
//             style: GoogleFonts.poppins(
//               color: AppColors.textSecondary,
//               fontSize: 16,
//               height: 1.6,
//             ),
//           ),
//           const SizedBox(height: 48),
//           GridView.count(
//             shrinkWrap: true,
//             physics: const NeverScrollableScrollPhysics(),
//             crossAxisCount: isDesktop ? 3 : 1,
//             childAspectRatio: isDesktop ? 1.2 : 2.5,
//             crossAxisSpacing: 24,
//             mainAxisSpacing: 24,
//             children: const [
//               _ServiceCard(
//                 icon: Icons.code_outlined,
//                 title: 'What I can do',
//                 description:
//                     'I can help develop solutions that will help you grow your business.',
//                 items: [
//                   'UI/UX Design',
//                   'Fullstack Web Development',
//                   'Mobile App Development',
//                   'Database Design',
//                   'API Integration',
//                 ],
//               ),
//               _ServiceCard(
//                 icon: Icons.build_outlined,
//                 title: 'Tools I Use',
//                 description:
//                     'I use the latest tools and technologies to build functional and scalable products.',
//                 items: [
//                   'Frontend: Flutter, CSS, React, TypeScript',
//                   'Backend: Node.js, Fastify, MongoDB, PostgreSQL',
//                   'Design: Figma, Framer, Photoshop',
//                 ],
//               ),
//               _ServiceCard(
//                 icon: Icons.palette_outlined,
//                 title: 'UI/UX Design',
//                 description:
//                     'I am a designer first, developer second. I can help design clean and modern interfaces.',
//                 items: [
//                   'User-Centered Design',
//                   'Modern & Clean UI',
//                   'Responsive Layouts',
//                   'Wireframes & Prototypes',
//                 ],
//               ),
//             ],
//           ),
//           const SizedBox(height: 48),
//           Center(
//             child: OutlinedButton.icon(
//               onPressed: () {},
//               style: OutlinedButton.styleFrom(
//                 foregroundColor: AppColors.textPrimary,
//                 side: const BorderSide(color: AppColors.borderColor),
//                 padding: const EdgeInsets.symmetric(
//                   horizontal: 32,
//                   vertical: 16,
//                 ),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//               ),
//               icon: const Icon(Icons.visibility_outlined),
//               label: Text(
//                 'View My Projects',
//                 style: GoogleFonts.poppins(
//                   fontWeight: FontWeight.w500,
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class _ServiceCard extends StatelessWidget {
//   final IconData icon;
//   final String title;
//   final String description;
//   final List<String> items;

//   const _ServiceCard({
//     required this.icon,
//     required this.title,
//     required this.description,
//     required this.items,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.all(24),
//       decoration: BoxDecoration(
//         color: AppColors.cardBackground,
//         borderRadius: BorderRadius.circular(12),
//         border: Border.all(color: AppColors.borderColor),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Container(
//             width: 48,
//             height: 48,
//             decoration: BoxDecoration(
//               color: AppColors.accentPurple.withOpacity(0.1),
//               borderRadius: BorderRadius.circular(8),
//             ),
//             child: Icon(
//               icon,
//               color: AppColors.accentPurple,
//               size: 24,
//             ),
//           ),
//           const SizedBox(height: 20),
//           Text(
//             title,
//             style: GoogleFonts.poppins(
//               color: AppColors.textPrimary,
//               fontSize: 20,
//               fontWeight: FontWeight.w600,
//             ),
//           ),
//           const SizedBox(height: 12),
//           Text(
//             description,
//             style: GoogleFonts.poppins(
//               color: AppColors.textSecondary,
//               fontSize: 14,
//               height: 1.5,
//             ),
//           ),
//           const SizedBox(height: 16),
//           ...items
//               .map((item) => Padding(
//                     padding: const EdgeInsets.only(bottom: 8),
//                     child: Row(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Container(
//                           width: 4,
//                           height: 4,
//                           margin: const EdgeInsets.only(top: 8, right: 12),
//                           decoration: const BoxDecoration(
//                             color: AppColors.accentPurple,
//                             shape: BoxShape.circle,
//                           ),
//                         ),
//                         Expanded(
//                           child: Text(
//                             item,
//                             style: GoogleFonts.poppins(
//                               color: AppColors.textMuted,
//                               fontSize: 13,
//                               height: 1.4,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ))
//               .toList(),
//         ],
//       ),
//     );
//   }
// }

// // lib/widgets/contact_section.dart
// // import 'package:flutter/material.dart';
// // import 'package:get/get.dart';
// // import 'package:google_fonts/google_fonts.dart';
// // import '../core/colors/app_colors.dart';
// // import '../controllers/portfolio_controller.dart';

// class ContactSection extends StatelessWidget {
//   const ContactSection({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final controller = Get.find<PortfolioController>();
//     final isDesktop = MediaQuery.of(context).size.width > 768;

//     return Container(
//       padding: EdgeInsets.symmetric(
//         horizontal: isDesktop ? 80 : 20,
//         vertical: 80,
//       ),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Expanded(
//             flex: isDesktop ? 1 : 2,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   'Bringing your ideas to life.',
//                   style: GoogleFonts.poppins(
//                     color: AppColors.textPrimary,
//                     fontSize: isDesktop ? 48 : 32,
//                     fontWeight: FontWeight.w700,
//                     height: 1.2,
//                   ),
//                 ),
//                 Text(
//                   'Let\'s turn your vision into reality',
//                   style: GoogleFonts.poppins(
//                     color: AppColors.accentPurple,
//                     fontSize: isDesktop ? 48 : 32,
//                     fontWeight: FontWeight.w700,
//                     height: 1.2,
//                   ),
//                 ),
//                 const SizedBox(height: 24),
//                 Text(
//                   'Have a project in mind or just want to chat? Let\'s connect!',
//                   style: GoogleFonts.poppins(
//                     color: AppColors.textSecondary,
//                     fontSize: 16,
//                     height: 1.6,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           if (isDesktop) const SizedBox(width: 80),
//           Expanded(
//             flex: 1,
//             child: Container(
//               padding: const EdgeInsets.all(32),
//               decoration: BoxDecoration(
//                 color: AppColors.cardBackground,
//                 borderRadius: BorderRadius.circular(16),
//                 border: Border.all(color: AppColors.borderColor),
//               ),
//               child: Column(
//                 children: [
//                   _ContactField(
//                     label: 'Name',
//                     placeholder: 'Your Name',
//                     onChanged: (value) =>
//                         controller.updateContactForm(name: value),
//                   ),
//                   const SizedBox(height: 20),
//                   _ContactField(
//                     label: 'Email',
//                     placeholder: 'contact@example.com',
//                     onChanged: (value) =>
//                         controller.updateContactForm(email: value),
//                   ),
//                   const SizedBox(height: 20),
//                   _ContactField(
//                     label: 'Message',
//                     placeholder: 'Your message here...',
//                     maxLines: 4,
//                     onChanged: (value) =>
//                         controller.updateContactForm(message: value),
//                   ),
//                   const SizedBox(height: 24),
//                   SizedBox(
//                     width: double.infinity,
//                     child: ElevatedButton(
//                       onPressed: controller.sendMessage,
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: AppColors.accentPurple,
//                         foregroundColor: AppColors.textPrimary,
//                         padding: const EdgeInsets.symmetric(vertical: 16),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(8),
//                         ),
//                       ),
//                       child: Text(
//                         'Send',
//                         style: GoogleFonts.poppins(
//                           fontWeight: FontWeight.w600,
//                           fontSize: 16,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class _ContactField extends StatelessWidget {
//   final String label;
//   final String placeholder;
//   final int maxLines;
//   final Function(String) onChanged;

//   const _ContactField({
//     required this.label,
//     required this.placeholder,
//     required this.onChanged,
//     this.maxLines = 1,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           label,
//           style: GoogleFonts.poppins(
//             color: AppColors.textPrimary,
//             fontSize: 14,
//             fontWeight: FontWeight.w500,
//           ),
//         ),
//         const SizedBox(height: 8),
//         TextField(
//           onChanged: onChanged,
//           maxLines: maxLines,
//           style: GoogleFonts.poppins(
//             color: AppColors.textPrimary,
//             fontSize: 14,
//           ),
//           decoration: InputDecoration(
//             hintText: placeholder,
//             hintStyle: GoogleFonts.poppins(
//               color: AppColors.textMuted,
//               fontSize: 14,
//             ),
//             filled: true,
//             fillColor: AppColors.primaryDark,
//             border: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(8),
//               borderSide: const BorderSide(color: AppColors.borderColor),
//             ),
//             enabledBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(8),
//               borderSide: const BorderSide(color: AppColors.borderColor),
//             ),
//             focusedBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(8),
//               borderSide: const BorderSide(color: AppColors.accentPurple),
//             ),
//             contentPadding: const EdgeInsets.all(16),
//           ),
//         ),
//       ],
//     );
//   }
// }

// // lib/widgets/footer.dart
// // import 'package:flutter/material.dart';
// // import 'package:google_fonts/google_fonts.dart';
// // import '../core/colors/app_colors.dart';

// class Footer extends StatelessWidget {
//   const Footer({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final isDesktop = MediaQuery.of(context).size.width > 768;

//     return Container(
//       padding: EdgeInsets.symmetric(
//         horizontal: isDesktop ? 80 : 20,
//         vertical: 40,
//       ),
//       decoration: const BoxDecoration(
//         border: Border(
//           top: BorderSide(color: AppColors.borderColor),
//         ),
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 'Nadhir Hamid Bouthaiba',
//                 style: GoogleFonts.poppins(
//                   color: AppColors.textPrimary,
//                   fontSize: 16,
//                   fontWeight: FontWeight.w600,
//                 ),
//               ),
//               const SizedBox(height: 4),
//               Text(
//                 '🇩🇿 Based in Algeria',
//                 style: GoogleFonts.poppins(
//                   color: AppColors.textMuted,
//                   fontSize: 14,
//                 ),
//               ),
//               const SizedBox(height: 12),
//               Text(
//                 '© 2024 Nadhir. All rights reserved.',
//                 style: GoogleFonts.poppins(
//                   color: AppColors.textMuted,
//                   fontSize: 12,
//                 ),
//               ),
//             ],
//           ),
//           if (isDesktop)
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.end,
//               children: [
//                 Text(
//                   'Website Designed in Figma, Built with Next.js, Typescript',
//                   style: GoogleFonts.poppins(
//                     color: AppColors.textMuted,
//                     fontSize: 12,
//                   ),
//                 ),
//                 const SizedBox(height: 4),
//                 Text(
//                   'and Tailwind CSS.',
//                   style: GoogleFonts.poppins(
//                     color: AppColors.textMuted,
//                     fontSize: 12,
//                   ),
//                 ),
//                 const SizedBox(height: 12),
//                 Row(
//                   children: [
//                     _FooterIcon(Icons.code),
//                     const SizedBox(width: 12),
//                     _FooterIcon(Icons.link),
//                     const SizedBox(width: 12),
//                     _FooterIcon(Icons.work_outline),
//                     const SizedBox(width: 12),
//                     _FooterIcon(Icons.close),
//                   ],
//                 ),
//               ],
//             ),
//         ],
//       ),
//     );
//   }
// }

// class _FooterIcon extends StatelessWidget {
//   final IconData icon;

//   const _FooterIcon(this.icon);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 32,
//       height: 32,
//       decoration: BoxDecoration(
//         color: AppColors.cardBackground,
//         borderRadius: BorderRadius.circular(6),
//         border: Border.all(color: AppColors.borderColor),
//       ),
//       child: Icon(
//         icon,
//         color: AppColors.textMuted,
//         size: 16,
//       ),
//     );
//   }
// }

// // lib/main.dart

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return GetMaterialApp(
//       title: 'Nadhir Portfolio',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         scaffoldBackgroundColor: AppColors.primaryDark,
//         textTheme: GoogleFonts.poppinsTextTheme(),
//       ),
//       home: const PortfolioHomePage(),
//       initialBinding: BindingsBuilder(() {
//         Get.put(PortfolioController());
//       }),
//     );
//   }
// }

// class PortfolioHomePage extends StatelessWidget {
//   const PortfolioHomePage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       extendBodyBehindAppBar: true,
//       appBar: const CustomAppBar(),
//       body: Container(
//         decoration: BoxDecoration(
//           gradient: AppColors.backgroundGradient,
//         ),
//         child: const SingleChildScrollView(
//           child: Column(
//             children: [
//               HeroSection(),
//               ServicesSection(),
//               ContactSection(),
//               Footer(),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
