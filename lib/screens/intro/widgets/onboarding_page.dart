import 'package:flutter/material.dart';

import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';

class OnBoardingPage1 extends StatelessWidget {
  const OnBoardingPage1({
    super.key,
    required this.image,
    required this.title,
    required this.subTitle,
  });

  final String image, title, subTitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image(
            fit: BoxFit.contain,
            width: HelperFunction.screenWidth(context) * 0.96,
            height: HelperFunction.screenHeight(context) * 0.57,
            image: AssetImage(image),
          ),
          Text(
            maxLines: 2,
            textDirection: TextDirection.ltr,
            title,
            style: Theme.of(context).textTheme.headlineLarge!.copyWith(
              fontSize: 27,
              fontWeight: FontWeight.w800,
            ),
            textAlign: TextAlign.start,
          ),
          const SizedBox(height: TSizes.spaceBtwItems),
          Text(
            subTitle,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              fontSize: 15,
              fontWeight: FontWeight.w400,
            ),
            textAlign: TextAlign.start,
          ),
        ],
      ),
    );
  }
}
