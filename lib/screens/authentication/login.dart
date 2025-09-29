import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:jobs_af/Providers/introState.dart';
import 'package:jobs_af/screens/authentication/widgets/card_widget.dart';
import 'package:jobs_af/screens/authentication/widgets/customeSliverAppBar.dart';
import 'package:jobs_af/screens/authentication/widgets/or_line.dart';
import 'package:jobs_af/utils/constants/colors.dart';
import 'package:provider/provider.dart';

//------------------- Page -------------------
class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    final appstate = Provider.of<OnboardingProvider>(context, listen: false);
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          Custome_Sliver_appBar(
            color_shape: Color(0xFFeaf3fe).withOpacity(0.3),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: Column(
                children: [
                  const Text(
                    "Welcome Back!",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      "Login and explore new vacancies",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                  ),

                  // Buttons
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: OrDivider(),
                  ),

                  AuthButton(
                    TextColors: Colors.black87,
                    Border_color: Colors.grey.shade300,
                    text: "Continue with Google",
                    icon: SvgPicture.asset(
                      "assets/icons/categories/google-icon.svg", // your SVG file path
                      width: 20,
                      height: 20,
                    ),
                    onTap: () {},
                  ),

                  const SizedBox(height: 30),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Don't have an account? "),
                      GestureDetector(
                        onTap: () {},
                        child: const Text(
                          "Sign Up",
                          style: TextStyle(
                            decorationStyle: TextDecorationStyle.wavy,
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

//------------------- Custom Clipper -------------------
