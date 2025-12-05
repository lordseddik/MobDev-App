import 'package:flutter/material.dart';
import 'home_screen.dart';
import '../core/constants/app_colors.dart';
import '../core/constants/app_strings.dart';
import '../core/widgets/custom_button.dart';
import '../core/widgets/custom_textfield.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(
                    Icons.videogame_asset,
                    color: AppColors.primary,
                    size: 40,
                  ),
                  SizedBox(width: 8),

                  Text(
                    AppStrings.appName,
                    style: TextStyle(
                      color: AppColors.primary,
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              const Text(
                AppStrings.appTagline,
                style: TextStyle(
                  color: AppColors.textSecondary,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),

              const SizedBox(height: 40),

              CustomTextField(
                hintText: AppStrings.emailAddress,
                prefixIcon: Icons.email_outlined,
                keyboardType: TextInputType.emailAddress,
                fillColor: Colors.transparent,
              ),

              const SizedBox(height: 15),

              CustomTextField(
                hintText: AppStrings.password,
                prefixIcon: Icons.lock_outline,
                obscureText: true,
                fillColor: Colors.transparent,
              ),

              const SizedBox(height: 30),

              CustomButton(
                text: AppStrings.login,
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen()),
                  );
                },
                fontSize: 18,
              ),

              const SizedBox(height: 15),

              CustomButton(
                text: AppStrings.signUp,
                onPressed: () {},
                backgroundColor: AppColors.success,
                fontSize: 18,
              ),

              const SizedBox(height: 40),

              const Icon(
                Icons.videogame_asset_outlined,
                color: Colors.white70,
                size: 40,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
