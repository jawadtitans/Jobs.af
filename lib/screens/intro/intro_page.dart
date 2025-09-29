import 'package:flutter/material.dart';
import 'package:jobs_af/screens/intro/widgets/onboardingButtonNext.dart';
import 'package:jobs_af/screens/intro/widgets/onboarding_dots.dart';
import 'package:jobs_af/screens/intro/widgets/onboarding_page.dart';
import 'package:jobs_af/screens/intro/widgets/onboarding_skip.dart';

import 'package:provider/provider.dart';

import '../../Providers/introState.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final appstate = Provider.of<OnboardingProvider>(context, listen: false);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView(
            controller: appstate.pageController,
            onPageChanged: appstate.updatePage,
            children: [
              /// first view
              OnBoardingPage1(
                image: 'assets/images/content/on1.png',
                title: 'Brows and Search for Jobs',
                subTitle:
                    "look through hundreds of jo openings to find the on that's right for you.",
              ),
              OnBoardingPage1(
                image: 'assets/images/content/on2.png',
                title: 'Explore and search for companies',
                subTitle:
                    "Explore thousands of companies and established businesses.",
              ),
              OnBoardingPage1(
                image: 'assets/images/content/on3.png',
                title: 'Stay tuned for new opportunities',
                subTitle:
                    "create job alerts and stay Up-to-date easily with the latest and offers.",
              ),
              OnBoardingPage1(
                image: 'assets/images/content/on4.png',
                title: 'Manage your profile',
                subTitle:
                    "customize your profile and showcase your skills and talents to the world ",
              ),
              // OnboardingThird(),
            ],
          ),

          /// Skip Button
          OnBoardingSkip(appState: appstate),
          OnBoardingDotNavigation(appstate: appstate),
          OnBoardingNextButton(appstate: appstate),
        ],
      ),
    );
  }
}
