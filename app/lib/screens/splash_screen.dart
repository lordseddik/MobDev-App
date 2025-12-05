import 'package:flutter/material.dart';
import 'login_screen.dart';
import '../core/constants/app_colors.dart';
import '../core/widgets/custom_button.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Re',
                    style: TextStyle(
                      color: AppColors.primary,
                      fontSize: 60,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Play',
                    style: TextStyle(
                      color: AppColors.textPrimary,
                      fontSize: 60,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 6),
                  Icon(
                    Icons.videogame_asset,
                    color: AppColors.primary,
                    size: 36,
                  ),
                ],
              ),

              const SizedBox(height: 10),

              const Text(
                'Trade. Play. Repeat.',
                style: TextStyle(color: AppColors.textPrimary, fontSize: 25),
              ),

              const SizedBox(height: 40),

              CustomButton(
                text: 'Get Started',
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginScreen(),
                    ),
                  );
                },
                fontSize: 18,
                borderRadius: BorderRadius.circular(30),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
