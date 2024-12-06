import 'package:flutter/material.dart';
import 'package:shadow_meet/core/utils/constants/colors_constants.dart';

Widget textFieldWidget({
  required TextEditingController controller,
  required String label,
}) {
  return Container(
    height: 60,
    width: double.infinity,
    margin: EdgeInsets.all(12),
    padding: EdgeInsets.all(12),
    decoration: BoxDecoration(
      color: AppColor.white,
      border: Border.all(
        color: AppColor.bgGrey,
      ),
      borderRadius: BorderRadius.circular(13),
    ),
    child: TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: label,
        border: InputBorder.none,
      ),
    ),
  );
}

Widget textFieldWidgetWithPassword({
  required TextEditingController controller,
  required String label,
  required bool isHidden,
  required Function() onTap,
}) {
  return Container(
    height: 60,
    width: double.infinity,
    margin: EdgeInsets.all(12),
    padding: EdgeInsets.all(12),
    decoration: BoxDecoration(
      color: AppColor.white,
      border: Border.all(
        color: AppColor.bgGrey,
      ),
      borderRadius: BorderRadius.circular(13),
    ),
    child: Row(
      children: [
        Expanded(
          child: TextField(
            controller: controller,
            obscureText: isHidden,
            decoration: InputDecoration(
              hintText: label,
              border: InputBorder.none,
            ),
          ),
        ),
        IconButton(
          onPressed: onTap,
          icon: Icon(
            isHidden ? Icons.visibility : Icons.visibility_off,
          ),
        ),
      ],
    ),
  );
}
