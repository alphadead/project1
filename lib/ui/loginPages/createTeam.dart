import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vamos/ui/utils/color.dart';
import 'package:vamos/ui/utils/loginbkground.dart';
import 'package:vamos/widget/customAppBar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vamos/ui/utils/theme.dart';
import 'package:vamos/widget/customBottomNavBar.dart';
import 'package:vamos/widget/inputField.dart';
import 'package:vamos/widget/createteamContainer.dart';

class CreateTeams extends StatefulWidget {
  const CreateTeams({Key? key}) : super(key: key);

  @override
  _CreateTeamsState createState() => _CreateTeamsState();
}

class _CreateTeamsState extends State<CreateTeams> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: sliderGreenActive,
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: Container(
        width: 60.w,
        child: FittedBox(
          child: FloatingActionButton(
            elevation: 0,
            onPressed: () {},
            backgroundColor: KRed,
            child: SizedBox(
              height: 30,
              child: Image.asset(
                "assets/images/FloatingActionButton.png",
                // scale: 30,
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomAppBar(
        height: 50.h,
      ),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.h),
        child: CustomAppBar(),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 10.h),
              height: 250.h,
              child: Stack(
                alignment: AlignmentDirectional.bottomEnd,
                fit: StackFit.expand,
                children: [
                  Positioned(
                    left: -130.w,
                    child: Image.asset(
                      "assets/images/rectangle_1.webp",
                      color: titleText,
                      width: 1.50.sw,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  Positioned(
                    bottom: -60.h,
                    left: 80.w,
                    height: 330.h,
                    width: 330.w,
                    child: Image.asset(
                      'assets/images/group_3.png',
                    ),
                  ),
                  Positioned(
                    top: 10.0.h,
                    left: 120.0.w,
                    child: Container(
                      width: 150.w,
                      child: Text(
                        'Create Team',
                        style: TextStyle(
                          color: sliderGreenActive,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(3)),
              width: 300.w,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    inputField("Team Name", (n) {}),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 15, 0, 5),
                      child: Text(
                        'Team Logo',
                        style: themeData()
                            .textTheme
                            .headline3!
                            .copyWith(color: Colors.grey[400]),
                      ),
                    ),
                    Container(
                      height: 86.h,
                      width: 270.w,
                      color: Color.fromRGBO(249, 249, 249, 1),
                      child: Center(
                          child: Image.asset(
                        "assets/images/add_image_1.webp",
                        height: 28.h,
                        width: 34.w,
                      )),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 15, 0, 5),
                      child: Text(
                        'Request Player',
                        style: themeData()
                            .textTheme
                            .headline3!
                            .copyWith(color: Colors.grey[400]),
                      ),
                    ),
                    Container(
                      height: 86.h,
                      width: 270.w,
                      color: Color.fromRGBO(249, 249, 249, 1),
                      child: Center(
                          child: Image.asset(
                        "assets/images/football_player.webp",
                        color: moneyBox,
                        height: 28.h,
                        width: 34.w,
                      )),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 15, 0, 5),
                      child: Text(
                        'Team Formation',
                        style: themeData()
                            .textTheme
                            .headline3!
                            .copyWith(color: Colors.grey[400]),
                      ),
                    ),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            conttxt('6x6 Team'),
                            conttxt('7x7 Team'),
                          ],
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            conttxt('8x8 Team'),
                            conttxt('11x11 Team')
                          ],
                        ),
                        SizedBox(
                          height: 25.h,
                        ),
                        GestureDetector(
                          onTap: () {
                            
                          },
                          child: Container(
                            width: 85.h,
                            height: 40.w,
                            child: Center(
                              child: Text(
                                'Next',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15.sp,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            decoration: BoxDecoration(
                              color: KRed,
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 40.h,
            )
          ],
        ),
      ),
    );
  }
}
