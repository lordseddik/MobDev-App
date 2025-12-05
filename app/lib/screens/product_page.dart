import 'package:flutter/material.dart';
import 'contact_seller_screen.dart';
import '../core/constants/app_colors.dart';
import '../core/constants/app_strings.dart';
import '../core/widgets/custom_button.dart';

class Productpage extends StatelessWidget {
  const Productpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back, color: AppColors.textPrimary),
        ),
        title: const Text(
          "Vintage Nintendo Game Boy",
          style: TextStyle(color: AppColors.textPrimary),
        ),
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  'images/Game-Boy-FL.jpg',
                  height: 300,
                  fit: BoxFit.contain,
                ),
              ),
            ),

            Container(
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[900],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Vintage Nintendo Game Boy',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Excellent, minor scratches',
                    style: TextStyle(color: Colors.grey),
                  ),
                  SizedBox(height: 12),
                  Text(
                    '\$120.00',
                    style: TextStyle(
                      color: Color(0xFF9C4DFF),
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 12),
                  Text(
                    'Relive the nostalgia with this classic Game Boy Color. Fully functional, meticulously cleaned, and ready for your favorite retro adventures. Screen is bright, buttons are responsive, and battery compartment is clean. Comes with original box and a copy of Pokémon Yellow. A true collector’s item for retro gaming enthusiasts.',
                    style: TextStyle(color: Colors.white70, height: 1.4),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: CustomButton(
                text: AppStrings.contactSeller,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ContactSellerScreen(),
                    ),
                  );
                },
                height: 48,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
