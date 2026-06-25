import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';
import '../../../shared/app_texts.dart';

class LoginCardWidget extends StatelessWidget {
  const LoginCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            width: double.infinity,
            decoration: BoxDecoration(
                color: AppColors.freshMint,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8.0),
                    topRight: Radius.circular(8.0)
                )
            ),
            child: Column(
              children: [
                AppTexts.medium(
                  text: "Join the Rewards program to enjoy free beverages, special offers and more!",
                  color: AppColors.frothyWhite
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: FilledButton(
                          onPressed: () {},
                          style: FilledButton.styleFrom(
                              backgroundColor: AppColors.espressoBrown,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadiusGeometry.circular(16.0)
                              )
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16.0),
                            child: AppTexts.medium(
                                text: "JOIN NOW",
                                fontSize: 14.0,
                                color: AppColors.frothyWhite
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(width: 24.0),

                      Expanded(
                        child: FilledButton(
                            onPressed: () {},
                            style: FilledButton.styleFrom(
                                backgroundColor: AppColors.creamyLatte,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadiusGeometry.circular(16.0)
                                )
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 16.0),
                              child: AppTexts.medium(
                                  text: "GUEST ORDER",
                                  fontSize: 14.0,
                                  color: AppColors.espressoBrown
                              ),
                            )
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),

          Container(
            padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(8.0),
                    bottomRight: Radius.circular(8.0)
                )
            ),
            child: Column(
              children: [
                AppTexts.medium(
                    text: "Already have an account?",
                    fontSize: 14.0,
                    color: AppColors.black
                ),

                const SizedBox(height: 16.0),

                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16.0)
                                ),
                                side: BorderSide(
                                    color: AppColors.freshMint,
                                    width: 3
                                )
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 16.0),
                              child: AppTexts.medium(
                                  text: "LOGIN",
                                  fontSize: 14.0,
                                  color: AppColors.freshMint
                              ),
                            )
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
