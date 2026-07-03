import 'dart:developer';

import 'package:coffee_shop_app/core/constants/app_assets.dart';
import 'package:coffee_shop_app/core/constants/app_colors.dart';
import 'package:coffee_shop_app/core/constants/app_strings.dart';
import 'package:coffee_shop_app/features/auth_screen/views/login_view/login_view.dart';
import 'package:coffee_shop_app/features/face_id_screen/views/face_id_screen.dart';
import 'package:coffee_shop_app/shared/app_input_fields.dart';
import 'package:coffee_shop_app/shared/app_texts.dart';
import 'package:flutter/material.dart';

import '../../../../core/services/shared_preferences_service.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailOrPhoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _showPassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Align(
              alignment: AlignmentGeometry.bottomCenter,
              child: SingleChildScrollView(
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
                            Navigator.pop(context);
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
                      padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 32.0),
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
                          _buildInputField(
                            label: "Username",
                            hint: "Enter username",
                            controller: _usernameController
                          ),

                          const SizedBox(height: 24.0),
                          _buildInputField(
                            label: "Email or phone number",
                            hint: "Type your email or phone number",
                            controller: _emailOrPhoneController
                          ),

                          const SizedBox(height: 24.0),
                          _buildPasswordInputField(label: "Password", hint: "Type your password", controller: _passwordController),

                          const SizedBox(height: 32.0),

                          Row(
                            children: [
                              Expanded(
                                child: FilledButton(
                                  onPressed: () async {
                                    ///Todo: Register User
                                    final String username = _usernameController.text;
                                    final String emailOrPhone = _emailOrPhoneController.text;
                                    final String password = _passwordController.text;

                                    log("Username: $username");
                                    log("Email or Phone: $emailOrPhone");
                                    log("Password: $password");

                                    ///Todo: Save the login state
                                    await SharedPreferencesService.saveAuthState();

                                    if (context.mounted) {
                                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (builder) {
                                        return FaceIdScreen();
                                      }));
                                    }
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
                                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (builder) {
                                      return LoginView();
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
            )
          ],
        ),
      ),
    );
  }

  Widget _buildInputField({required String label, required String hint, required TextEditingController controller}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppTexts.medium(
          text: label,
          fontSize: 14.0,
          color: AppColors.freshMint
        ),

        const SizedBox(height: 8.0),

        AppInputFields.textField(hint: hint, controller: controller)
      ],
    );
  }

  Widget _buildPasswordInputField({required String label, required String hint, required TextEditingController controller}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppTexts.medium(
          text: label,
          fontSize: 14.0,
          color: AppColors.freshMint
        ),

        const SizedBox(height: 8.0),

        AppInputFields.passwordField(
          controller: controller,
          hint: hint,
          showPassword: _showPassword,
          onSuffixPressed: () {
            setState(() {
              _showPassword = !_showPassword;
            });
          }
        )
      ],
    );
  }
}
