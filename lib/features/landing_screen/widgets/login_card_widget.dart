import 'package:coffee_shop_app/core/constants/app_strings.dart';
import 'package:coffee_shop_app/features/auth_screen/views/login_view/login_view.dart';
import 'package:coffee_shop_app/features/auth_screen/views/sign_up_view/sign_up_view.dart';
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
                  text: AppStrings.loginAndForFreeTeaDescription,
                  color: AppColors.frothyWhite
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: FilledButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (builder) {
                              return SignUpView();
                            }));
                          },
                          style: FilledButton.styleFrom(
                            backgroundColor: AppColors.espressoBrown,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadiusGeometry.circular(16.0)
                            )
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16.0),
                            child: AppTexts.medium(
                              text: AppStrings.joinNow,
                              fontSize: 14.0,
                              color: AppColors.frothyWhite
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(width: 24.0),

                      Expanded(
                        child: FilledButton(
                          onPressed: () {
                            ///Todo: Open guest order page
                          },
                          style: FilledButton.styleFrom(
                            backgroundColor: AppColors.creamyLatte,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadiusGeometry.circular(16.0)
                            )
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16.0),
                            child: AppTexts.medium(
                              text: AppStrings.gustOrder,
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
                  text: AppStrings.alreadyHaveAccount,
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
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (builder) {
                              return LoginView();
                            }));
                          },
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
                              text: AppStrings.login,
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
