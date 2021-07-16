import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vamos/ui/utils/color.dart';
import 'package:vamos/ui/utils/theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBar extends StatefulWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: [
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(right: 15),
              child: Image.asset(
                "assets/images/notifications.png",
                scale: 3.5,
              ),
            ),
            Transform.translate(
              offset: Offset(4, -13),
              child: Container(
                //padding: EdgeInsets,
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.red,
                ),
                child: Text(
                  "05",
                  style: themeData().textTheme.headline3,
                ),
              ),
            )
          ],
        ),
      ],
      automaticallyImplyLeading: false,
      leading: CustomSwitch(),
      title: Container(
        width: 50.w,
        child: Image.asset(
          "assets/logo.webp",
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
    return Transform.scale(
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
    );
  }
}
