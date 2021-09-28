import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multi_image_picker2/multi_image_picker2.dart';
import 'package:vamos/core/service/controller/authController.dart';
import 'package:vamos/ui/utils/color.dart';
import 'package:vamos/ui/utils/validator.dart';
import 'package:vamos/widget/formWidgets/buttons.dart';
import 'package:vamos/widget/customAppBar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vamos/ui/utils/theme.dart';
import 'package:vamos/widget/customBottomNavBar.dart';
import 'package:vamos/widget/formWidgets/inputField.dart';
import 'package:vamos/widget/teamWidgets/teamSizeButtons.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CreateTeams extends StatefulWidget {
  const CreateTeams({Key? key}) : super(key: key);

  @override
  _CreateTeamsState createState() => _CreateTeamsState();
}

class _CreateTeamsState extends State<CreateTeams> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
      builder: (_authService) => Scaffold(
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
                          AppLocalizations.of(context)!.create_team,
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
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(3)),
                width: 300.w,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      inputField(AppLocalizations.of(context)!.team_name, (value) {
                        _authService.teamName = value;
                      }, validate: (arg) {
                        arg = _authService.teamName;
                        if (ValidateFeild().isValidateName(arg)) {
                          return null;
                        } else {
                          return AppLocalizations.of(context)!.validation_name;
                        }
                      }, keyType: TextInputType.name),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 15, 0, 5),
                        child: Text(
                          AppLocalizations.of(context)!.team_logo,
                          style: themeData()
                              .textTheme
                              .headline3!
                              .copyWith(color: Colors.grey[400]),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          _authService.loadAssets(isSingleImage: true);
                        },
                        child: Container(
                          height: 86.h,
                          width: 270.w,
                          color: Color.fromRGBO(249, 249, 249, 1),
                          child: Center(
                            child: _authService.teamLogo.isEmpty
                                ? Image.asset(
                                    "assets/images/add_image_1.webp",
                                    height: 28.h,
                                    width: 34.w,
                                  )
                                : AssetThumb(
                                    asset: _authService.teamLogo[0],
                                    width: 130,
                                    height: 130),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 86.h,
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 15, 0, 5),
                        child: Text(
                          AppLocalizations.of(context)!.team_formation,
                          style: themeData()
                              .textTheme
                              .headline3!
                              .copyWith(color: Colors.grey[400]),
                        ),
                      ),
                      Column(
                        children: [
                          TeamSizeButtonGrid(),
                          GestureDetector(
                            onTap: () {
                              _authService.createTeam();
                            },
                            child: Container(
                              width: 85.h,
                              height: 40.w,
                              child: Center(
                                child: Text(
                                  AppLocalizations.of(context)!.next,
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
      ),
    );
  }
}
