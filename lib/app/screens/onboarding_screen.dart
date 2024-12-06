import 'package:flutter/material.dart';
import 'package:shadow_meet/app/screens/auth_screen.dart';
import 'package:shadow_meet/core/utils/constants/colors_constants.dart';
import 'package:shadow_meet/core/utils/constants/images_constants.dart';
import 'package:shadow_meet/core/utils/constants/size_constants.dart';
import 'package:shadow_meet/core/utils/constants/text_constant.dart';
import 'package:shadow_meet/core/utils/helper/onboarding.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  List<Onboarding> onboarding = [
    Onboarding(
      imageId: ImageConst.onboarding_1,
      label: "Blind Date",
      content: "Love People with heart not appearance",
    ),
    Onboarding(
      imageId: ImageConst.onboarding_2,
      label: "Anonymous Until Consent",
      content:
          "You and your date account will remain private until both have common understanding and consent",
    ),
    Onboarding(
      imageId: ImageConst.onboarding_3,
      label: "Beware of Unknown Threats",
      content:
          "Never share confidential information about yourself or go to strange locations or alleys",
    ),
  ];

  int _currentPage = 0;
  late final PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              itemCount: onboarding.length,
              itemBuilder: (context, index) {
                final item = onboarding[index];
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      item.imageId,
                      height: 300,
                      width: 300,
                    ),
                    const SizedBox(height: 24),
                    Text(item.label,
                        style: appStyle(
                          size: 34,
                          color: AppColor.black,
                          fontWeight: FontWeight.bold,
                        )),
                    const SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: Text(item.content,
                          textAlign: TextAlign.center,
                          style: appStyle(
                            size: 20,
                            color: AppColor.black,
                            fontWeight: FontWeight.w400,
                          )),
                    ),
                  ],
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              onboarding.length,
              (index) => AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                margin: const EdgeInsets.symmetric(horizontal: 4),
                height: 10,
                width: _currentPage == index ? 20 : 10,
                decoration: BoxDecoration(
                  color:
                      _currentPage == index ? AppColor.blue : AppColor.purple,
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              sizeZ(),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton(
                  onPressed: () {
                    if (_currentPage == onboarding.length - 1) {
                      // Navigate to the next screen or finish onboarding
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (_) => AuthScreen()));
                    } else {
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor.blue,
                    padding: const EdgeInsets.symmetric(
                        vertical: 16, horizontal: 32),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    _currentPage == onboarding.length - 1
                        ? 'Get Started'
                        : 'Next',
                    style: appStyle(
                        size: 20,
                        color: AppColor.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
