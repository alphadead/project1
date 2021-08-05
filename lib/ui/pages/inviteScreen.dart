import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:share/share.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vamos/core/service/controller/inviteController.dart';
import 'package:vamos/ui/utils/color.dart';
import 'package:vamos/ui/utils/loginbkground.dart';
import 'package:vamos/ui/utils/theme.dart';
import 'package:vamos/ui/utils/utility.dart';
import 'package:vamos/widget/invitePageWidget.dart';
import 'package:vamos/widget/localeFloatingActionButtonDebug.dart';
import 'package:vamos/widget/loginpageStack.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class InviteScreen extends StatelessWidget {
  const InviteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<InviteController>(
        builder: (_inviteController) => Directionality(
              textDirection: TextDirection.ltr,
              child: Scaffold(
                floatingActionButton: LocaleFloatingActionButton(),
                body: SafeArea(
                    child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      LoginPageStack(
                        heading: AppLocalizations.of(context)!.invitePage_title,
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
                        margin:
                            EdgeInsets.only(top: 10.h, left: 23.w, right: 23.w),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            color: moneyBox),
                        child: Row(
                          children: [
                            Container(
                              width: 50.w,
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: 12.w, top: 5.h, bottom: 5.h),
                                child: Image.asset(
                                  "assets/images/money.webp",
                                  scale: 3.35,
                                ),
                              ),
                            ),
                            Container(
                              width: .7.sw,
                              child: Padding(
                                padding:
                                    EdgeInsets.only(left: 10.w, right: 10.w),
                                child: Text(
                                  AppLocalizations.of(context)!
                                      .invitePage_rewardInfo,
                                  style: themeData().textTheme.headline2,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 20.h),
                        child: Row(
                          children: [
                            Padding(
                                padding: EdgeInsets.only(left: 45.w),
                                child: circleIcons(
                                    "assets/images/high_five.webp")),
                            Expanded(
                                child: Container(
                              child: Divider(
                                color: sliderGreenActive,
                                thickness: 1,
                              ),
                            )),
                            Padding(
                              padding: EdgeInsets.only(right: 45.w),
                              child: circleIcons("assets/images/surprise.webp"),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 40.w),
                              child: Container(
                                width: .3.sw,
                                child: Text(
                                  AppLocalizations.of(context)!
                                      .invitePage_inviteYourFriends,
                                  style: themeData()
                                      .textTheme
                                      .headline2!
                                      .copyWith(
                                          color: KColorBlack,
                                          fontWeight: FontWeight.w400),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: 40.w),
                              child: Container(
                                width: .3.sw,
                                child: Text(
                                  AppLocalizations.of(context)!
                                      .invitePage_getRewarded,
                                  style: themeData()
                                      .textTheme
                                      .headline2!
                                      .copyWith(
                                          color: KColorBlack,
                                          fontWeight: FontWeight.w400),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 25.h),
                        child: Text(
                          AppLocalizations.of(context)!
                              .invitePage_yourReferralCode,
                          style: themeData()
                              .textTheme
                              .headline1!
                              .copyWith(color: KLightGrey),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Utility.showError(AppLocalizations.of(context)!
                              .invitePage_textCopied);
                          Clipboard.setData(ClipboardData(
                            text: _inviteController.inviteCode,
                          ));
                        },
                        child: Container(
                          margin: EdgeInsets.only(top: 10.h),
                          child: DottedBorder(
                              strokeWidth: 1,
                              color: kLogoColor2,
                              child: Container(
                                margin: EdgeInsets.only(
                                    top: 10.h,
                                    left: 40.w,
                                    right: 40.w,
                                    bottom: 10.h),
                                child: Text(
                                  _inviteController.inviteCode,
                                  style: themeData()
                                      .textTheme
                                      .headline1!
                                      .copyWith(
                                          color: KColorBlack,
                                          fontWeight: FontWeight.bold),
                                ),
                              )),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10.h),
                        child: Text(
                          AppLocalizations.of(context)!.invitePage_tapToCopy,
                          style: themeData()
                              .textTheme
                              .headline2!
                              .copyWith(color: sliderGreenActive),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 20.h),
                        child: primaryActionButton(
                            context: context,
                            onPressed: () {
                              _inviteController.onShare();
                            },
                            text: AppLocalizations.of(context)!
                                .invitePage_referNowButtonText),
                      ),
                      SizedBox(
                        height: 30.h,
                      )
                    ],
                  ),
                )),
              ),
            ));
  }
}
