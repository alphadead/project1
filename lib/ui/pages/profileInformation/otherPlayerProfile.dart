import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vamos/core/models/joinedTeamListResponse.dart';
import 'package:vamos/core/service/controller/otherPlayerInfoController.dart';
import 'package:vamos/ui/utils/color.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:vamos/ui/utils/loginbkground.dart';
import 'package:vamos/ui/utils/theme.dart';
import 'package:vamos/widget/customAppBar.dart';
import 'package:vamos/widget/customBottomNavBar.dart';
import 'package:vamos/widget/formWidgets/buttons.dart';
import 'package:vamos/widget/formWidgets/inputField.dart';
import 'package:vamos/widget/teamWidgets/playerJoinedTeam.dart';

class OtherPlayerInfo extends StatefulWidget {
  const OtherPlayerInfo({Key? key}) : super(key: key);

  @override
  _OtherPlayerInfoState createState() => _OtherPlayerInfoState();
}

class _OtherPlayerInfoState extends State<OtherPlayerInfo> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<OtherPlayerInfoController>(
      builder: (_playerService) => Scaffold(
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
                          _playerService.profile?.photo?.length ?? 0,
                          (index) => _playerService.profile?.photo == null ||
                                  _playerService.profile?.photo.toString() == ''
                              ? Image.network('')
                              : CircleAvatar(
                                  radius: 150.h,
                                  backgroundImage: NetworkImage(_playerService
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
                              backgroundImage: _playerService
                                              .profile?.teamLogo ==
                                          null ||
                                      _playerService.profile?.teamLogo == ''
                                  ? NetworkImage('')
                                  : NetworkImage(
                                      _playerService.profile?.teamLogo ?? '')),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                _playerService.profile?.first_name ?? "No data",
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
                                    (_playerService.profile!.nationality ??
                                        "No data"),
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
                                    ": ",
                                style:
                                    themeData().textTheme.headline1!.copyWith(
                                          color: containerGreen,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 12.sp,
                                        ),
                              ),
                              Text(
                                (_playerService.profile?.weight! ?? "No data"),
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
                                (_playerService.profile?.age ?? "No data"),
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
                                (_playerService.profile?.height ?? "No data"),
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
                      padding: const EdgeInsets.fromLTRB(0, 8, 10, 12),
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
                                _playerService.profile?.noOfMatchPayed
                                        .toString() ??
                                    "No data",
                                style:
                                    themeData().textTheme.headline1!.copyWith(
                                          color: KColorBlack,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 12.sp,
                                        ),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Own Team" + ':',
                                style:
                                    themeData().textTheme.headline1!.copyWith(
                                          color: containerGreen,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 12.sp,
                                        ),
                              ),
                              Text(
                                _playerService.profile?.teamName ?? "No data",
                                style:
                                    themeData().textTheme.headline1!.copyWith(
                                          color: KColorBlack,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 12.sp,
                                        ),
                              ),
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
                      padding: EdgeInsets.fromLTRB(54, 12, 10, 0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                'Member of Team',
                                style:
                                    themeData().textTheme.headline1!.copyWith(
                                          color: containerGreen,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 12.sp,
                                        ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 150.h,
                            child: _playerService
                                        .profile?.memberOfTeams?.length !=
                                    0
                                ? ListView.builder(
                                    itemCount: _playerService
                                        .profile?.memberOfTeams?.length,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, index) {
                                      return Container(
                                        margin: EdgeInsets.only(top: 20.h),
                                        child: Card(
                                          elevation: 4,
                                          child: Padding(
                                            padding: EdgeInsets.only(
                                                left: 18.w, right: 18.w),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Padding(
                                                  padding:
                                                      EdgeInsets.only(top: 8.0),
                                                  child: CircleAvatar(
                                                    radius: 25,
                                                    backgroundImage: _playerService
                                                                    .profile
                                                                    ?.memberOfTeams![
                                                                        index]
                                                                    .teamLogo ==
                                                                null ||
                                                            _playerService
                                                                    .profile
                                                                    ?.memberOfTeams![
                                                                        index]
                                                                    .teamLogo ==
                                                                ''
                                                        ? NetworkImage('')
                                                        : NetworkImage(
                                                            _playerService
                                                                    .profile
                                                                    ?.memberOfTeams![
                                                                        index]
                                                                    .teamLogo ??
                                                                ''),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      EdgeInsets.only(top: 8.h),
                                                  child: Text(_playerService
                                                          .profile
                                                          ?.memberOfTeams![
                                                              index]
                                                          .teamName ??
                                                      "No data"),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    })
                                : Container(
                                    child: Center(
                                    child: Text(
                                      " Not a member",
                                      style: themeData()
                                          .textTheme
                                          .headline1!
                                          .copyWith(
                                            color: KColorBlack,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 14.sp,
                                          ),
                                    ),
                                  )),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 40.h),
                            child: Text(
                              'Comment',
                              style: themeData().textTheme.headline1!.copyWith(
                                    color: containerGreen,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12.sp,
                                  ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 5.h),
                            child: inputField("comment", (value) {},
                                validate: (arg) {},
                                keyType: TextInputType.emailAddress),
                          ),
                          Container(
                            height: 40.h,
                            margin: EdgeInsets.only(top: 40.h, right: 12.w),
                            child: Center(
                              child: Text(
                                "Submit",
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
                    SizedBox(
                      height: 50.h,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 200.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
