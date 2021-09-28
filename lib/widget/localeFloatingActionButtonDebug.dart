import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LocaleFloatingActionButton extends StatelessWidget {
  const LocaleFloatingActionButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      heroTag: null,
      onPressed: () {
        if (Get.locale!.languageCode == Locale('en').languageCode) {
          Get.updateLocale(Locale('ar'));
        } else {
          Get.updateLocale(Locale('en'));
        }
      },
      child: Icon(Icons.language),
    );
  }
}
