import 'package:flutter/material.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class HomeScreenShimmer extends StatelessWidget {
  const HomeScreenShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Shimmer(
                  child: Container(
                    height: 70.0,
                    color: Colors.grey.shade300,
                  ),
                ),

                const SizedBox(height: 8.0),

                Shimmer(
                  child: Container(
                    height: 32.0,
                    width: 230.0,
                    color: Colors.grey.shade300,
                  ),
                ),

                const SizedBox(height: 8.0),

                Shimmer(
                  child: Container(
                    height: 200.0,
                    color: Colors.grey.shade300,
                  ),
                ),

                const SizedBox(height: 32.0),

                Shimmer(
                  child: Container(
                    height: 32.0,
                    width: 120.0,
                    color: Colors.grey.shade300,
                  ),
                ),

                const SizedBox(height: 8.0),

                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(7, (index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 16.0),
                        child: Shimmer(
                          child: Container(
                            height: 180.0,
                            width: 180.0,
                            color: Colors.grey.shade300,
                          ),
                        ),
                      );
                    }),
                  ),
                ),

                const SizedBox(height: 32.0),

                Shimmer(
                  child: Container(
                    height: 32.0,
                    width: 146.0,
                    color: Colors.grey.shade300,
                  ),
                ),

                const SizedBox(height: 8.0),

                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(7, (index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 16.0),
                        child: Shimmer(
                          child: Container(
                            height: 180.0,
                            width: 180.0,
                            color: Colors.grey.shade300,
                          ),
                        ),
                      );
                    }),
                  ),
                ),

                const SizedBox(height: 32.0),

                Shimmer(
                  child: Container(
                    height: 32.0,
                    width: 146.0,
                    color: Colors.grey.shade300,
                  ),
                ),

                const SizedBox(height: 8.0),

                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(7, (index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 16.0),
                        child: Shimmer(
                          child: Container(
                            height: 180.0,
                            width: 180.0,
                            color: Colors.grey.shade300,
                          ),
                        ),
                      );
                    }),
                  ),
                )
              ],
            ),
          )
        ),
      ),
      bottomNavigationBar: Shimmer(
        child: Container(
          width: double.infinity,
          height: 80,
          color: Colors.grey.shade300,
        ),
      ),
    );
  }
}
