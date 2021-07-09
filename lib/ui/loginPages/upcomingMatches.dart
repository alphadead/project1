import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vamos/core/service/controller/authController.dart';
import 'package:vamos/ui/utils/color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UpcomingMatchesPage extends StatelessWidget {
  const UpcomingMatchesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool check = true;
    return SafeArea(
      child: GetBuilder<AuthController>(
        builder: (_authService) => Scaffold(
          floatingActionButtonLocation:
              FloatingActionButtonLocation.miniCenterDocked,
          floatingActionButton: Container(
            width: 65,
            child: FittedBox(
              child: FloatingActionButton(
                elevation: 0,
                onPressed: () {},
                backgroundColor: Color.fromRGBO(239, 77, 35, 1),
                child: Image.asset(
                  "assets/images/FloatingActionButton.png",
                  width: 30,
                ),
              ),
            ),
          ),
          bottomNavigationBar: BottomAppBar(
            //color: bgroundCol,
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.only(left: 10),
                  child: IconButton(
                    iconSize: 58,
                    onPressed: () {},
                    icon: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            width: 30,
                            height: 30,
                            child: Image.asset(
                              "assets/images/BottomAppBarProfile.png",
                              //scale: 3,
                            ),
                          ),
                          Text(
                            "Profile",
                            style: TextStyle(
                              fontSize: 8.8.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Spacer(
                  flex: 1,
                ),
                IconButton(
                  iconSize: 58,
                  onPressed: () {},
                  icon: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          width: 30,
                          height: 30,
                          child: Image.asset(
                            "assets/images/BottomAppBarWallet.png",
                            //scale: 3,
                          ),
                        ),
                        Text(
                          "Wallet",
                          style: TextStyle(
                            fontSize: 8.8.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Spacer(
                  flex: 5,
                ),
                IconButton(
                  iconSize: 58,
                  onPressed: () {},
                  icon: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          width: 30,
                          height: 30,
                          child: Image.asset(
                            "assets/images/BottomAppBarpedestal.png",
                            //scale: 3,
                          ),
                        ),
                        Text(
                          "Leader Board",
                          style: TextStyle(
                            fontSize: 8.8.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Spacer(
                  flex: 1,
                ),
                Container(
                  padding: EdgeInsets.only(right: 10),
                  child: IconButton(
                    iconSize: 58,
                    onPressed: () {},
                    icon: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            width: 30,
                            height: 30,
                            child: Image.asset(
                              "assets/images/BottomAppBarsettings.png",
                              //scale: 3,
                            ),
                          ),
                          Text(
                            "Settings",
                            style: TextStyle(
                              fontSize: 8.8.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          appBar: AppBar(
            toolbarHeight: 60,
            //elevation: 20,
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
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 8.sp,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  )
                ],
              ),
            ],
            backgroundColor: bgroundCol,
            centerTitle: true,
            automaticallyImplyLeading: false,
            leading: CustomSwitch(),
            title: Container(
              width: 50,
              child: Image.asset(
                "assets/logo.webp",
              ),
            ),
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
    return Transform.scale(
      scale: .75,
      child: CupertinoSwitch(
        trackColor: Colors.white,
        activeColor: Colors.red,
        //trackColor: MaterialStateProperty.all(Colors.red),
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
