import 'dart:developer';

import 'package:coffee_shop_app/features/auth_screen/views/sign_up_view/sign_up_view.dart';
import 'package:coffee_shop_app/features/loading_splassh_screen/loading_splash_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../shared/app_input_fields.dart';
import '../../../../shared/app_texts.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {

  final TextEditingController _usernameController = TextEditingController();
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
                            ///Todo: Skip process
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
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  AppTexts.bold(
                                    text: AppStrings.signInCapitalized,
                                    color: AppColors.espressoBrown
                                  ),

                                  IconButton(
                                    onPressed: () {
                                      ///Todo: Scan face
                                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (builder) {
                                        return LoadingSplashScreen(isSettingFaceID: true);
                                      }));
                                    },
                                    icon: ImageIcon(
                                      AssetImage(
                                        AppAssets.faceIdIcon,
                                      ),
                                      color: AppColors.espressoBrown,
                                      size: 32,
                                    )
                                  )
                                ],
                              ),

                              const SizedBox(height: 8.0),

                              AppTexts.regular(
                                text: AppStrings.signInExplained,
                                fontSize: 14.0,
                                color: AppColors.espressoBrown
                              )
                            ],
                          ),

                          const SizedBox(height: 24.0),
                          _buildInputField(label: "Username", hint: "Enter username", controller: _usernameController),

                          const SizedBox(height: 24.0),
                          _buildPasswordInputField(label: "Password", hint: "Type your password", controller: _passwordController),

                          const SizedBox(height: 32.0),

                          Row(
                            children: [
                              Expanded(
                                child: FilledButton(
                                  onPressed: () {
                                    ///Todo: Login User
                                    final String username = _usernameController.text;
                                    final String password = _passwordController.text;

                                    log("Username: $username");
                                    log("Password: $password");

                                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (builder) {
                                      return LoadingSplashScreen(isSettingFaceID: false);
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
                                        text: AppStrings.login,
                                        fontSize: 14.0,
                                        color: AppColors.frothyWhite
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 80.0),

                          Text.rich(
                            TextSpan(
                              children: <TextSpan>[
                                TextSpan(
                                  text: "Forgot password?",
                                  style: TextStyle(
                                    color: AppColors.freshMint
                                  )
                                ),

                                TextSpan(
                                  text: " Reset here",
                                  style: TextStyle(
                                    color: AppColors.espressoBrown
                                  ),
                                  recognizer: TapGestureRecognizer()..onTap = () {
                                    ///Todo: Navigate to reset password page
                                    log("RESET PASSWORD!!!");
                                  }
                                )
                              ]
                            )
                          ),

                          const SizedBox(height: 20.0),

                          AppTexts.regular(
                            text: AppStrings.doNotHaveAccount,
                            fontSize: 14.0,
                            color: AppColors.black.withValues(alpha: .5)
                          ),

                          const SizedBox(height: 16.0),

                          Row(
                            children: [
                              Expanded(
                                child: FilledButton(
                                  onPressed: () {
                                    ///Todo: Navigate user to register screen
                                    Navigator.pushReplacement(context, (MaterialPageRoute(builder: (builder) {
                                      return SignUpView();
                                    })));
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
                                      text: AppStrings.createNewAccount,
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

        AppInputFields.textField(
          hint: hint,
          controller: controller
        )
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
