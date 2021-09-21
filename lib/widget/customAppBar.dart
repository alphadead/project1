import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vamos/ui/utils/color.dart';
import 'package:vamos/ui/utils/theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CustomAppBar extends StatefulWidget {
  final bool isPencil;
  final bool showComments;
  final PreferredSizeWidget? tabBar;
  CustomAppBar(
      {this.isPencil = false, this.showComments = false, this.tabBar, Key? key})
      : super(key: key);

  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      bottom: widget.tabBar,
      actions: [
        widget.isPencil == false
            ? widget.showComments
                ? GestureDetector(
                    onTap: () async {
                      Get.toNamed('/commentsPage');
                    },
                    child: Container(
                      margin: EdgeInsets.only(right: 30.w),
                      child: Icon(Icons.comment_rounded, color: Colors.white,),
                    ),
                  )
                : Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 30.w),
                        child: Image.asset(
                          "assets/images/notifications.png",
                          scale: 3.5,
                        ),
                      ),
                      Transform.translate(
                        offset: Offset(-2, -13),
                        child: Container(
                          //padding: EdgeInsets
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.red,
                          ),
                          child: Text(
                            AppLocalizations.of(context)!.homePage_demoNotif_5,
                            style: themeData().textTheme.headline3,
                          ),
                        ),
                      )
                    ],
                  )
            : GestureDetector(
                onTap: () async {
                  Get.offNamed("/profileScreen", arguments: true);
                },
                child: Container(
                  margin: EdgeInsets.only(right: 30.w),
                  child: Image.asset(
                    "assets/images/pencil.png",
                    scale: 3.5,
                  ),
                ),
              ),
      ],
      automaticallyImplyLeading: false,
      leading: Container(
        margin: EdgeInsets.only(left: 30.w),
        child: CustomSwitch(),
      ),
      title: GestureDetector(
        onTap: () {
          Get.offAllNamed('/homeScreen');
        },
        child: Container(
          width: 50.w,
          child: Image.asset(
            "assets/logo.webp",
          ),
        ),
      ),
    );
  }
}

class CustomSwitch extends StatefulWidget {
  const CustomSwitch({Key? key}) : super(key: key);

  @override
  _CustomSwitchState createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch> {
  bool check = true;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
      child: Transform.scale(
        scale: .75,
        child: CupertinoSwitch(
          trackColor: Colors.white,
          activeColor: KRed,
          onChanged: (_value) {
            setState(() {
              check = _value;
            });
          },
          value: check,
        ),
      ),
    );
  }
}
