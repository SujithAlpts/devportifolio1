// // ------------------------------
// // Flutter Web Portfolio (GetX)
// // Theme: Orange & White · Animated Background · Modern Design
// // Single-file main.dart for quick start
// // ------------------------------
// //
// // 📦 pubspec.yaml (add these)
// //
// // name: sujith_portfolio
// // description: Portfolio website built with Flutter Web + GetX
// // publish_to: 'none'
// // environment:
// //   sdk: ">=3.5.0 <4.0.0"
// // dependencies:
// //   flutter:
// //     sdk: flutter
// //   get: ^4.6.6
// //   url_launcher: ^6.3.0
// //   google_fonts: ^6.2.1
// //
// // flutter:
// //   uses-material-design: true
// //   assets:
// //     - assets/resume.pdf
// //     - assets/profile.jpg
// //     - assets/project_1.png
// //     - assets/project_2.png
// //     - assets/project_3.png
// //
// // ⚠️ Replace placeholder images/links above with your own.
// // ------------------------------
// import 'package:flutter_localizations/flutter_localizations.dart';

// import 'dart:math' as math;
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:url_launcher/url_launcher.dart';

// void main() {
//   WidgetsFlutterBinding.ensureInitialized();
//   Get.put(NavController());
//   runApp(const PortfolioApp());
// }

// class PortfolioApp extends StatelessWidget {
//   const PortfolioApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final baseTheme = ThemeData(
//       brightness: Brightness.light,
//       colorScheme: ColorScheme.fromSeed(
//         seedColor: const Color(0xFFFF6A00),
//         primary: const Color(0xFFFF6A00), // orange
//         secondary: const Color(0xFFFFA559),
//         background: Colors.white,
//       ),
//       useMaterial3: true,
//       scaffoldBackgroundColor: Colors.white,
//       textTheme: GoogleFonts.poppinsTextTheme(),
//     );

//     return GetMaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: "My App",
//       // translations: MyTranslations(), // if using localization
//       locale: const Locale('en', 'US'), // default locale
//       fallbackLocale: const Locale('en', 'US'),
//       theme: ThemeData(
//         primarySwatch: Colors.orange,
//         fontFamily: GoogleFonts.poppins().fontFamily,
//       ),
//       // darkTheme: ThemeData.dark(),
//       home: const HomePage(),
//     );

//     // GetMaterialApp(
//     //   debugShowCheckedModeBanner: false,
//     //   title: 'My Portfolio',
//     //   theme: ThemeData(
//     //     primarySwatch: Colors.orange,
//     //     fontFamily: GoogleFonts.poppins().fontFamily,
//     //   ),
//     //   // 👇 Add these
//     //   supportedLocales: const [
//     //     Locale('en', 'US'),
//     //   ],
//     //   localizationsDelegates: const [
//     //     GlobalMaterialLocalizations.delegate,
//     //     GlobalWidgetsLocalizations.delegate,
//     //     GlobalCupertinoLocalizations.delegate,
//     //   ],
//     //   home: const HomePage(),
//     // );
//   }
// }

// class NavController extends GetxController with GetTickerProviderStateMixin {
//   final scrollController = ScrollController();
//   final sections = <_SectionId, GlobalKey>{}.obs;

//   late final AnimationController bgController;

//   @override
//   void onInit() {
//     super.onInit();
//     for (final id in _SectionId.values) {
//       sections[id] = GlobalKey();
//     }
//     bgController = AnimationController(
//       vsync: this,
//       duration: const Duration(seconds: 12),
//     )..repeat(reverse: true);
//   }

//   Future<void> scrollTo(_SectionId id) async {
//     final key = sections[id]!;
//     final ctx = key.currentContext;
//     if (ctx == null) return;
//     await Scrollable.ensureVisible(
//       ctx,
//       duration: const Duration(milliseconds: 700),
//       curve: Curves.easeInOutCubic,
//       alignment: 0.05,
//     );
//   }

//   @override
//   void onClose() {
//     bgController.dispose();
//     scrollController.dispose();
//     super.onClose();
//   }
// }

// enum _SectionId {
//   about,
//   skills,
//   projects,
//   experience,
//   achievements,
//   education,
//   testimonials,
//   resume,
//   contact,
// }

// class HomePage extends GetView<NavController> {
//   const HomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final isWide = MediaQuery.of(context).size.width >= 1000;

//     return Scaffold(
//       appBar: PreferredSize(
//         preferredSize: const Size.fromHeight(70),
//         child: GlassAppBar(isWide: isWide),
//       ),
//       body: Stack(
//         children: [
//           // Animated blob/gradient background
//           Positioned.fill(
//             child: AnimatedBuilder(
//               animation: controller.bgController,
//               builder: (context, _) {
//                 return CustomPaint(
//                   painter: _BlobsPainter(
//                     progress: controller.bgController.value,
//                   ),
//                 );
//               },
//             ),
//           ),
//           // Content
//           Positioned.fill(
//             child: SingleChildScrollView(
//               controller: controller.scrollController,
//               padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
//               child: Center(
//                 child: ConstrainedBox(
//                   constraints: const BoxConstraints(maxWidth: 1200),
//                   child: const Column(
//                     crossAxisAlignment: CrossAxisAlignment.stretch,
//                     children: [
//                       AdvancedHeroIntro(),
//                       SizedBox(height: 36),
//                       _SkillsSection(),
//                       SizedBox(height: 36),
//                       _ProjectsSection(),
//                       SizedBox(height: 36),
//                       _ExperienceSection(),
//                       SizedBox(height: 36),
//                       _AchievementsSection(),
//                       SizedBox(height: 36),
//                       _EducationSection(),
//                       SizedBox(height: 36),
//                       // _TestimonialsSection(),
//                       SizedBox(height: 36),
//                       // _ResumeSection(),
//                       // SizedBox(height: 36),
//                       _ContactSection(),
//                       SizedBox(height: 48),
//                       _Footer(),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class GlassAppBar extends GetView<NavController> {
//   const GlassAppBar({required this.isWide});
//   final bool isWide;

//   @override
//   Widget build(BuildContext context) {
//     final items = [
//       ('About', _SectionId.about),
//       ('Skills', _SectionId.skills),
//       ('Projects', _SectionId.projects),
//       ('Experience', _SectionId.experience),
//       ('Highlights', _SectionId.achievements),
//       ('Education', _SectionId.education),
//       ('Testimonials', _SectionId.testimonials),
//       ('Resume', _SectionId.resume),
//       ('Contact', _SectionId.contact),
//     ];

//     return Container(
//       margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//       decoration: BoxDecoration(
//         color: Colors.white.withOpacity(0.7),
//         borderRadius: BorderRadius.circular(16),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.05),
//             blurRadius: 20,
//           )
//         ],
//         border: Border.all(color: Colors.orange.withOpacity(0.15)),
//       ),
//       child: Row(
//         children: [
//           const SizedBox(width: 16),
//           _LogoMark(),
//           const Spacer(),
//           if (isWide)
//             Row(
//               children: [
//                 for (final (label, id) in items)
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 6.0),
//                     child: TextButton(
//                       onPressed: () => controller.scrollTo(id),
//                       style: TextButton.styleFrom(
//                         foregroundColor: Colors.black87,
//                         padding: const EdgeInsets.symmetric(
//                           horizontal: 14,
//                           vertical: 10,
//                         ),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(12),
//                         ),
//                       ),
//                       child: Text(label),
//                     ),
//                   ),
//               ],
//             ),
//           if (!isWide)
//             PopupMenuButton<_SectionId>(
//               icon: const Icon(Icons.menu),
//               onSelected: controller.scrollTo,
//               itemBuilder: (context) => items
//                   .map((e) => PopupMenuItem(
//                         value: e.$2,
//                         child: Text(e.$1),
//                       ))
//                   .toList(),
//             ),
//           const SizedBox(width: 8),
//         ],
//       ),
//     );
//   }
// }

// class _LogoMark extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         Container(
//           width: 36,
//           height: 36,
//           decoration: BoxDecoration(
//             shape: BoxShape.circle,
//             gradient: const LinearGradient(
//               colors: [Color(0xFFFF6A00), Color(0xFFFFA559)],
//             ),
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.orange.withOpacity(0.4),
//                 blurRadius: 12,
//                 offset: const Offset(0, 4),
//               )
//             ],
//           ),
//           child: const Center(
//             child: Text(
//               'SS',
//               style: TextStyle(
//                 color: Colors.white,
//                 fontWeight: FontWeight.w800,
//               ),
//             ),
//           ),
//         ),
//         const SizedBox(width: 12),
//         Text(
//           'Sujith · Flutter Dev',
//           style: GoogleFonts.poppins(
//             fontWeight: FontWeight.w700,
//           ),
//         ),
//       ],
//     );
//   }
// }

// // ---------- Sections ----------
// class _SectionWrap extends StatelessWidget {
//   const _SectionWrap({
//     required this.id,
//     required this.title,
//     required this.child,
//     this.subtitle,
//   });
//   final _SectionId id;
//   final String title;
//   final String? subtitle;
//   final Widget child;

//   @override
//   Widget build(BuildContext context) {
//     final c = Get.find<NavController>();
//     return Container(
//       key: c.sections[id],
//       margin: const EdgeInsets.symmetric(vertical: 8),
//       padding: const EdgeInsets.symmetric(vertical: 24),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             title,
//             style: GoogleFonts.poppins(
//               fontSize: 28,
//               fontWeight: FontWeight.w800,
//             ),
//           ),
//           if (subtitle != null) ...[
//             const SizedBox(height: 6),
//             Text(
//               subtitle!,
//               style: TextStyle(
//                 color: Colors.black.withOpacity(0.6),
//               ),
//             )
//           ],
//           const SizedBox(height: 18),
//           child,
//         ],
//       ),
//     );
//   }
// }

// class AdvancedHeroIntro extends StatefulWidget {
//   const AdvancedHeroIntro({Key? key}) : super(key: key);

//   @override
//   State<AdvancedHeroIntro> createState() => _AdvancedHeroIntroState();
// }

// class _AdvancedHeroIntroState extends State<AdvancedHeroIntro>
//     with TickerProviderStateMixin {
//   late AnimationController _fadeController;
//   late AnimationController _slideController;
//   late AnimationController _scaleController;
//   late AnimationController _rotateController;
//   late AnimationController _pulseController;

//   late Animation<double> _fadeAnimation;
//   late Animation<Offset> _slideAnimation;
//   late Animation<double> _scaleAnimation;
//   late Animation<double> _rotateAnimation;
//   late Animation<double> _pulseAnimation;

//   bool _isHovered = false;

//   @override
//   void initState() {
//     super.initState();

//     _fadeController = AnimationController(
//       duration: const Duration(milliseconds: 1200),
//       vsync: this,
//     );

//     _slideController = AnimationController(
//       duration: const Duration(milliseconds: 1000),
//       vsync: this,
//     );

//     _scaleController = AnimationController(
//       duration: const Duration(milliseconds: 300),
//       vsync: this,
//     );

//     _rotateController = AnimationController(
//       duration: const Duration(seconds: 20),
//       vsync: this,
//     )..repeat();

//     _pulseController = AnimationController(
//       duration: const Duration(milliseconds: 2000),
//       vsync: this,
//     )..repeat(reverse: true);

//     _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
//       CurvedAnimation(parent: _fadeController, curve: Curves.easeOut),
//     );

//     _slideAnimation = Tween<Offset>(
//       begin: const Offset(0, 0.3),
//       end: Offset.zero,
//     ).animate(CurvedAnimation(parent: _slideController, curve: Curves.easeOut));

//     _scaleAnimation = Tween<double>(begin: 1.0, end: 1.05).animate(
//       CurvedAnimation(parent: _scaleController, curve: Curves.easeInOut),
//     );

//     _rotateAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
//       CurvedAnimation(parent: _rotateController, curve: Curves.linear),
//     );

//     _pulseAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(
//       CurvedAnimation(parent: _pulseController, curve: Curves.easeInOut),
//     );

//     // Start animations with delays
//     _fadeController.forward();
//     Future.delayed(const Duration(milliseconds: 200), () {
//       if (mounted) _slideController.forward();
//     });
//   }

//   @override
//   void dispose() {
//     _fadeController.dispose();
//     _slideController.dispose();
//     _scaleController.dispose();
//     _rotateController.dispose();
//     _pulseController.dispose();
//     super.dispose();
//   }

//   void _onHover(bool isHovered) {
//     setState(() {
//       _isHovered = isHovered;
//     });
//     if (isHovered) {
//       _scaleController.forward();
//     } else {
//       _scaleController.reverse();
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     final isWide = MediaQuery.of(context).size.width > 900;
//     final screenWidth = MediaQuery.of(context).size.width;

//     return AnimatedBuilder(
//       animation: Listenable.merge([
//         _fadeAnimation,
//         _slideAnimation,
//         _scaleAnimation,
//         _rotateAnimation,
//         _pulseAnimation,
//       ]),
//       builder: (context, child) {
//         return FadeTransition(
//           opacity: _fadeAnimation,
//           child: SlideTransition(
//             position: _slideAnimation,
//             child: _SectionWrap(
//               id: _SectionId.about,
//               title: 'Hi, I\'m Sujith — Flutter Developer',
//               subtitle:
//                   'I design and build pixel-perfect, high-performance mobile & web apps. Passionate about clean architecture, GetX, and delightful user experiences.',
//               child: Container(
//                 decoration: _advancedCardDecoration(context),
//                 padding: const EdgeInsets.all(32),
//                 child: Flex(
//                   direction: isWide ? Axis.horizontal : Axis.vertical,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     // Content Section
//                     Expanded(
//                       flex: isWide ? 6 : 1,
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           _buildAnimatedTitle(screenWidth),
//                           const SizedBox(height: 20),
//                           _buildAnimatedSubtitle(),
//                           const SizedBox(height: 24),
//                           _buildLocationSection(),
//                           const SizedBox(height: 32),
//                           _buildActionButtons(),
//                           const SizedBox(height: 24),
//                           _buildStatsSection(),
//                         ],
//                       ),
//                     ),

//                     SizedBox(
//                       width: isWide ? 40 : 0,
//                       height: isWide ? 0 : 32,
//                     ),

//                     // Profile Image Section
//                     Expanded(
//                       flex: isWide ? 4 : 1,
//                       child: _buildProfileSection(),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }

//   Widget _buildAnimatedTitle(double screenWidth) {
//     return TweenAnimationBuilder<double>(
//       duration: const Duration(milliseconds: 1500),
//       tween: Tween(begin: 0.0, end: 1.0),
//       builder: (context, value, child) {
//         return ShaderMask(
//           shaderCallback: (bounds) {
//             return LinearGradient(
//               colors: [
//                 Colors.orange,
//                 Colors.deepOrange,
//                 Colors.orange.shade700,
//               ],
//               stops: [0.0, value, 1.0],
//             ).createShader(bounds);
//           },
//           child: Text(
//             'Building Tomorrow\'s\nMobile Experiences',
//             style: TextStyle(
//               fontSize: screenWidth < 600 ? 28 : 36,
//               fontWeight: FontWeight.bold,
//               color: Colors.white,
//               height: 1.2,
//               letterSpacing: -0.5,
//             ),
//           ),
//         );
//       },
//     );
//   }

//   Widget _buildAnimatedSubtitle() {
//     return TweenAnimationBuilder<double>(
//       duration: const Duration(milliseconds: 2000),
//       tween: Tween(begin: 0.0, end: 1.0),
//       builder: (context, value, child) {
//         return Opacity(
//           opacity: value,
//           child: Transform.translate(
//             offset: Offset(0, 20 * (1 - value)),
//             child: Text(
//               'Crafting seamless user experiences with Flutter, focusing on performance, scalability, and beautiful design that users love.',
//               style: TextStyle(
//                 fontSize: 16,
//                 color: Colors.black.withOpacity(0.7),
//                 height: 1.6,
//                 letterSpacing: 0.2,
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }

//   Widget _buildLocationSection() {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//       decoration: BoxDecoration(
//         color: Colors.orange.withOpacity(0.1),
//         borderRadius: BorderRadius.circular(12),
//         border: Border.all(
//           color: Colors.orange.withOpacity(0.2),
//           width: 1,
//         ),
//       ),
//       child: Row(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           AnimatedBuilder(
//             animation: _pulseAnimation,
//             builder: (context, child) {
//               return Transform.scale(
//                 scale: _pulseAnimation.value,
//                 child: Container(
//                   width: 8,
//                   height: 8,
//                   decoration: BoxDecoration(
//                     color: Colors.green,
//                     shape: BoxShape.circle,
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.green.withOpacity(0.5),
//                         blurRadius: 4,
//                         spreadRadius: 1,
//                       ),
//                     ],
//                   ),
//                 ),
//               );
//             },
//           ),
//           const SizedBox(width: 12),
//           const Icon(Icons.location_on, size: 18, color: Colors.orange),
//           const SizedBox(width: 8),
//           const Text(
//             'Kerala, India',
//             style: TextStyle(
//               fontWeight: FontWeight.w600,
//               color: Colors.black87,
//             ),
//           ),
//           const SizedBox(width: 16),
//           Container(
//             padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
//             decoration: BoxDecoration(
//               color: Colors.green.withOpacity(0.1),
//               borderRadius: BorderRadius.circular(8),
//             ),
//             child: const Text(
//               'Available for hire',
//               style: TextStyle(
//                 fontSize: 12,
//                 color: Colors.green,
//                 fontWeight: FontWeight.w600,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildActionButtons() {
//     return Wrap(
//       spacing: 16,
//       runSpacing: 12,
//       children: [
//         _AdvancedPrimaryButton(
//           label: 'View My Work',
//           icon: Icons.work_outline,
//           onTap: () => Get.find<NavController>().scrollTo(_SectionId.projects),
//         ),
//         _AdvancedGhostButton(
//           label: 'Let\'s Connect',
//           icon: Icons.connect_without_contact,
//           onTap: () => Get.find<NavController>().scrollTo(_SectionId.contact),
//         ),
//         // _IconButton(
//         //   icon: Icons.file_download,
//         //   tooltip: 'Download Resume',
//         //   onTap: () {
//         //     // Handle resume download
//         //     print('Downloading resume...');
//         //   },
//         // ),
//       ],
//     );
//   }

//   Widget _buildStatsSection() {
//     return const Row(
//       children: [
//         _StatItem(
//           number: '15+',
//           label: 'Projects',
//           icon: Icons.code,
//         ),
//         const SizedBox(width: 32),
//         _StatItem(
//           number: '2+',
//           label: 'Years',
//           icon: Icons.timeline,
//         ),
//         // const SizedBox(width: 32),
//         // _StatItem(
//         //   number: '25+',
//         //   label: 'Clients',
//         //   icon: Icons.people,
//         // ),
//       ],
//     );
//   }

//   Widget _buildProfileSection() {
//     return MouseRegion(
//       onEnter: (_) => _onHover(true),
//       onExit: (_) => _onHover(false),
//       child: Stack(
//         alignment: Alignment.center,
//         children: [
//           // Animated background circles
//           AnimatedBuilder(
//             animation: _rotateAnimation,
//             builder: (context, child) {
//               return Transform.rotate(
//                 angle: _rotateAnimation.value * 2 * 3.14159,
//                 child: Container(
//                   width: 300,
//                   height: 300,
//                   decoration: BoxDecoration(
//                     shape: BoxShape.circle,
//                     gradient: SweepGradient(
//                       colors: [
//                         Colors.orange.withOpacity(0.1),
//                         Colors.deepOrange.withOpacity(0.2),
//                         Colors.orange.withOpacity(0.1),
//                         Colors.transparent,
//                       ],
//                     ),
//                   ),
//                 ),
//               );
//             },
//           ),

//           // Pulse circles
//           AnimatedBuilder(
//             animation: _pulseAnimation,
//             builder: (context, child) {
//               return Container(
//                 width: 280 * _pulseAnimation.value,
//                 height: 280 * _pulseAnimation.value,
//                 decoration: BoxDecoration(
//                   shape: BoxShape.circle,
//                   border: Border.all(
//                     color: Colors.orange
//                         .withOpacity(0.3 * (1 - _pulseAnimation.value)),
//                     width: 2,
//                   ),
//                 ),
//               );
//             },
//           ),

//           // Profile image
//           AnimatedBuilder(
//             animation: _scaleAnimation,
//             builder: (context, child) {
//               return Transform.scale(
//                 scale: _scaleAnimation.value,
//                 child: Container(
//                   width: 240,
//                   height: 240,
//                   decoration: BoxDecoration(
//                     shape: BoxShape.circle,
//                     gradient: const LinearGradient(
//                       begin: Alignment.topLeft,
//                       end: Alignment.bottomRight,
//                       colors: [
//                         Color(0xFFFFE8D6),
//                         Colors.white,
//                         Color(0xFFFFF4E6),
//                       ],
//                     ),
//                     border: Border.all(
//                       color: Colors.orange.withOpacity(0.3),
//                       width: 3,
//                     ),
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.orange.withOpacity(0.2),
//                         blurRadius: 20,
//                         spreadRadius: 5,
//                         offset: const Offset(0, 10),
//                       ),
//                     ],
//                   ),
//                   child: ClipOval(
//                     child: Image.asset(
//                       'assets/profile.jpg',
//                       fit: BoxFit.cover,
//                       errorBuilder: (_, __, ___) => Container(
//                         decoration: BoxDecoration(
//                           gradient: LinearGradient(
//                             begin: Alignment.topLeft,
//                             end: Alignment.bottomRight,
//                             colors: [
//                               Colors.orange.shade100,
//                               Colors.orange.shade200,
//                             ],
//                           ),
//                         ),
//                         child: Center(
//                           child: Icon(
//                             Icons.person,
//                             size: 80,
//                             color: Colors.orange.shade400,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               );
//             },
//           ),

//           // Floating action button for social links
//           Positioned(
//             bottom: 20,
//             right: 20,
//             child: AnimatedOpacity(
//               duration: const Duration(milliseconds: 300),
//               opacity: _isHovered ? 1.0 : 0.0,
//               child: Container(
//                 padding: const EdgeInsets.all(8),
//                 decoration: BoxDecoration(
//                   color: Colors.orange,
//                   shape: BoxShape.circle,
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.orange.withOpacity(0.3),
//                       blurRadius: 8,
//                       spreadRadius: 2,
//                     ),
//                   ],
//                 ),
//                 child: const Icon(
//                   Icons.link,
//                   color: Colors.white,
//                   size: 20,
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   BoxDecoration _advancedCardDecoration(BuildContext context) {
//     return BoxDecoration(
//       color: Colors.white,
//       borderRadius: BorderRadius.circular(24),
//       border: Border.all(
//         color: Colors.orange.withOpacity(0.1),
//         width: 1,
//       ),
//       boxShadow: [
//         BoxShadow(
//           color: Colors.orange.withOpacity(0.1),
//           blurRadius: 20,
//           spreadRadius: 0,
//           offset: const Offset(0, 10),
//         ),
//         BoxShadow(
//           color: Colors.black.withOpacity(0.05),
//           blurRadius: 40,
//           spreadRadius: 0,
//           offset: const Offset(0, 20),
//         ),
//       ],
//       gradient: LinearGradient(
//         begin: Alignment.topLeft,
//         end: Alignment.bottomRight,
//         colors: [
//           Colors.white,
//           Colors.orange.withOpacity(0.02),
//         ],
//       ),
//     );
//   }
// }

// class _AdvancedPrimaryButton extends StatefulWidget {
//   final String label;
//   final IconData icon;
//   final VoidCallback onTap;

//   const _AdvancedPrimaryButton({
//     required this.label,
//     required this.icon,
//     required this.onTap,
//   });

//   @override
//   State<_AdvancedPrimaryButton> createState() => _AdvancedPrimaryButtonState();
// }

// class _AdvancedPrimaryButtonState extends State<_AdvancedPrimaryButton>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<double> _scaleAnimation;
//   late Animation<double> _shimmerAnimation;

//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       duration: const Duration(milliseconds: 200),
//       vsync: this,
//     );
//     _scaleAnimation = Tween<double>(begin: 1.0, end: 0.95).animate(
//       CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
//     );
//     _shimmerAnimation = Tween<double>(begin: -1.0, end: 2.0).animate(
//       CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
//     );
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return AnimatedBuilder(
//       animation: _controller,
//       builder: (context, child) {
//         return Transform.scale(
//           scale: _scaleAnimation.value,
//           child: GestureDetector(
//             onTapDown: (_) => _controller.forward(),
//             onTapUp: (_) => _controller.reverse(),
//             onTapCancel: () => _controller.reverse(),
//             onTap: widget.onTap,
//             child: Container(
//               padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
//               decoration: BoxDecoration(
//                 gradient: const LinearGradient(
//                   colors: [Colors.orange, Colors.deepOrange],
//                 ),
//                 borderRadius: BorderRadius.circular(12),
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.orange.withOpacity(0.4),
//                     blurRadius: 12,
//                     offset: const Offset(0, 6),
//                   ),
//                 ],
//               ),
//               child: Row(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   Icon(widget.icon, color: Colors.white, size: 20),
//                   const SizedBox(width: 8),
//                   Text(
//                     widget.label,
//                     style: const TextStyle(
//                       color: Colors.white,
//                       fontWeight: FontWeight.w600,
//                       fontSize: 16,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }

// class _AdvancedGhostButton extends StatefulWidget {
//   final String label;
//   final IconData icon;
//   final VoidCallback onTap;

//   const _AdvancedGhostButton({
//     required this.label,
//     required this.icon,
//     required this.onTap,
//   });

//   @override
//   State<_AdvancedGhostButton> createState() => _AdvancedGhostButtonState();
// }

// class _AdvancedGhostButtonState extends State<_AdvancedGhostButton> {
//   bool _isHovered = false;

//   @override
//   Widget build(BuildContext context) {
//     return MouseRegion(
//       onEnter: (_) => setState(() => _isHovered = true),
//       onExit: (_) => setState(() => _isHovered = false),
//       child: GestureDetector(
//         onTap: widget.onTap,
//         child: AnimatedContainer(
//           duration: const Duration(milliseconds: 200),
//           padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
//           decoration: BoxDecoration(
//             color: _isHovered ? Colors.orange : Colors.transparent,
//             border: Border.all(
//               color: Colors.orange,
//               width: 2,
//             ),
//             borderRadius: BorderRadius.circular(12),
//           ),
//           child: Row(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Icon(
//                 widget.icon,
//                 color: _isHovered ? Colors.white : Colors.orange,
//                 size: 20,
//               ),
//               const SizedBox(width: 8),
//               Text(
//                 widget.label,
//                 style: TextStyle(
//                   color: _isHovered ? Colors.white : Colors.orange,
//                   fontWeight: FontWeight.w600,
//                   fontSize: 16,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class _IconButton extends StatelessWidget {
//   final IconData icon;
//   final String tooltip;
//   final VoidCallback onTap;

//   const _IconButton({
//     required this.icon,
//     required this.tooltip,
//     required this.onTap,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Tooltip(
//       message: tooltip,
//       child: GestureDetector(
//         onTap: onTap,
//         child: Container(
//           padding: const EdgeInsets.all(12),
//           decoration: BoxDecoration(
//             color: Colors.grey.shade100,
//             border: Border.all(
//               color: Colors.grey.shade300,
//               width: 1,
//             ),
//             borderRadius: BorderRadius.circular(12),
//           ),
//           child: Icon(
//             icon,
//             color: Colors.grey.shade700,
//             size: 20,
//           ),
//         ),
//       ),
//     );
//   }
// }

// class _StatItem extends StatelessWidget {
//   final String number;
//   final String label;
//   final IconData icon;

//   const _StatItem({
//     required this.number,
//     required this.label,
//     required this.icon,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Row(
//           children: [
//             Icon(icon, size: 16, color: Colors.orange),
//             const SizedBox(width: 4),
//             Text(
//               number,
//               style: const TextStyle(
//                 fontSize: 20,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.black87,
//               ),
//             ),
//           ],
//         ),
//         Text(
//           label,
//           style: TextStyle(
//             fontSize: 12,
//             color: Colors.grey.shade600,
//           ),
//         ),
//       ],
//     );
//   }
// }

// // Placeholder classes - replace with your actual implementations

// class _SkillsSection extends StatelessWidget {
//   const _SkillsSection();

//   @override
//   Widget build(BuildContext context) {
//     return const _SectionWrap(
//       id: _SectionId.skills,
//       title: 'Skills & Tech Stack',
//       child: Wrap(
//         spacing: 12,
//         runSpacing: 12,
//         children: [
//           _SkillCard('Dart'),
//           // _SkillCard('Java'),
//           // _SkillCard('Kotlin'),
//           _SkillCard('Flutter'),
//           _SkillCard('GetX'),
//           _SkillCard('Provider'),
//           // _SkillCard('Firebase Firestore'),
//           // _SkillCard('SQLite'),
//           // _SkillCard('MySQL'),
//           _SkillCard('Git'),
//           _SkillCard('Postman'),
//           _SkillCard('VS Code'),
//           _SkillCard('Android Studio'),
//           _SkillCard('Xcode'),
//           _SkillCard('REST API'),
//           _SkillCard('Instamojo Payments'),
//           _SkillCard('Zoom SDK'),
//           _SkillCard('Razorpay'),
//           _SkillCard('Shorebird'),
//         ],
//       ),
//     );
//   }
// }

// class _SectionWrapper extends StatelessWidget {
//   final String title;
//   final Widget child;

//   const _SectionWrapper({required this.title, required this.child});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(title,
//               style: Theme.of(context).textTheme.headlineSmall?.copyWith(
//                     color: Colors.orange,
//                     fontWeight: FontWeight.bold,
//                   )),
//           const SizedBox(height: 12),
//           child,
//         ],
//       ),
//     );
//   }
// }

// class _ProjectsSection extends StatelessWidget {
//   const _ProjectsSection();

//   @override
//   Widget build(BuildContext context) {
//     return const _SectionWrapper(
//       title: 'Projects / Case Studies',
//       child: Column(
//         children: [
//           ModernProjectCard(
//             name: 'Oyster Learning',
//             description:
//                 'Oyster Learning is a complete Learning Management System (LMS) app that enables students to access courses, watch lectures with an advanced video player, track progress through an interactive dashboard, and learn in multiple languages. Designed for seamless learning anytime, anywhere.',
//             tech: 'Flutter, GetX, Rest API  ',
//             image: 'assets/project/oysterlearning/logo.png',
//             links: {
//               'Play Store':
//                   'https://play.google.com/store/apps/details?id=study.coursenrich.oyster&pcampaignid=web_share',
//               // 'GitHub': 'https://github.com/yourrepo',
//             },
//           ),
//           ModernProjectCard(
//             name: 'Scrap Mate',
//             description:
//                 'Scrap Mate is a smart and eco-friendly scrap-management app that lets users list recyclable items—metal, plastic, paper, and more—for sale. Nearby vendors are automatically notified, can accept your listing, and a pickup is arranged at your convenience. Streamline recycling, earn cash, and support sustainability—all from your phone.',
//             tech: 'Flutter, GetX, REST API',
//             image: 'assets/project/scrapmate/splash_screen_image.png',
//             // screenshots: [
//             //   "assets/screenshots/screen1.jpg",
//             //   "assets/screenshots/screen2.jpg",
//             //   "assets/screenshots/screen3.jpg",
//             //   // Add more screenshots as needed
//             // ],
//             links: {
//               'Play Store':
//                   'https://play.google.com/store/apps/details?id=com.alpts.scrapmate&pcampaignid=web_share',
//               // 'GitHub': 'https://github.com/yourrepo',
//             },
//           ),
//           // ModernProjectCard(
//           //   name: 'Animated Splashscreen Package',
//           //   description:
//           //       'Open-source Flutter package for customizable animated splash screens.',
//           //   tech: 'Flutter, Dart',
//           //   image: 'assets/project2.png',
//           //   links: {
//           //     'Pub.dev': 'https://pub.dev/packages/alp_animated_splashscreen',
//           //     'GitHub': 'https://github.com/yourrepo',
//           //   },
//           // ),
//         ],
//       ),
//     );
//   }
// }

// class ModernProjectCard extends StatefulWidget {
//   final String name;
//   final String description;
//   final String tech;
//   final String image;
//   final Map<String, String> links;
//   final List<String>? screenshots; // New parameter for screenshots

//   const ModernProjectCard({
//     Key? key,
//     required this.name,
//     required this.description,
//     required this.tech,
//     required this.image,
//     required this.links,
//     this.screenshots,
//   }) : super(key: key);

//   @override
//   State<ModernProjectCard> createState() => _ModernProjectCardState();
// }

// class _ModernProjectCardState extends State<ModernProjectCard>
//     with TickerProviderStateMixin {
//   late AnimationController _hoverController;
//   late AnimationController _shimmerController;
//   late Animation<double> _scaleAnimation;
//   late Animation<double> _elevationAnimation;
//   late Animation<Color?> _borderAnimation;
//   bool _isHovered = false;
//   int _currentScreenshot = 0;

//   @override
//   void initState() {
//     super.initState();

//     _hoverController = AnimationController(
//       duration: const Duration(milliseconds: 200),
//       vsync: this,
//     );

//     _shimmerController = AnimationController(
//       duration: const Duration(milliseconds: 2000),
//       vsync: this,
//     )..repeat();

//     _scaleAnimation = Tween<double>(begin: 1.0, end: 1.02).animate(
//       CurvedAnimation(parent: _hoverController, curve: Curves.easeOut),
//     );

//     _elevationAnimation = Tween<double>(begin: 8.0, end: 20.0).animate(
//       CurvedAnimation(parent: _hoverController, curve: Curves.easeOut),
//     );

//     _borderAnimation = ColorTween(
//       begin: Colors.grey.withOpacity(0.2),
//       end: Colors.orange.withOpacity(0.3),
//     ).animate(CurvedAnimation(parent: _hoverController, curve: Curves.easeOut));
//   }

//   @override
//   void dispose() {
//     _hoverController.dispose();
//     _shimmerController.dispose();
//     super.dispose();
//   }

//   void _onHover(bool isHovered) {
//     setState(() {
//       _isHovered = isHovered;
//     });
//     if (isHovered) {
//       _hoverController.forward();
//     } else {
//       _hoverController.reverse();
//     }
//   }

//   IconData _getLinkIcon(String label) {
//     switch (label.toLowerCase()) {
//       case 'github':
//         return Icons.code;
//       case 'demo':
//       case 'live':
//       case 'live demo':
//         return Icons.play_arrow;
//       case 'website':
//         return Icons.language;
//       default:
//         return Icons.open_in_new;
//     }
//   }

//   Future<void> _launchUrl(String url) async {
//     final Uri uri = Uri.parse(url);
//     if (!await launchUrl(uri)) {
//       throw Exception('Could not launch $url');
//     }
//   }

//   void _showScreenshots(BuildContext context) {
//     if (widget.screenshots == null || widget.screenshots!.isEmpty) return;

//     showDialog(
//       context: context,
//       barrierDismissible: true,
//       builder: (BuildContext context) {
//         return _ScreenshotGallery(screenshots: widget.screenshots!);
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     final techList = widget.tech.split(',').map((e) => e.trim()).toList();
//     final screenWidth = MediaQuery.of(context).size.width;
//     final isWideScreen = screenWidth > 800;

//     return AnimatedBuilder(
//       animation: Listenable.merge([_hoverController, _shimmerController]),
//       builder: (context, child) {
//         return Transform.scale(
//           scale: _scaleAnimation.value,
//           child: MouseRegion(
//             onEnter: (_) => _onHover(true),
//             onExit: (_) => _onHover(false),
//             child: Container(
//               margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 4),
//               child: Material(
//                 elevation: _elevationAnimation.value,
//                 borderRadius: BorderRadius.circular(24),
//                 shadowColor: Colors.orange.withOpacity(0.2),
//                 child: Container(
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(24),
//                     border: Border.all(
//                       color: _borderAnimation.value ??
//                           Colors.grey.withOpacity(0.2),
//                       width: 1.5,
//                     ),
//                     gradient: LinearGradient(
//                       begin: Alignment.topLeft,
//                       end: Alignment.bottomRight,
//                       colors: [
//                         const Color(0xFF1E293B).withOpacity(0.95),
//                         const Color(0xFF334155).withOpacity(0.95),
//                       ],
//                     ),
//                   ),
//                   child: ClipRRect(
//                     borderRadius: BorderRadius.circular(24),
//                     child: isWideScreen
//                         ? _buildHorizontalLayout(techList)
//                         : _buildVerticalLayout(techList),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }

//   Widget _buildHorizontalLayout(List<String> techList) {
//     return IntrinsicHeight(
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: [
//           // Left side - Main image
//           Expanded(
//             flex: 2,
//             child: _buildImageSection(),
//           ),

//           // Right side - Content
//           Expanded(
//             flex: 3,
//             child: Padding(
//               padding: const EdgeInsets.all(24.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       _buildTitle(),
//                       const SizedBox(height: 12),
//                       _buildDescription(),
//                       const SizedBox(height: 16),
//                       _buildTechStack(techList),
//                     ],
//                   ),
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       if (widget.screenshots != null &&
//                           widget.screenshots!.isNotEmpty)
//                         _buildScreenshotPreview(),
//                       const SizedBox(height: 16),
//                       _buildActionButtons(),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildVerticalLayout(List<String> techList) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         _buildImageSection(),
//         Padding(
//           padding: const EdgeInsets.all(24.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               _buildTitle(),
//               const SizedBox(height: 12),
//               _buildDescription(),
//               const SizedBox(height: 20),
//               _buildTechStack(techList),
//               if (widget.screenshots != null &&
//                   widget.screenshots!.isNotEmpty) ...[
//                 const SizedBox(height: 20),
//                 _buildScreenshotPreview(),
//               ],
//               const SizedBox(height: 24),
//               _buildActionButtons(),
//             ],
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _buildImageSection() {
//     return Stack(
//       children: [
//         Container(
//           height:
//               MediaQuery.of(context).size.width > 800 ? double.infinity : 220,
//           width: double.infinity,
//           decoration: BoxDecoration(
//             gradient: LinearGradient(
//               colors: [
//                 Colors.grey.shade700,
//                 Colors.grey.shade800,
//               ],
//             ),
//             borderRadius: MediaQuery.of(context).size.width > 800
//                 ? const BorderRadius.only(
//                     topLeft: Radius.circular(24),
//                     bottomLeft: Radius.circular(24),
//                   )
//                 : const BorderRadius.vertical(top: Radius.circular(24)),
//           ),
//           child: ClipRRect(
//             borderRadius: MediaQuery.of(context).size.width > 800
//                 ? const BorderRadius.only(
//                     topLeft: Radius.circular(24),
//                     bottomLeft: Radius.circular(24),
//                   )
//                 : const BorderRadius.vertical(top: Radius.circular(24)),
//             child: Image.asset(
//               widget.image,
//               fit: BoxFit.cover,
//               errorBuilder: (context, error, stackTrace) {
//                 return Container(
//                   decoration: BoxDecoration(
//                     gradient: LinearGradient(
//                       begin: Alignment.topLeft,
//                       end: Alignment.bottomRight,
//                       colors: [
//                         Colors.orange.withOpacity(0.1),
//                         Colors.purple.withOpacity(0.1),
//                       ],
//                     ),
//                   ),
//                   child: const Center(
//                     child: Icon(
//                       Icons.image_not_supported,
//                       size: 48,
//                       color: Colors.white38,
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ),
//         ),

//         // Gradient overlay
//         AnimatedOpacity(
//           duration: const Duration(milliseconds: 300),
//           opacity: _isHovered ? 0.7 : 0.0,
//           child: Container(
//             height:
//                 MediaQuery.of(context).size.width > 800 ? double.infinity : 220,
//             decoration: BoxDecoration(
//               borderRadius: MediaQuery.of(context).size.width > 800
//                   ? const BorderRadius.only(
//                       topLeft: Radius.circular(24),
//                       bottomLeft: Radius.circular(24),
//                     )
//                   : const BorderRadius.vertical(top: Radius.circular(24)),
//               gradient: LinearGradient(
//                 begin: Alignment.topCenter,
//                 end: Alignment.bottomCenter,
//                 colors: [
//                   Colors.transparent,
//                   const Color(0xFF1E293B).withOpacity(0.8),
//                 ],
//               ),
//             ),
//           ),
//         ),

//         // Featured badge
//         Positioned(
//           top: 16,
//           right: 16,
//           child: AnimatedOpacity(
//             duration: const Duration(milliseconds: 300),
//             opacity: _isHovered ? 1.0 : 0.0,
//             child: Container(
//               padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
//               decoration: BoxDecoration(
//                 color: Colors.orange.withOpacity(0.9),
//                 borderRadius: BorderRadius.circular(20),
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.orange.withOpacity(0.3),
//                     blurRadius: 8,
//                     spreadRadius: 2,
//                   ),
//                 ],
//               ),
//               child: const Row(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   Icon(Icons.star, size: 14, color: Colors.white),
//                   SizedBox(width: 4),
//                   Text(
//                     'Featured',
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 12,
//                       fontWeight: FontWeight.w600,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _buildScreenshotPreview() {
//     if (widget.screenshots == null || widget.screenshots!.isEmpty) {
//       return const SizedBox.shrink();
//     }

//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Text(
//               'Screenshots',
//               style: TextStyle(
//                 fontSize: 16,
//                 fontWeight: FontWeight.w600,
//                 color: Colors.grey.shade300,
//               ),
//             ),
//             TextButton.icon(
//               onPressed: () => _showScreenshots(context),
//               icon: const Icon(Icons.photo_library,
//                   size: 16, color: Colors.orange),
//               label: const Text(
//                 'View All',
//                 style: TextStyle(color: Colors.orange, fontSize: 14),
//               ),
//             ),
//           ],
//         ),
//         const SizedBox(height: 8),
//         SizedBox(
//           height: 80,
//           child: ListView.builder(
//             scrollDirection: Axis.horizontal,
//             itemCount:
//                 widget.screenshots!.length > 4 ? 4 : widget.screenshots!.length,
//             itemBuilder: (context, index) {
//               return GestureDetector(
//                 onTap: () => _showScreenshots(context),
//                 child: Container(
//                   width: 120,
//                   margin: const EdgeInsets.only(right: 8),
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(8),
//                     border: Border.all(
//                       color: Colors.grey.withOpacity(0.3),
//                       width: 1,
//                     ),
//                   ),
//                   child: ClipRRect(
//                     borderRadius: BorderRadius.circular(8),
//                     child: Stack(
//                       children: [
//                         Image.asset(
//                           widget.screenshots![index],
//                           fit: BoxFit.cover,
//                           width: double.infinity,
//                           height: double.infinity,
//                           errorBuilder: (context, error, stackTrace) {
//                             return Container(
//                               color: Colors.grey.shade700,
//                               child: const Icon(
//                                 Icons.image_not_supported,
//                                 color: Colors.white38,
//                               ),
//                             );
//                           },
//                         ),
//                         if (index == 3 && widget.screenshots!.length > 4)
//                           Container(
//                             color: Colors.black.withOpacity(0.7),
//                             child: Center(
//                               child: Text(
//                                 '+${widget.screenshots!.length - 4}',
//                                 style: const TextStyle(
//                                   color: Colors.white,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                             ),
//                           ),
//                       ],
//                     ),
//                   ),
//                 ),
//               );
//             },
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _buildTitle() {
//     return AnimatedDefaultTextStyle(
//       duration: const Duration(milliseconds: 300),
//       style: TextStyle(
//         fontSize: 24,
//         fontWeight: FontWeight.bold,
//         color: _isHovered ? Colors.orange.shade400 : Colors.white,
//       ),
//       child: Text(widget.name),
//     );
//   }

//   Widget _buildDescription() {
//     return Text(
//       widget.description,
//       style: TextStyle(
//         fontSize: 14,
//         color: Colors.grey.shade300,
//         height: 1.5,
//       ),
//       maxLines: 3,
//       overflow: TextOverflow.ellipsis,
//     );
//   }

//   Widget _buildTechStack(List<String> techList) {
//     return Wrap(
//       spacing: 8,
//       runSpacing: 8,
//       children: techList.map((tech) {
//         return Container(
//           padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
//           decoration: BoxDecoration(
//             color: Colors.grey.shade700.withOpacity(0.5),
//             borderRadius: BorderRadius.circular(16),
//             border: Border.all(
//               color: Colors.grey.shade600.withOpacity(0.3),
//             ),
//           ),
//           child: Text(
//             tech,
//             style: TextStyle(
//               fontSize: 12,
//               color: Colors.grey.shade300,
//               fontWeight: FontWeight.w500,
//             ),
//           ),
//         );
//       }).toList(),
//     );
//   }

//   Widget _buildActionButtons() {
//     return Wrap(
//       spacing: 12,
//       runSpacing: 12,
//       children: widget.links.entries.map((entry) {
//         return _ModernLinkButton(
//           label: entry.key,
//           url: entry.value,
//           icon: _getLinkIcon(entry.key),
//           onPressed: () => _launchUrl(entry.value),
//         );
//       }).toList(),
//     );
//   }
// }

// class _ScreenshotGallery extends StatefulWidget {
//   final List<String> screenshots;

//   const _ScreenshotGallery({required this.screenshots});

//   @override
//   State<_ScreenshotGallery> createState() => _ScreenshotGalleryState();
// }

// class _ScreenshotGalleryState extends State<_ScreenshotGallery> {
//   late PageController _pageController;
//   int _currentIndex = 0;

//   @override
//   void initState() {
//     super.initState();
//     _pageController = PageController();
//   }

//   @override
//   void dispose() {
//     _pageController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Dialog(
//       backgroundColor: Colors.transparent,
//       insetPadding: const EdgeInsets.all(20),
//       child: Container(
//         constraints: const BoxConstraints(maxWidth: 800, maxHeight: 600),
//         decoration: BoxDecoration(
//           color: const Color(0xFF1E293B),
//           borderRadius: BorderRadius.circular(20),
//           border: Border.all(
//             color: Colors.orange.withOpacity(0.3),
//             width: 1.5,
//           ),
//         ),
//         child: Column(
//           children: [
//             // Header
//             Padding(
//               padding: const EdgeInsets.all(20),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     'Project Screenshots',
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 20,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   IconButton(
//                     onPressed: () => Navigator.of(context).pop(),
//                     icon: const Icon(Icons.close, color: Colors.white),
//                   ),
//                 ],
//               ),
//             ),

//             // Screenshot viewer
//             Expanded(
//               child: Stack(
//                 children: [
//                   PageView.builder(
//                     controller: _pageController,
//                     onPageChanged: (index) {
//                       setState(() {
//                         _currentIndex = index;
//                       });
//                     },
//                     itemCount: widget.screenshots.length,
//                     itemBuilder: (context, index) {
//                       return Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: 20),
//                         child: ClipRRect(
//                           borderRadius: BorderRadius.circular(12),
//                           child: Image.asset(
//                             widget.screenshots[index],
//                             fit: BoxFit.contain,
//                             errorBuilder: (context, error, stackTrace) {
//                               return Container(
//                                 color: Colors.grey.shade700,
//                                 child: const Center(
//                                   child: Icon(
//                                     Icons.image_not_supported,
//                                     size: 48,
//                                     color: Colors.white38,
//                                   ),
//                                 ),
//                               );
//                             },
//                           ),
//                         ),
//                       );
//                     },
//                   ),

//                   // Navigation arrows
//                   if (widget.screenshots.length > 1) ...[
//                     Positioned(
//                       left: 10,
//                       top: 0,
//                       bottom: 0,
//                       child: Center(
//                         child: IconButton(
//                           onPressed: _currentIndex > 0
//                               ? () => _pageController.previousPage(
//                                     duration: const Duration(milliseconds: 300),
//                                     curve: Curves.easeInOut,
//                                   )
//                               : null,
//                           icon: const Icon(
//                             Icons.arrow_back_ios,
//                             color: Colors.white,
//                           ),
//                         ),
//                       ),
//                     ),
//                     Positioned(
//                       right: 10,
//                       top: 0,
//                       bottom: 0,
//                       child: Center(
//                         child: IconButton(
//                           onPressed: _currentIndex <
//                                   widget.screenshots.length - 1
//                               ? () => _pageController.nextPage(
//                                     duration: const Duration(milliseconds: 300),
//                                     curve: Curves.easeInOut,
//                                   )
//                               : null,
//                           icon: const Icon(
//                             Icons.arrow_forward_ios,
//                             color: Colors.white,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ],
//               ),
//             ),

//             // Page indicators
//             if (widget.screenshots.length > 1)
//               Padding(
//                 padding: const EdgeInsets.all(20),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: List.generate(
//                     widget.screenshots.length,
//                     (index) => AnimatedContainer(
//                       duration: const Duration(milliseconds: 300),
//                       margin: const EdgeInsets.symmetric(horizontal: 4),
//                       width: _currentIndex == index ? 24 : 8,
//                       height: 8,
//                       decoration: BoxDecoration(
//                         color: _currentIndex == index
//                             ? Colors.orange
//                             : Colors.grey.shade600,
//                         borderRadius: BorderRadius.circular(4),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class _ModernLinkButton extends StatefulWidget {
//   final String label;
//   final String url;
//   final IconData icon;
//   final VoidCallback onPressed;

//   const _ModernLinkButton({
//     required this.label,
//     required this.url,
//     required this.icon,
//     required this.onPressed,
//   });

//   @override
//   State<_ModernLinkButton> createState() => _ModernLinkButtonState();
// }

// class _ModernLinkButtonState extends State<_ModernLinkButton>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _animationController;
//   late Animation<double> _scaleAnimation;

//   @override
//   void initState() {
//     super.initState();
//     _animationController = AnimationController(
//       duration: const Duration(milliseconds: 100),
//       vsync: this,
//     );
//     _scaleAnimation = Tween<double>(begin: 1.0, end: 0.95).animate(
//       CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
//     );
//   }

//   @override
//   void dispose() {
//     _animationController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return AnimatedBuilder(
//       animation: _scaleAnimation,
//       builder: (context, child) {
//         return Transform.scale(
//           scale: _scaleAnimation.value,
//           child: ElevatedButton.icon(
//             onPressed: () {
//               _animationController.forward().then((_) {
//                 _animationController.reverse();
//               });
//               widget.onPressed();
//             },
//             style: ElevatedButton.styleFrom(
//               backgroundColor: Colors.orange,
//               foregroundColor: Colors.white,
//               elevation: 4,
//               shadowColor: Colors.orange.withOpacity(0.3),
//               padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(12),
//               ),
//             ),
//             icon: Icon(widget.icon, size: 18),
//             label: Text(
//               widget.label,
//               style: const TextStyle(
//                 fontWeight: FontWeight.w600,
//                 fontSize: 14,
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
// // class _ModernLinkButton extends StatefulWidget {
// //   final String label;
// //   final String url;
// //   final IconData icon;
// //   final VoidCallback onPressed;

// //   const _ModernLinkButton({
// //     required this.label,
// //     required this.url,
// //     required this.icon,
// //     required this.onPressed,
// //   });

// //   @override
// //   State<_ModernLinkButton> createState() => _ModernLinkButtonState();
// // }

// // class _ModernLinkButtonState extends State<_ModernLinkButton>
// //     with SingleTickerProviderStateMixin {
// //   late AnimationController _animationController;
// //   late Animation<double> _scaleAnimation;

// //   @override
// //   void initState() {
// //     super.initState();
// //     _animationController = AnimationController(
// //       duration: const Duration(milliseconds: 100),
// //       vsync: this,
// //     );
// //     _scaleAnimation = Tween<double>(begin: 1.0, end: 0.95).animate(
// //       CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
// //     );
// //   }

// //   @override
// //   void dispose() {
// //     _animationController.dispose();
// //     super.dispose();
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return AnimatedBuilder(
// //       animation: _scaleAnimation,
// //       builder: (context, child) {
// //         return Transform.scale(
// //           scale: _scaleAnimation.value,
// //           child: ElevatedButton.icon(
// //             onPressed: () {
// //               _animationController.forward().then((_) {
// //                 _animationController.reverse();
// //               });
// //               widget.onPressed();
// //             },
// //             style: ElevatedButton.styleFrom(
// //               backgroundColor: Colors.orange,
// //               foregroundColor: Colors.white,
// //               elevation: 4,
// //               shadowColor: Colors.orange.withOpacity(0.3),
// //               padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
// //               shape: RoundedRectangleBorder(
// //                 borderRadius: BorderRadius.circular(12),
// //               ),
// //             ),
// //             icon: Icon(widget.icon, size: 18),
// //             label: Text(
// //               widget.label,
// //               style: const TextStyle(
// //                 fontWeight: FontWeight.w600,
// //                 fontSize: 14,
// //               ),
// //             ),
// //           ),
// //         );
// //       },
// //     );
// //   }
// // }

// class _LinkBtn extends StatelessWidget {
//   final String label;
//   final String url;

//   const _LinkBtn({required this.label, required this.url});

//   @override
//   Widget build(BuildContext context) {
//     return ElevatedButton(
//       style: ElevatedButton.styleFrom(
//         backgroundColor: Colors.orange,
//         foregroundColor: Colors.white,
//       ),
//       onPressed: () async {
//         final uri = Uri.parse(url);
//         if (await canLaunchUrl(uri)) {
//           await launchUrl(uri);
//         }
//       },
//       child: Text(label),
//     );
//   }
// }

// class _ExperienceSection extends StatelessWidget {
//   const _ExperienceSection();
//   @override
//   Widget build(BuildContext context) {
//     return const _SectionWrap(
//       id: _SectionId.experience,
//       title: 'Experience',
//       child: Column(
//         children: [
//           _ExperienceTile(
//             title: 'ALPTurnkey Solutions — Flutter Developer',
//             period: '2023 — Present',
//             bullets: [
//               'Built and maintained production-grade Flutter apps with GetX.',
//               'Integrated Instamojo payments and Zoom-based classes.',
//               'Implemented LMS dashboards, animations, and offline downloads.',
//             ],
//           ),
//           //   _ExperienceTile(
//           //     title: 'Freelance / Contract',
//           //     period: '2022 — Present',
//           //     bullets: [
//           //       'Delivered apps for small businesses and education startups.',
//           //       'Shipped features like OTP login, video players, and Firebase auth.',
//           //     ],
//           //   ),
//         ],
//       ),
//     );
//   }
// }

// class _AchievementsSection extends StatelessWidget {
//   const _AchievementsSection();
//   @override
//   Widget build(BuildContext context) {
//     return const _SectionWrap(
//       id: _SectionId.achievements,
//       title: 'Achievements & Highlights',
//       child: Wrap(
//         spacing: 16,
//         runSpacing: 16,
//         children: const [
//           _HighlightCard(
//             title: 'Published Package',
//             desc:
//                 'Created open-source Flutter package — alp_animated_splashscreen (^0.0.6).',
//           ),
//           // _HighlightCard(
//           //   title: 'Tech Content',
//           //   desc:
//           //       'Run an Instagram page sharing Flutter tips, tutorials, and reels.',
//           // ),
//           _HighlightCard(
//             title: 'Play Store Releases',
//             desc: 'Published and maintained multiple apps on the Play Store.',
//           ),
//         ],
//       ),
//     );
//   }
// }

// class _EducationSection extends StatelessWidget {
//   const _EducationSection();
//   @override
//   Widget build(BuildContext context) {
//     return const _SectionWrap(
//       id: _SectionId.education,
//       title: 'Education & Certifications',
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: const [
//           _Bullet(
//               'Diploma In Computer Engineering (Gov Polytechnic College Neyyatinkara)'),
//           _Bullet('Diploma In Computer Application (C Dac )'),
//         ],
//       ),
//     );
//   }
// }

// // class _TestimonialsSection extends StatelessWidget {
// //   const _TestimonialsSection();
// //   @override
// //   Widget build(BuildContext context) {
// //     return _SectionWrap(
// //       id: _SectionId.testimonials,
// //       title: 'Testimonials',
// //       child: Wrap(
// //         spacing: 16,
// //         runSpacing: 16,
// //         children: const [
// //           _Testimonial(
// //             name: 'Client A',
// //             role: 'Founder, EdTech Startup',
// //             text:
// //                 'Sujith delivered exactly what we needed. Smooth communication and great attention to detail.',
// //           ),
// //           _Testimonial(
// //             name: 'Teammate B',
// //             role: 'Backend Engineer',
// //             text:
// //                 'Super reliable. Integrations with REST APIs and payment gateways were spot on.',
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }

// class _ResumeSection extends StatelessWidget {
//   const _ResumeSection();

//   @override
//   Widget build(BuildContext context) {
//     return _SectionWrap(
//       id: _SectionId.resume,
//       title: 'Resume / CV',
//       subtitle: 'Download a concise PDF version of my resume.',
//       child: Row(
//         children: [
//           _PrimaryBtn(
//             label: 'Download Resume (PDF)',
//             icon: Icons.download,
//             onTap: () async {
//               // If you ship assets/resume.pdf, it will open in a new tab.
//               final uri = Uri.parse('assets/resume.pdf');
//               if (!await launchUrl(uri)) {
//                 // fallback to external link
//                 final alt = Uri.parse('https://example.com/resume.pdf');
//                 await launchUrl(alt, mode: LaunchMode.externalApplication);
//               }
//             },
//           ),
//           const SizedBox(width: 12),
//           _GhostBtn(
//             label: 'View on GitHub',
//             icon: Icons.code,
//             onTap: () => _open('https://github.com/yourusername'),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class _ContactSection extends StatelessWidget {
//   const _ContactSection();

//   @override
//   Widget build(BuildContext context) {
//     return const _SectionWrap(
//       id: _SectionId.contact,
//       title: 'Contact / Connect',
//       child: Wrap(
//         spacing: 12,
//         runSpacing: 12,
//         children: [
//           _ContactChip(Icons.email, 'sujiths6024@gmail.com',
//               'mailto:sujiths6024@gmail.com'),
//           // _ContactChip(Icons.link, 'LinkedIn', 'https://www.linkedin.com/'),
//           // _ContactChip(Icons.code, 'GitHub', 'https://github.com/'),
//           // _ContactChip(Icons.camera_alt, 'Instagram', 'https://instagram.com/'),
//           _ContactChip(Icons.message, 'WhatsApp', 'https://wa.me/7994095833'),
//           // _ContactChip(Icons.web, 'Portfolio', 'https://yourdomain.com'),
//         ],
//       ),
//     );
//   }
// }

// class _Footer extends StatelessWidget {
//   const _Footer();
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Opacity(
//         opacity: 0.7,
//         child: Column(
//           children: [
//             const SizedBox(height: 8),
//             Text('© ${DateTime.now().year} Sujith · All rights reserved.'),
//             const SizedBox(height: 6),
//             const Text('Built with Flutter Web + GetX'),
//             const SizedBox(height: 24),
//           ],
//         ),
//       ),
//     );
//   }
// }

// // ---------- UI atoms ----------
// BoxDecoration _cardDeco(BuildContext context) => BoxDecoration(
//       color: Colors.white,
//       borderRadius: BorderRadius.circular(24),
//       border: Border.all(color: Colors.orange.withOpacity(0.15)),
//       boxShadow: [
//         BoxShadow(
//           color: Colors.black.withOpacity(0.05),
//           blurRadius: 30,
//           offset: const Offset(0, 10),
//         )
//       ],
//     );

// class _Tag extends StatelessWidget {
//   const _Tag(this.label);
//   final String label;
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
//       decoration: BoxDecoration(
//         color: const Color(0xFFFFF3E9),
//         borderRadius: BorderRadius.circular(999),
//         border: Border.all(color: Colors.orange.withOpacity(0.2)),
//       ),
//       child: Text(label, style: const TextStyle(fontWeight: FontWeight.w600)),
//     );
//   }
// }

// class _SkillCard extends StatelessWidget {
//   const _SkillCard(this.label);
//   final String label;
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(16),
//         border: Border.all(color: Colors.orange.withOpacity(0.18)),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.04),
//             blurRadius: 16,
//             offset: const Offset(0, 8),
//           )
//         ],
//       ),
//       child: Text(label, style: const TextStyle(fontWeight: FontWeight.w600)),
//     );
//   }
// }

// class _ExperienceTile extends StatelessWidget {
//   const _ExperienceTile({
//     required this.title,
//     required this.period,
//     required this.bullets,
//   });
//   final String title;
//   final String period;
//   final List<String> bullets;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.symmetric(vertical: 8),
//       decoration: _cardDeco(context),
//       padding: const EdgeInsets.all(16),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const Icon(Icons.work_outline),
//           const SizedBox(width: 12),
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Row(
//                   children: [
//                     Expanded(
//                       child: Text(
//                         title,
//                         style: GoogleFonts.poppins(
//                           fontWeight: FontWeight.w700,
//                         ),
//                       ),
//                     ),
//                     Opacity(
//                       opacity: 0.7,
//                       child: Text(period),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 8),
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: bullets.map((b) => _Bullet(b)).toList(),
//                 ),
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }

// class _HighlightCard extends StatelessWidget {
//   const _HighlightCard({required this.title, required this.desc});
//   final String title;
//   final String desc;
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: 360,
//       child: Container(
//         padding: const EdgeInsets.all(16),
//         decoration: _cardDeco(context),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(
//               children: [
//                 Container(
//                   width: 36,
//                   height: 36,
//                   decoration: BoxDecoration(
//                     shape: BoxShape.circle,
//                     gradient: const LinearGradient(
//                       colors: [Color(0xFFFF6A00), Color(0xFFFFA559)],
//                     ),
//                   ),
//                   child: const Icon(Icons.star, color: Colors.white),
//                 ),
//                 const SizedBox(width: 10),
//                 Expanded(
//                   child: Text(
//                     title,
//                     style: GoogleFonts.poppins(
//                         fontWeight: FontWeight.w700, fontSize: 16),
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 10),
//             Text(desc),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class _Testimonial extends StatelessWidget {
//   const _Testimonial({
//     required this.name,
//     required this.role,
//     required this.text,
//   });
//   final String name;
//   final String role;
//   final String text;
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: 360,
//       child: Container(
//         decoration: _cardDeco(context),
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(
//               children: [
//                 CircleAvatar(
//                   backgroundColor: const Color(0xFFFFF3E9),
//                   child: Text(name.isNotEmpty ? name[0] : '?'),
//                 ),
//                 const SizedBox(width: 10),
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(name,
//                         style: const TextStyle(fontWeight: FontWeight.w700)),
//                     Opacity(opacity: 0.7, child: Text(role)),
//                   ],
//                 )
//               ],
//             ),
//             const SizedBox(height: 10),
//             Text('“$text”'),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class _Bullet extends StatelessWidget {
//   const _Bullet(this.text);
//   final String text;
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 4.0),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const Text('•  '),
//           Expanded(child: Text(text)),
//         ],
//       ),
//     );
//   }
// }

// class _ContactChip extends StatelessWidget {
//   const _ContactChip(this.icon, this.label, this.url);
//   final IconData icon;
//   final String label;
//   final String url;
//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: () => _open(url),
//       borderRadius: BorderRadius.circular(999),
//       child: Container(
//         padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(999),
//           border: Border.all(color: Colors.orange.withOpacity(0.2)),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.black.withOpacity(0.04),
//               blurRadius: 16,
//               offset: const Offset(0, 8),
//             )
//           ],
//         ),
//         child: Row(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Icon(icon),
//             const SizedBox(width: 8),
//             Text(label),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class _PrimaryBtn extends StatelessWidget {
//   const _PrimaryBtn(
//       {required this.label, required this.icon, required this.onTap});
//   final String label;
//   final IconData icon;
//   final VoidCallback onTap;
//   @override
//   Widget build(BuildContext context) {
//     return ElevatedButton.icon(
//       onPressed: onTap,
//       icon: Icon(icon),
//       label: Text(label),
//       style: ElevatedButton.styleFrom(
//         elevation: 0,
//         backgroundColor: const Color(0xFFFF6A00),
//         foregroundColor: Colors.white,
//         padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
//       ),
//     );
//   }
// }

// class _GhostBtn extends StatelessWidget {
//   const _GhostBtn(
//       {required this.label, required this.icon, required this.onTap});
//   final String label;
//   final IconData icon;
//   final VoidCallback onTap;
//   @override
//   Widget build(BuildContext context) {
//     return OutlinedButton.icon(
//       onPressed: onTap,
//       icon: Icon(icon),
//       label: Text(label),
//       style: OutlinedButton.styleFrom(
//         foregroundColor: const Color(0xFFFF6A00),
//         side: const BorderSide(color: Color(0xFFFFA559)),
//         padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
//       ),
//     );
//   }
// }

// Future<void> _open(String url) async {
//   final uri = Uri.parse(url);
//   await launchUrl(uri, mode: LaunchMode.externalApplication);
// }

// // ---------- Animated Background Painter ----------
// class _BlobsPainter extends CustomPainter {
//   _BlobsPainter({required this.progress});
//   final double progress;

//   @override
//   void paint(Canvas canvas, Size size) {
//     // Background gradient wash
//     final bg = Paint()
//       ..shader = const LinearGradient(
//         begin: Alignment.topLeft,
//         end: Alignment.bottomRight,
//         colors: [Colors.white, Color(0xFFFFF7EF)],
//       ).createShader(Offset.zero & size);
//     canvas.drawRect(Offset.zero & size, bg);

//     // Animated orange blobs
//     final t = progress * 2 * math.pi;
//     final centers = [
//       Offset(size.width * (0.2 + 0.05 * math.sin(t)), size.height * 0.25),
//       Offset(size.width * (0.8 + 0.05 * math.cos(t * 0.8)), size.height * 0.2),
//       Offset(size.width * 0.5, size.height * (0.75 + 0.05 * math.sin(t * 1.2))),
//     ];
//     final radii = [220.0, 180.0, 260.0];

//     for (var i = 0; i < centers.length; i++) {
//       final p = Paint()
//         ..shader = RadialGradient(
//           colors: [
//             const Color(0x33FF6A00),
//             const Color(0x11FFA559),
//             Colors.transparent,
//           ],
//           stops: const [0.0, 0.6, 1.0],
//         ).createShader(Rect.fromCircle(center: centers[i], radius: radii[i]));
//       canvas.drawCircle(centers[i], radii[i], p);
//     }

//     // Soft white highlight blobs
//     final whiteBlob = Paint()
//       ..shader = RadialGradient(
//         colors: [Colors.white.withOpacity(0.60), Colors.white.withOpacity(0.0)],
//       ).createShader(
//         Rect.fromCircle(
//           center: Offset(
//               size.width * (0.1 + 0.03 * math.cos(t)), size.height * 0.8),
//           radius: 160,
//         ),
//       );
//     canvas.drawCircle(
//         Offset(size.width * (0.1 + 0.03 * math.cos(t)), size.height * 0.8),
//         160,
//         whiteBlob);
//   }

//   @override
//   bool shouldRepaint(covariant _BlobsPainter oldDelegate) =>
//       oldDelegate.progress != progress;
// }
