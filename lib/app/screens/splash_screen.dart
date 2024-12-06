import 'package:flutter/material.dart';
import 'package:shadow_meet/app/screens/onboarding_screen.dart';
import 'package:shadow_meet/core/utils/constants/colors_constants.dart';
import 'package:shadow_meet/core/utils/constants/images_constants.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double opacity = 0.0;

  @override
  void initState() {
    _fadeIn();
    super.initState();
  }

  _fadeIn() async {
    Future.delayed(Duration(milliseconds: 500), () {
      setState(() {
        opacity = 1.0;
      });
    });

    Future.delayed(Duration(seconds: 3), () {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) => OnboardingScreen(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: AnimatedOpacity(
        opacity: opacity,
        duration: Duration(seconds: 2),
        child: Center(
          child: Image.asset(
            ImageConst.splash,
            height: 250,
            width: 250,
          ),
        ),
      ),
    );
  }
}
