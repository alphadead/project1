import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vamos/core/service/controller/groundController.dart';
import 'package:vamos/core/service/controller/myTeamController.dart';
import 'package:vamos/ui/utils/color.dart';
import 'package:vamos/widget/customAppBar.dart';
import 'package:vamos/widget/customBottomNavBar.dart';
import 'package:vamos/widget/formWidgets/buttons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vamos/widget/matchWidgets/tabIndicator.dart';

class CreateTeamForMatch extends StatefulWidget {
  const CreateTeamForMatch({Key? key}) : super(key: key);

  @override
  _CreateTeamForMatchState createState() => _CreateTeamForMatchState();
}

class _CreateTeamForMatchState extends State<CreateTeamForMatch> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      Get.find<GroundController>().getPlayerPosition();
      Get.find<GroundController>().getPlayerJoinedListByTeam();
    });
  }

  Widget build(BuildContext context) {
    return GetBuilder<GroundController>(
      builder: (_groundService) => Scaffold(
        resizeToAvoidBottomInset: false,
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
              Padding(
                padding: EdgeInsets.only(top: 10.h, left: 15.w, right: 15.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    tabIndicatorKRed("Select Player"),
                    tabIndicatorKRed("Select Position")
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10.h, left: 5.w, right: 5.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: SizedBox(
                        width: .4.sw,
                        child: DropdownButtonFormField(
                          isExpanded: true,
                          elevation: 25,
                          hint: Text(
                            'Player name',
                            style: TextStyle(color: KLightGrey),
                          ),
                          onChanged: (String? newValue) {
                            print(newValue);
                          },
                          items: List.generate(
                            _groundService.playerJoinedList.length == 0
                                ? 0
                                : _groundService.playerJoinedList.length,
                            (index) {
                              return DropdownMenuItem<String>(
                                value: _groundService.playerJoinedList[index].id
                                    .toString(),
                                child: Text(
                                  _groundService
                                          .playerJoinedList[index].firstName
                                          .toString() +
                                      " " +
                                      _groundService
                                          .playerJoinedList[index].lastName
                                          .toString(),
                                  style:
                                      TextStyle(color: inputText, fontSize: 16),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: SizedBox(
                        width: 0.4.sw,
                        child: DropdownButtonFormField(
                          isExpanded: true,
                          elevation: 25,
                          hint: Text(
                            'Player Position',
                            style: TextStyle(color: KLightGrey),
                          ),
                          onChanged: (String? newValue) {
                            print(newValue);
                          },
                          items: List.generate(
                            _groundService.playerPosition.length,
                            (index) {
                              return DropdownMenuItem<String>(
                                value: _groundService.playerPosition[index]
                                    .toString(),
                                child: Text(
                                  _groundService.playerPosition[index]
                                      .toString(),
                                  style:
                                      TextStyle(color: inputText, fontSize: 16),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
