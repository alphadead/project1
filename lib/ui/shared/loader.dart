import 'package:flutter/material.dart';
import 'package:vamos/ui/utils/color.dart';

class Dialogs {
  static Future<void> showLoadingDialog(
      BuildContext context, GlobalKey key) async {
    return showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return Container(
              height: MediaQuery.of(context).size.height,
              child: Stack(
                children: [
                  Opacity(
                    opacity: 0.1,
                    child:
                        ModalBarrier(dismissible: false, color: KColorAppBar),
                  ),
                  Center(
                    child: CircularProgressIndicator(),
                  ),
                ],
              ));
        });
  }
}
