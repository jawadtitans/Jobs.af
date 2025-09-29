import 'package:flutter/material.dart';

import '../../../Providers/introState.dart';
import '../../../utils/Device_Utils/device_utils.dart';
import '../../../utils/constants/sizes.dart';

class OnBoardingSkip extends StatelessWidget {
  final OnboardingProvider appState;
  const OnBoardingSkip({super.key, required this.appState});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: DeviceUtils.getAppBarHeight(),
      right: TSizes.defaultSpace * 1.8,
      child: Theme(
        data: ThemeData(
          highlightColor: Colors.transparent,
          splashColor: Colors.grey,
          splashFactory: InkRipple.splashFactory,
        ),
        child: TextButton(
          style: TextButton.styleFrom(backgroundColor: Colors.white),
          onPressed: () => appState.skipOnboarding(context),
          child: const Text(
            'Skip',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
