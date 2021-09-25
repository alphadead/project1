import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vamos/ui/utils/color.dart';

abstract class Utility {
  static void showLoadingDialog() {
    Get.dialog<void>(
      Container(
          // width: double.infinity,
          // height: Get.mediaQuery.size.height,
          child: Stack(
        children: [
          Opacity(
            opacity: 0.1,
            child: ModalBarrier(dismissible: false, color: KColorAppBar),
          ),
          Center(
            child: CircularProgressIndicator(),
          ),
        ],
      )),
      barrierDismissible: false,
    );
  }

  static void closeDialog() {
    if (Get.isDialogOpen ?? false) Get.back<void>();
  }

  static void showSnackbar(String message) {
    closeSnackBar();
    closeDialog();

    if (message == null || message.isEmpty) return;
    Get.rawSnackbar(
      messageText: Text(
        message,
        style: TextStyle(color: Colors.white),
      ),
      backgroundColor: Colors.grey.shade900,
      snackStyle: SnackStyle.FLOATING,
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  /// Close any open snack bar.
  static void closeSnackBar() {
    if (Get.isSnackbarOpen ?? false) Get.back<void>();
  }

  // static void closeBottomSheet() {
  //   if (Get.isBottomSheetOpen ?? false) Get.back<void>();
  // }
}
