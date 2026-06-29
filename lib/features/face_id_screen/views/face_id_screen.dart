import 'package:coffee_shop_app/core/constants/app_assets.dart';
import 'package:coffee_shop_app/core/constants/app_colors.dart';
import 'package:coffee_shop_app/features/loading_splassh_screen/loading_splash_screen.dart';
import 'package:coffee_shop_app/shared/app_texts.dart';
import 'package:flutter/material.dart';

class FaceIdScreen extends StatefulWidget {
  const FaceIdScreen({super.key});

  @override
  State<FaceIdScreen> createState() => _FaceIdScreenState();
}

class _FaceIdScreenState extends State<FaceIdScreen> {

  void _onButtonPressed(bool isSettingFaceID) {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (builder) {
      return LoadingSplashScreen(isSettingFaceID: isSettingFaceID);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [

            Center(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 240.0),
                child: Image.asset(
                  AppAssets.appIcon,
                  height: 380.0,
                ),
              ),
            ),

            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
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
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [

                      Image.asset(
                        AppAssets.faceIdIcon,
                        height: 72.0,
                      ),

                      const SizedBox(height: 32.0),

                       Padding(
                         padding: const EdgeInsets.symmetric(horizontal: 40.0),
                         child: Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                             AppTexts.bold(
                                 text: "Want to enable\nfaceID?",
                                 color: AppColors.espressoBrown,
                                 fontSize: 32.0,
                             ),

                             AppTexts.regular(
                                 text: "This helps you login quicker!",
                                 color: AppColors.espressoBrown,
                                 fontSize: 14.0
                             ),
                           ],
                         ),
                       ),

                      const SizedBox(height: 32.0),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: FilledButton(
                              onPressed: () {
                                _onButtonPressed(true);
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
                                    text: "Yes",
                                    fontSize: 14.0,
                                    color: AppColors.frothyWhite
                                ),
                              ),
                            ),
                          ),

                          SizedBox(width: 32.0),

                          Expanded(
                            child: FilledButton(
                              onPressed: () {
                                _onButtonPressed(false);
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
                                    text: "No",
                                    fontSize: 14.0,
                                    color: AppColors.frothyWhite
                                ),
                              ),
                            ),
                          )
                        ],
                      ),

                      const SizedBox(height: 150.0)
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
