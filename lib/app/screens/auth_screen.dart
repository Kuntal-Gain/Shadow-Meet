import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:shadow_meet/core/utils/constants/colors_constants.dart';
import 'package:shadow_meet/core/utils/constants/images_constants.dart';
import 'package:shadow_meet/core/utils/constants/size_constants.dart';
import 'package:shadow_meet/core/utils/constants/text_constant.dart';
import 'package:shadow_meet/core/widgets/text_field_widget.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _emailController = TextEditingController();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  bool isTapped = false;
  bool isLogin = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  ImageConst.mascot,
                  height: 60,
                ),
                sizeHor(10),
                Image.asset(
                  ImageConst.logo,
                  height: 30,
                ),
              ],
            ),
            if (isLogin) ...[
              sizeVer(40),
              Center(
                child: Text(
                  "Login",
                  style: appStyle(
                    size: 50,
                    color: AppColor.black,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              sizeVer(40),
            ],
            if (!isLogin)
              Center(
                child: CircleAvatar(
                  backgroundColor: AppColor.bgGrey,
                  radius: 55,
                ),
              ),
            textFieldWidget(
              controller: _emailController,
              label: "Email",
            ),
            if (!isLogin)
              textFieldWidget(
                controller: _usernameController,
                label: "Username",
              ),
            textFieldWidgetWithPassword(
                controller: _passwordController,
                label: "Password",
                isHidden: !isTapped,
                onTap: () {
                  setState(() {
                    isTapped = !isTapped;
                  });
                }),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: isLogin
                          ? "Don't Have An Account ? "
                          : "Already Have an Account ? ",
                      style: appStyle(
                        size: 18,
                        color: AppColor.black,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    TextSpan(
                        text: isLogin ? "Create One" : "Login",
                        style: appStyle(
                          size: 18,
                          color: AppColor.purple,
                          fontWeight: FontWeight.w900,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            setState(() {
                              isLogin = !isLogin;
                            });
                          }),
                  ],
                ),
              ),
            ),
            Container(
              height: 60,
              width: double.infinity,
              margin: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppColor.blue,
                borderRadius: BorderRadius.circular(14),
              ),
              child: Center(
                child: Text(
                  isLogin ? "Login" : "Create Account",
                  style: appStyle(
                    size: 22,
                    color: AppColor.white,
                    fontWeight: FontWeight.bold,
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
