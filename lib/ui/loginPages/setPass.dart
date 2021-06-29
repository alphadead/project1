import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vamos/ui/loginPages/signUp.dart';
import 'package:vamos/ui/utils/color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vamos/ui/utils/loginbkground.dart';
import 'package:vamos/ui/utils/theme.dart';
import 'package:vamos/widget/inputField.dart';
import 'package:vamos/widget/loginpageStack.dart';

class SetPass extends StatefulWidget {
  const SetPass({Key? key}) : super(key: key);

  @override
  _SetPassState createState() => _SetPassState();
}

class _SetPassState extends State<SetPass> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              LoginPageStack(
                heading: "Set Password",
                imageWidget: Positioned(
                  top: -15.h,
                  left: 155.w,
                  height: 260.h,
                  width: 330.w,
                  child: Image.asset(
                    'assets/images/setPass.png',
                  ),
                ),
              ),
              Container(
                child: Column(
                  children: [
                    RegisterPageTextField(
                      label: "OTP",
                    ),
                    RegisterPageTextField(
                      label: "Set Password",
                      obscureText: true,
                    ),
                    RegisterPageTextField(
                      label: "Confirm Password",
                      obscureText: true,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [],
                      ),
                    ),
                    Center(
                      child: primaryActionButton(
                        context: context,
                        onPressed: () {},
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
