import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../Providers/introState.dart';
import '../../../utils/helpers/helper_functions.dart';
import '../../../utils/constants/colors.dart';

class OnBoardingDotNavigation extends StatelessWidget {
  final OnboardingProvider appstate;
  const OnBoardingDotNavigation({super.key, required this.appstate});

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunction.isDarkMode(context);

    return Positioned(
      bottom: 120, // distance from bottom, adjust as needed
      left: 0,
      right: 0,
      child: Center(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            borderRadius: BorderRadiusGeometry.circular(20),
            color: Colors.black38.withOpacity(0.3),
          ),
          child: SmoothPageIndicator(
            controller: appstate.pageController,
            count: appstate.totalPages,
            effect: WormEffect(
              dotColor: dark ? Colors.grey.shade400 : Colors.grey.shade300,
              activeDotColor: TColors.primary,
              dotHeight: 7,
              dotWidth: 7,
              spacing: 6,
              type: WormType.normal,
              // smooth animation
            ),
          ),
        ),
      ),
    );
  }
}
