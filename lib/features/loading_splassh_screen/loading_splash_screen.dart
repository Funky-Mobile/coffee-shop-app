import 'package:coffee_shop_app/core/constants/app_assets.dart';
import 'package:coffee_shop_app/core/constants/app_colors.dart';
import 'package:coffee_shop_app/shared/app_texts.dart';
import 'package:flutter/material.dart';

import '../onboarding_screen/views/onboarding_screen.dart';

class LoadingSplashScreen extends StatefulWidget {

  final bool isSettingFaceID;

  const LoadingSplashScreen({super.key, required this.isSettingFaceID});

  @override
  State<LoadingSplashScreen> createState() => _LoadingSplashScreenState();
}

class _LoadingSplashScreenState extends State<LoadingSplashScreen> {

  bool isDoneSettingFaceID = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!widget.isSettingFaceID) {
        Future.delayed(Duration(seconds: 1), () {
          if (mounted) {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (builder) {
              return OnboardingScreen();
            }));
          }
        });
      }

      if (widget.isSettingFaceID) {
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (builder) {
            return StatefulBuilder(builder: (builder, setBuilderState) {

              Future.delayed(Duration(seconds: 2), () {
                if (mounted) {
                  setBuilderState(() {
                    isDoneSettingFaceID = true;
                  });
                }
              });

              if (isDoneSettingFaceID) {
                Future.delayed(Duration(seconds: 1), () {
                  if (mounted) {

                    Navigator.pop(context);

                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (builder) {
                      return OnboardingScreen();
                    }));
                  }
                });
              }

              return Scaffold(
                backgroundColor: Colors.transparent,
                body: Center(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
                    decoration: BoxDecoration(
                        color: AppColors.creamyLatte,
                        borderRadius: BorderRadius.circular(8.0)
                    ),
                    child: IntrinsicHeight(
                      child: Column(
                        children: [

                          isDoneSettingFaceID
                              ? Icon(
                            Icons.check_circle_outline_outlined,
                            color: AppColors.frothyWhite,
                            size: 72.0,
                          )
                              : ImageIcon(
                            AssetImage(AppAssets.faceIdIcon),
                            color: AppColors.frothyWhite,
                            size: 72.0,
                          ),

                          const SizedBox(height: 16.0),

                          AppTexts.regular(
                              text: "Face ID",
                              color: AppColors.black
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              );
            });
          }
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset(
                  AppAssets.appIcon,
                  height: 380.0,
                ),

                const SizedBox(height: 104.0),

                Image.asset(
                  AppAssets.beansIcon,
                  width: 180.0,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
