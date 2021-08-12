import 'package:flutter/material.dart';
import 'package:vamos/ui/utils/color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

Widget backgroundContainer() {
  return Positioned(
    //top: -20,
    left: -70.w,
    child: Image.asset(
      "assets/images/rectangle_1.webp",
      width: 1.25.sw,
      fit: BoxFit.fitWidth,
    ),
  );
}

Widget primaryActionButton(
    {required BuildContext context,
    required Function()? onPressed,
    double? width,
    double? height,
    double? fontSize,
    Color? color,
    String text = "Continue"}) {
  text == "Continue"
      ? text = AppLocalizations.of(context)!.primaryActionButton
      : text = text;
  return GestureDetector(
    onTap: onPressed,
    child: Container(
      width: width ?? 250.w,
      height: height ?? 40.h,
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: fontSize ?? 15,
            color: Colors.white,
          ),
        ),
      ),
      decoration: BoxDecoration(
        color: color ?? KRed,
        borderRadius: BorderRadius.circular(30),
      ),
    ),
  );
}
