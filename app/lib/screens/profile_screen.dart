import 'package:flutter/material.dart';
import 'add_listing_screen.dart';
import '../core/constants/app_colors.dart';
import '../core/constants/app_strings.dart';
import '../core/widgets/custom_button.dart';
import '../core/widgets/custom_textfield.dart';
import '../core/utils/helpers.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final TextEditingController _usernameController = TextEditingController(
    text: 'gameonlegend',
  );
  final TextEditingController _emailController = TextEditingController(
    text: 'gameonlegend@replay.ct',
  );
  final TextEditingController _currentPasswordController =
      TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text(
          AppStrings.editProfile,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: AppColors.textPrimary,
          ),
        ),
        centerTitle: true,
        backgroundColor: AppColors.background,
        elevation: 0,
        iconTheme: const IconThemeData(color: AppColors.textPrimary),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // PROFILE PICTURE SECTION
            Center(
              child: Column(
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.inputBackground,
                    ),
                    child: const Icon(
                      Icons.person,
                      size: 60,
                      color: AppColors.textHint,
                    ),
                  ),
                  const SizedBox(height: 10),
                  CustomButton(
                    text: AppStrings.changePhoto,
                    onPressed: () {},
                    icon: Icons.camera_alt,
                    backgroundColor: AppColors.inputBackground,
                    height: 40,
                    width: 150,
                    fontSize: 14,
                    borderRadius: BorderRadius.circular(6),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),

            // Personal Information Section
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.cardBackground,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    AppStrings.personalInformation,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 16),

                  const Text(
                    AppStrings.username,
                    style: TextStyle(
                      color: AppColors.textPrimary,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 8),
                  CustomTextField(
                    controller: _usernameController,
                    hintText: 'gameonlegend',
                    prefixIcon: Icons.person,
                    borderRadius: 8,
                    fillColor: AppColors.inputBackground,
                  ),
                  const SizedBox(height: 16),

                  const Text(
                    AppStrings.emailAddress,
                    style: TextStyle(
                      color: AppColors.textPrimary,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 8),
                  CustomTextField(
                    controller: _emailController,
                    hintText: 'gameonlegend@replay.ct',
                    prefixIcon: Icons.email,
                    keyboardType: TextInputType.emailAddress,
                    borderRadius: 8,
                    fillColor: AppColors.inputBackground,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Security Section
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.cardBackground,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    AppStrings.security,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 16),

                  const Text(
                    AppStrings.currentPassword,
                    style: TextStyle(
                      color: AppColors.textPrimary,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 8),
                  CustomTextField(
                    controller: _currentPasswordController,
                    hintText: AppStrings.enterCurrentPassword,
                    prefixIcon: Icons.lock,
                    obscureText: true,
                    borderRadius: 8,
                    fillColor: AppColors.inputBackground,
                  ),
                  const SizedBox(height: 16),

                  const Text(
                    AppStrings.newPassword,
                    style: TextStyle(
                      color: AppColors.textPrimary,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 8),
                  CustomTextField(
                    controller: _newPasswordController,
                    hintText: AppStrings.enterNewPassword,
                    prefixIcon: Icons.lock_outline,
                    obscureText: true,
                    borderRadius: 8,
                    fillColor: AppColors.inputBackground,
                  ),
                  const SizedBox(height: 16),

                  // Save Changes Button
                  CustomButton(
                    text: AppStrings.saveChanges,
                    onPressed: () {
                      Helpers.showSuccessSnackbar(
                        context,
                        AppStrings.changesSaved,
                      );
                    },
                    height: 50,
                    borderRadius: BorderRadius.circular(8),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Danger Zone
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.red[900]!.withOpacity(0.2),
                border: Border.all(color: Colors.red.shade600),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    AppStrings.dangerZone,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    AppStrings.deleteAccountWarning,
                    style: TextStyle(
                      color: AppColors.textSecondary,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 16),
                  CustomButton(
                    text: AppStrings.deleteAccount,
                    onPressed: () async {
                      final confirmed = await Helpers.showConfirmationDialog(
                        context,
                        title: AppStrings.deleteAccount,
                        message: AppStrings.deleteAccountConfirm,
                        confirmText: AppStrings.delete,
                        cancelText: AppStrings.cancel,
                        confirmColor: AppColors.error,
                      );
                      if (confirmed) {
                        Helpers.showSnackbar(
                          context,
                          AppStrings.accountDeleted,
                        );
                      }
                    },
                    backgroundColor: AppColors.error,
                    height: 45,
                    borderRadius: BorderRadius.circular(8),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColors.background,
        currentIndex: 2,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColors.primary,
        unselectedItemColor: AppColors.textHint,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: AppStrings.home,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle_outline),
            label: AppStrings.add,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outlined),
            label: AppStrings.profile,
          ),
        ],
        onTap: (index) {
          if (index == 1) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const AddListingScreen()),
            );
          } else if (index == 0) {
            Navigator.pop(context);
          }
        },
      ),
    );
  }
}
