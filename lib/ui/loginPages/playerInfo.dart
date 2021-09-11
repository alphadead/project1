import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vamos/core/service/controller/profileController.dart';
import 'package:vamos/ui/utils/color.dart';
import 'package:vamos/ui/utils/loginbkground.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:vamos/widget/formWidgets/buttons.dart';

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
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback(
        (_) => Get.find<ProfileController>().getProfileData());
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(builder: (_profileService) {
      return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: sliderGreenActive,
        floatingActionButtonLocation:
            FloatingActionButtonLocation.miniCenterDocked,
        floatingActionButton: homeFABBottomNav(),
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
                      child: CarouselSlider(
                        options: CarouselOptions(
                          autoPlay: true,
                          aspectRatio: 0.4,
                          viewportFraction: 1,
                          enlargeCenterPage: true,
                        ),
                        items: List.generate(
                          _profileService.profile?.photo?.length ?? 0,
                          (index) => _profileService.profile?.photo == null ||
                                  _profileService.profile?.photo.toString() ==
                                      ''
                              ? Image.network('')
                              : CircleAvatar(
                                  radius: 150.h,
                                  backgroundImage: NetworkImage(_profileService
                                      .profile!.photo![index]["url"]
                                      .toString()),
                                ),
                        ),
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
                          onRatingUpdate: (rating) {},
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
                            backgroundImage: _profileService.profile?.photo ==
                                        null ||
                                    _profileService.profile?.photo.toString() ==
                                        ''
                                ? NetworkImage('')
                                : NetworkImage(
                                    _profileService.profile!.photo.toString()),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                (_profileService.profile?.nick_name != null &&
                                        _profileService.profile?.nick_name !=
                                            "")
                                    ? _profileService.profile?.nick_name ?? ""
                                    : ((_profileService.profile?.first_name ??
                                            "") +
                                        (_profileService.profile?.last_name ??
                                            "")),
                                style:
                                    themeData().textTheme.headline1!.copyWith(
                                          color: containerGreen,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 18.sp,
                                        ),
                              ),
                              Text(
                                AppLocalizations.of(context)!
                                        .profilePage_nationality +
                                    ': ${_profileService.profile?.nationality ?? ""}',
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
                                AppLocalizations.of(context)!
                                        .profilePage_weight +
                                    ":",
                                style:
                                    themeData().textTheme.headline1!.copyWith(
                                          color: containerGreen,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 12.sp,
                                        ),
                              ),
                              Text(
                                '${_profileService.profile?.weight ?? ""}',
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
                                AppLocalizations.of(context)!.profilePage_age +
                                    ':',
                                style:
                                    themeData().textTheme.headline1!.copyWith(
                                          color: containerGreen,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 12.sp,
                                        ),
                              ),
                              Text(
                                '${_profileService.profile?.age ?? ""}',
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
                                AppLocalizations.of(context)!
                                        .profilePage_height +
                                    ':',
                                style:
                                    themeData().textTheme.headline1!.copyWith(
                                          color: containerGreen,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 12.sp,
                                        ),
                              ),
                              Text(
                                '${_profileService.profile?.height ?? ""} CM',
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
                                AppLocalizations.of(context)!.matches_played +
                                    ':',
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
                          Center(
                            child: GestureDetector(
                              onTap: () {
                                Get.toNamed('/joinedTeamsList');
                              },
                              child: Container(
                                width: 120.h,
                                height: 30.w,
                                child: Center(
                                  child: Text(
                                    AppLocalizations.of(context)!.joined_team,
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
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),      
              SizedBox(
                height: 50.h,
              ),
            ],
          ),
        ),
      );
    });
  }
}
