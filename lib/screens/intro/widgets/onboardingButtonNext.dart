import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:jobs_af/Providers/introState.dart';

import '../../../utils/Device_Utils/device_utils.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';

class OnBoardingNextButton extends StatelessWidget {
  final OnboardingProvider appstate;
  const OnBoardingNextButton({required this.appstate, super.key});

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunction.isDarkMode(context);

    return Positioned(
      right: HelperFunction.screenWidth(context) * 0.30,
      bottom: DeviceUtils.getBottomNavigationBarHeight(),
      child: ElevatedButton(
        onPressed: () => appstate.nextPage(context),
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: 35, vertical: 15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(29),
          ),
          backgroundColor: dark ? TColors.primary : TColors.primary,
        ),
        child: Row(
          children: [
            Text(
              "Continue",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w400,
                color: Colors.white,
              ),
            ),
            const SizedBox(width: 8),
            const Icon(Iconsax.arrow_right_3, size: 20),
          ],
        ),
      ),
    );
  }
}
