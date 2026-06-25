import 'package:coffee_shop_app/core/constants/app_colors.dart';
import 'package:coffee_shop_app/features/landing_screen/widgets/login_card_widget.dart';
import 'package:coffee_shop_app/features/landing_screen/widgets/salutation_widget.dart';
import 'package:flutter/material.dart';

class LandingScreenMain extends StatefulWidget {
  const LandingScreenMain({super.key});

  @override
  State<LandingScreenMain> createState() => _LandingScreenMainState();
}

class _LandingScreenMainState extends State<LandingScreenMain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.frothyWhite,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SalutationWidget(),

              const SizedBox(height: 24.0),

              LoginCardWidget()
            ],
          ),
        ),
      ),
    );
  }
}
