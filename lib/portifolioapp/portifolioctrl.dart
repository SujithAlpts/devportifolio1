import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'colors.dart';

class PortfolioController extends GetxController {
  final RxInt selectedNavIndex = 0.obs;
  final RxBool isMenuOpen = false.obs;
  final RxString contactName = ''.obs;
  final RxString contactEmail = ''.obs;
  final RxString contactMessage = ''.obs;

  final List<String> navItems = ['Home', 'Projects', 'Contact'];

  void selectNavItem(int index) {
    selectedNavIndex.value = index;
    isMenuOpen.value = false;
  }

  void toggleMenu() {
    isMenuOpen.toggle();
  }

  void updateContactForm({String? name, String? email, String? message}) {
    if (name != null) contactName.value = name;
    if (email != null) contactEmail.value = email;
    if (message != null) contactMessage.value = message;
  }

  void sendMessage() async {
    if (contactName.value.isNotEmpty &&
        contactEmail.value.isNotEmpty &&
        contactMessage.value.isNotEmpty) {
      final Uri emailUri = Uri(
        scheme: 'mailto',
        path: 'sujiths6024@gmail.com',
        query: Uri.encodeFull(
          'subject=Portfolio Contact&'
          'body=Name: ${contactName.value}\n'
          'Email: ${contactEmail.value}\n\n'
          'Message:\n${contactMessage.value}',
        ),
      );

      if (await canLaunchUrl(emailUri)) {
        await launchUrl(emailUri);
      } else {
        Get.snackbar(
          'Error',
          'Could not open email app',
          backgroundColor: Colors.red,
          colorText: AppColors.cardBackground,
          snackPosition: SnackPosition.TOP,
        );
      }
    } else {
      Get.snackbar(
        'Error',
        'Please fill in all fields',
        backgroundColor: Colors.red,
        colorText: AppColors.cardBackground,
        snackPosition: SnackPosition.TOP,
      );
    }
  }
  // void sendMessage() {
  //   if (contactName.value.isNotEmpty &&
  //       contactEmail.value.isNotEmpty &&
  //       contactMessage.value.isNotEmpty) {
  //     Get.snackbar(
  //       'Success',
  //       'Message sent successfully!',
  //       backgroundColor: AppColors.accentPurple,
  //       colorText: AppColors.cardBackground,
  //       snackPosition: SnackPosition.TOP,
  //     );
  //     // Clear form
  //     contactName.value = '';
  //     contactEmail.value = '';
  //     contactMessage.value = '';
  //   } else {
  //     Get.snackbar(
  //       'Error',
  //       'Please fill in all fields',
  //       backgroundColor: Colors.red,
  //       colorText: AppColors.cardBackground,
  //       snackPosition: SnackPosition.TOP,
  //     );
  //   }
  // }
}
