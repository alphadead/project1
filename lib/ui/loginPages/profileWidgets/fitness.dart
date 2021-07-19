import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:vamos/core/service/controller/authController.dart';
import 'package:vamos/ui/utils/color.dart';
import 'package:vamos/widget/numvalueContainer.dart';
import 'package:vamos/widget/profileContainer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FitnessDetail extends StatefulWidget {
  const FitnessDetail({Key? key}) : super(key: key);

  @override
  _FitnessDetailState createState() => _FitnessDetailState();
}

class _FitnessDetailState extends State<FitnessDetail> {
  double sliderVal = 180;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
        builder: (_authService) => Container(
              padding: EdgeInsets.only(top: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProfileContainer(
                      title: AppLocalizations.of(context)!
                          .profilePage_fitnessDetail),
                  Container(
                    padding: EdgeInsets.fromLTRB(30, 15, 0, 0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            AgeValueContainer(
                              title:
                                  AppLocalizations.of(context)!.profilePage_age,
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            WeightValueContainer(
                              title: AppLocalizations.of(context)!
                                  .profilePage_weight,
                            ),
                          ],
                        ),
                        Text(
                          AppLocalizations.of(context)!.profilePage_height,
                          style: TextStyle(color: inputText, fontSize: 18.h),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          width: 285.w,
                          color: Color.fromRGBO(249, 249, 249, 1),
                          child: Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 10),
                                child: Text(
                                  sliderVal.toInt().toString() + " cm",
                                  style: TextStyle(
                                    color: headAndIcon,
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(bottom: 5),
                                child: SliderTheme(
                                  data: SliderThemeData(
                                    activeTrackColor: sliderGreenActive,
                                    inactiveTrackColor: sliderGreenInactive,
                                    thumbColor: Color(0xfff05627),
                                  ),
                                  child: Slider(
                                    min: 0,
                                    max: 300,
                                    value: sliderVal,
                                    onChanged: (val) {
                                      setState(() {
                                        sliderVal = val;
                                        _authService.height =
                                            val.toInt().toString();
                                      });
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ));
  }
}
