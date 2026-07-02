import 'package:coffee_shop_app/core/constants/app_assets.dart';
import 'package:coffee_shop_app/core/constants/app_colors.dart';
import 'package:coffee_shop_app/features/home_screen/views/home_screen_main.dart';
import 'package:coffee_shop_app/features/onboarding_screen/views/widgets/onboarding_one_view.dart';
import 'package:coffee_shop_app/features/onboarding_screen/views/widgets/onboarding_three_view.dart';
import 'package:coffee_shop_app/features/onboarding_screen/views/widgets/onboarding_two_view.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/app_strings.dart';
import '../../../shared/app_texts.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {

  final PageController _pageController = PageController();

  int _currentIndex = 0;

  void _animateToPage(int index) {
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeIn
    );
  }

  final List<Widget> _pages = [
    const OnboardingOneView(),
    const OnboardingTwoView(),
    const OnboardingThreeView()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const SizedBox.shrink(),
        actions: [
          if (_currentIndex != 2)...[
            TextButton(
              onPressed: () {
                _pageController.jumpToPage(2);
              },
              child: AppTexts.medium(
                text: "Skip",
                fontSize: 14.0
              )
            )
          ]
        ],
      ),

      body: SafeArea(
        child: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          children: _pages,
        ),
      ),

      bottomNavigationBar: Container(
        color: AppColors.frothyWhite,
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 40.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            if (_currentIndex == 0)...[
              Image.asset(
                AppAssets.onboardingOneBeanIcon,
                height: 40.0,
              ),
            ],

            if (_currentIndex == 1)...[
              Image.asset(
                AppAssets.onboardingTwoBeanIcon,
                height: 40.0,
              ),
            ],

            if (_currentIndex == 2)...[
              Image.asset(
                AppAssets.onboardingThreeBeanIcon,
                height: 40.0,
              ),
            ],


            FilledButton(
              onPressed: () {
                switch(_currentIndex) {
                  case 0:
                    _animateToPage(1);
                  break;

                  case 1:
                    _animateToPage(2);
                  break;

                  case 2:
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (builder) {
                      return const HomeScreenMain();
                    }));
                  break;
                }
              },
              style: FilledButton.styleFrom(
                backgroundColor: AppColors.espressoBrown,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(16.0)
                )
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 40),
                child: AppTexts.medium(
                  text: _currentIndex != 2 ? AppStrings.next : AppStrings.done,
                  fontSize: 14.0,
                  color: AppColors.frothyWhite
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
