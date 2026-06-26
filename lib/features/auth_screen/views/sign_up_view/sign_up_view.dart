import 'package:coffee_shop_app/core/constants/app_assets.dart';
import 'package:coffee_shop_app/core/constants/app_colors.dart';
import 'package:coffee_shop_app/core/constants/app_strings.dart';
import 'package:coffee_shop_app/shared/app_texts.dart';
import 'package:flutter/material.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          splashFactory: NoSplash.splashFactory
                        ),
                        child: AppTexts.medium(
                          text: "",
                          fontSize: 14.0
                        )
                      ),

                      Image.asset(
                        AppAssets.appIcon,
                        height: 80.0,
                      ),

                      TextButton(
                        onPressed: () {
                          ///Todo: Skip process
                        },
                        child: AppTexts.medium(
                          text: "Skip",
                          fontSize: 14.0
                        )
                      )
                    ],
                  ),

                  const SizedBox(height: 16.0),

                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(horizontal: 80.0, vertical: 32.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(32.0),
                        topRight: Radius.circular(32.0)
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          spreadRadius: 0,
                          blurRadius: 4.0,
                          offset: Offset(0, -2.0)
                        )
                      ]
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppTexts.bold(
                                text: AppStrings.signUp,
                                color: AppColors.espressoBrown
                            ),
                            AppTexts.regular(
                              text: AppStrings.signUpExplained,
                              fontSize: 14.0,
                              color: AppColors.espressoBrown
                            )
                          ],
                        ),

                        const SizedBox(height: 24.0),
                        _buildInputField(label: "Username", hint: "Enter username"),

                        const SizedBox(height: 24.0),
                        _buildInputField(label: "Email or phone number", hint: "Type your email or phone number"),

                        const SizedBox(height: 24.0),
                        _buildInputField(label: "Password", hint: "Type your password"),

                        const SizedBox(height: 32.0),

                        Row(
                          children: [
                            Expanded(
                              child: FilledButton(
                                onPressed: () {
                                  ///Todo: Register User
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
                                    text: AppStrings.register,
                                    fontSize: 14.0,
                                    color: AppColors.frothyWhite
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        
                        const SizedBox(height: 16.0),
                        
                        AppTexts.regular(
                          text: "Already have an account?",
                          fontSize: 14.0,
                          color: AppColors.black.withValues(alpha: .5)
                        ),

                        const SizedBox(height: 16.0),

                        Row(
                          children: [
                            Expanded(
                              child: FilledButton(
                                onPressed: () {
                                  ///Todo: Register User
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
                                    text: AppStrings.signIn,
                                    fontSize: 14.0,
                                    color: AppColors.frothyWhite
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 24.0),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInputField({required String label, required String hint}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppTexts.medium(
          text: label,
          fontSize: 14.0,
          color: AppColors.freshMint
        ),

        const SizedBox(height: 8.0),

        Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: Colors.black26,
                  spreadRadius: 0,
                  blurRadius: 4.0,
                  offset: Offset(0, 2.0)
              )
            ],
          ),
          child: TextFormField(
            decoration: InputDecoration(
                hintText: hint,
                border: InputBorder.none,
                filled: true,
                fillColor: Colors.white
            ),
          ),
        )
      ],
    );
  }
}
