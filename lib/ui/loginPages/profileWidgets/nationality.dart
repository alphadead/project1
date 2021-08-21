import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:vamos/core/service/controller/authController.dart';
import 'package:vamos/core/service/controller/profileController.dart';
import 'package:vamos/ui/utils/color.dart';
import 'package:vamos/widget/profileContainer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Nationality extends StatefulWidget {
  const Nationality({Key? key}) : super(key: key);

  @override
  _NationalityState createState() => _NationalityState();
}

class _NationalityState extends State<Nationality> {
  String? dropdownValue = 'India';

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback(
      (_) {
        dropdownValue =
            Get.find<ProfileController>().profile?.nationality ?? 'India';
        Get.find<AuthController>().nationality = dropdownValue.toString();
      },
    );
  }

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
                          .profilePage_nationality),
                  Container(
                    padding: EdgeInsets.fromLTRB(30, 15, 0, 0),
                    child: Container(
                      padding: EdgeInsets.all(12),
                      color: Color.fromRGBO(249, 249, 249, 1),
                      child: DropdownButton<String>(
                        isDense: true,
                        icon: Image.asset(
                          "assets/images/down_arrow_3.webp",
                          width: 16.sp,
                        ),
                        underline: SizedBox(),
                        value: dropdownValue,
                        hint: Container(
                          margin: EdgeInsets.only(right: 200.w),
                          child: Text(
                            AppLocalizations.of(context)!.profilePage_select,
                            style: TextStyle(
                                color: inputText,
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownValue = newValue;
                            _authService.nationality = newValue.toString();
                          });
                        },
                        items: <String>[
                          'Florida',
                          'India',
                          'England',
                          'Santorini'
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: TextStyle(color: inputText, fontSize: 16),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  )
                ],
              ),
            ));
  }
}
