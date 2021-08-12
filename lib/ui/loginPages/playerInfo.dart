import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multi_image_picker2/multi_image_picker2.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vamos/core/service/controller/authController.dart';
import 'package:vamos/core/service/routes/routeManagement.dart';
import 'package:vamos/ui/utils/color.dart';
import 'package:vamos/ui/utils/loginbkground.dart';
import 'package:vamos/ui/utils/validator.dart';

import 'package:vamos/widget/customAppBar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vamos/ui/utils/theme.dart';
import 'package:vamos/widget/customBottomNavBar.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class PlayerInfo extends StatefulWidget {
  const PlayerInfo({Key? key}) : super(key: key);

  @override
  _PlayerInfoState createState() => _PlayerInfoState();
}

class _PlayerInfoState extends State<PlayerInfo> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
      builder: (_authService) => Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: sliderGreenActive,
        floatingActionButtonLocation:
            FloatingActionButtonLocation.miniCenterDocked,
        floatingActionButton: Container(
          width: 60.w,
          child: FittedBox(
            child: FloatingActionButton(
              elevation: 0,
              onPressed: () {
                Get.toNamed('/homeScreen');
              },
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
          child: CustomAppBar(
            isPencil: true,
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                //margin: EdgeInsets.only(bottom: 10.h),
                height: 300.h,
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
                      bottom: -70.h,
                      left: 20.w,
                      height: 400.h,
                      width: 330.w,
                      child: Image.asset(
                        'assets/images/messi.webp',
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.zero,
                width: 300.w,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(10, 12, 10, 0),
                      child: Center(
                        child: RatingBar.builder(
                          initialRating: 3,
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemBuilder: (context, _) => Transform.scale(
                            scale: 0.8.h,
                            child: Icon(
                              Icons.star_rounded,
                              color: iconColStar,
                            ),
                          ),
                          onRatingUpdate: (rating) {
                            //print(rating);
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CircleAvatar(
                            radius: 25,
                            backgroundImage: AssetImage(
                                'assets/images/placeholder_team_icon.png'),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Lionel Andres Messi',
                                style:
                                    themeData().textTheme.headline1!.copyWith(
                                          color: containerGreen,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 18.sp,
                                        ),
                              ),
                              Text(
                                'Nationality: Argentinian',
                                style:
                                    themeData().textTheme.headline1!.copyWith(
                                          color: KColorBlack,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 12.sp,
                                        ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      color: KLightGrey,
                      height: 20,
                      thickness: 1,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Weight:',
                                style:
                                    themeData().textTheme.headline1!.copyWith(
                                          color: containerGreen,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 12.sp,
                                        ),
                              ),
                              Text(
                                '55',
                                style:
                                    themeData().textTheme.headline1!.copyWith(
                                          color: KColorBlack,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 12.sp,
                                        ),
                              )
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Age:',
                                style:
                                    themeData().textTheme.headline1!.copyWith(
                                          color: containerGreen,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 12.sp,
                                        ),
                              ),
                              Text(
                                '45',
                                style:
                                    themeData().textTheme.headline1!.copyWith(
                                          color: KColorBlack,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 12.sp,
                                        ),
                              )
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Height:',
                                style:
                                    themeData().textTheme.headline1!.copyWith(
                                          color: containerGreen,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 12.sp,
                                        ),
                              ),
                              Text(
                                '1.87 CM',
                                style:
                                    themeData().textTheme.headline1!.copyWith(
                                          color: KColorBlack,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 12.sp,
                                        ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    Divider(
                      color: KLightGrey,
                      height: 20,
                      thickness: 1,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 8, 10, 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Matches\nPlayed:',
                                style:
                                    themeData().textTheme.headline1!.copyWith(
                                          color: containerGreen,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 12.sp,
                                        ),
                              ),
                              Text(
                                '55',
                                style:
                                    themeData().textTheme.headline1!.copyWith(
                                          color: KColorBlack,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 12.sp,
                                        ),
                              ),
                            ],
                          ),
                          Container(
                            width: 120.h,
                            height: 30.w,
                            child: Center(
                              child: Text(
                                'Joined team',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12.sp,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            decoration: BoxDecoration(
                              color: KRed,
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              primaryActionButton(
                  context: context,
                  onPressed: () async {
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    prefs.clear();
                    Get.offAllNamed("/login");
                  },
                  text: "Logout"),
              SizedBox(
                height: 50.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
