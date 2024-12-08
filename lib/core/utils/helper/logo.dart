import 'package:flutter/material.dart';

import '../constants/images_constants.dart';
import '../constants/size_constants.dart';

Widget logoWidget() {
  return Row(
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
  );
}
