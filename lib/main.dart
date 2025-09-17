
import 'package:google_fonts/google_fonts.dart';
import 'portifolioapp/portifolioctrl.dart';
import 'package:flutter/material.dart';
import 'portifolioapp/colors.dart';
import 'portifolioapp/home.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Sujith Portfolio',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.primaryDark,
        textTheme: GoogleFonts.poppinsTextTheme(),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const PortfolioHomePage(),
      initialBinding: BindingsBuilder(() {
        Get.put(PortfolioController());
      }),
    );
  }
}
