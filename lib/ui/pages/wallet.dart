import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:vamos/core/service/controller/profileController.dart';
import 'package:vamos/ui/utils/color.dart';
import 'package:vamos/ui/utils/theme.dart';
import 'package:vamos/widget/buttons.dart';
import 'package:vamos/widget/customAppBar.dart';
import 'package:vamos/widget/customBottomNavBar.dart';

class WalletPage extends StatefulWidget {
  const WalletPage({Key? key}) : super(key: key);

  @override
  _WalletPageState createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> {
  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      Get.find<ProfileController>().getReferral();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetBuilder<ProfileController>(
        builder: (_profileService) {
          return Directionality(
            textDirection: TextDirection.ltr,
            child: Scaffold(
              appBar: PreferredSize(
                preferredSize: Size.fromHeight(60.h),
                child: CustomAppBar(),
              ),
              floatingActionButton: homeFABBottomNav(),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.miniCenterDocked,
              bottomNavigationBar: CustomBottomAppBar(
                height: 50.h,
              ),
              body: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _profileService.profile?.photo == null ||
                            _profileService.profile?.photo.toString() == ''
                        ? CircleAvatar(
                            radius: 40.h,
                            backgroundImage: AssetImage(
                                'assets/images/placeholder_team_icon.png'))
                        : CircleAvatar(
                            radius: 40.h,
                            backgroundImage: NetworkImage(_profileService
                                .profile!.photo![0]["url"]
                                .toString()),
                          ),
                    SizedBox(
                      height: 35.h,
                    ),
                    Center(
                      child: Text(
                        'Available Balance',
                        style: themeData().textTheme.bodyText1!.copyWith(
                              color: KRed,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                    Text(
                      'KD  ' +
                          (_profileService.referals?.totalEarning.toString() ??
                              ''),
                      style: themeData().textTheme.bodyText1!.copyWith(
                            color: KColorBlack.withOpacity(0.8),
                            fontSize: 25.sp,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    SizedBox(
                      height: 35.h,
                    ),
                    Center(
                      child: Text(
                        'Total Referrals',
                        style: themeData().textTheme.bodyText1!.copyWith(
                              color: KRed,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                    Text(
                      (_profileService.referals?.totalReferrer.toString() ??
                          ''),
                      style: themeData().textTheme.bodyText1!.copyWith(
                            color: KColorBlack.withOpacity(0.8),
                            fontSize: 25.sp,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                           SizedBox(
                      height: 35.h,
                    ),
                    Center(
                      child: Text(
                        'Referral Amount',
                        style: themeData().textTheme.bodyText1!.copyWith(
                              color: KRed,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                    Text('KD  ' +
                      (_profileService.referals?.referAmount.toString() ??
                          ''),
                      style: themeData().textTheme.bodyText1!.copyWith(
                            color: KColorBlack.withOpacity(0.8),
                            fontSize: 25.sp,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
