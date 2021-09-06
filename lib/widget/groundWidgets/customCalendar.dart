import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:vamos/core/service/controller/groundController.dart';
import 'package:vamos/ui/utils/color.dart';
import 'package:vamos/ui/utils/theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vamos/widget/dateSchedulePopup.dart';
import 'package:intl/intl.dart' as intl;

List<String> months = [
  'January',
  'February',
  'March',
  'April',
  'May',
  'June',
  'July',
  'August',
  'September',
  'October',
  'November',
  'December'
];

class CustomCalender extends StatefulWidget {
  const CustomCalender(
      {Key? key,
      required this.isVisibleControllerTrue,
      required this.isVisibleControllerFalse,
      this.viewGroundProfile = false,
      this.createMatch = false})
      : super(key: key);
  final Function isVisibleControllerTrue;
  final Function isVisibleControllerFalse;
  final bool viewGroundProfile;
  final bool createMatch;
  @override
  _CustomCalenderState createState() => _CustomCalenderState();
}

class _CustomCalenderState extends State<CustomCalender> {
  String dropdownValue = months[DateTime.now().month - 1];
  int calenderStartingDate = DateTime.now().day;
  int? selectedIndex;
  late bool isSelected;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<GroundController>(
      builder: (_groundService) {
        return Card(
          child: Container(
            height: 130.h,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(12, 8, 15, 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Calendar",
                        style: themeData().textTheme.bodyText1!.copyWith(
                              color: profileContainerColor,
                              fontSize: 13.sp,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      DropdownButton<String>(
                        value: dropdownValue,
                        icon: const Icon(
                          Icons.arrow_drop_down,
                          color: KRed,
                        ),
                        iconSize: 24,
                        elevation: 16,
                        style: themeData().textTheme.bodyText1!.copyWith(
                              color: profileContainerColor,
                              fontSize: 13.sp,
                              fontWeight: FontWeight.bold,
                            ),
                        underline: Container(
                          height: 0,
                        ),
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownValue = newValue!;
                            selectedIndex = null;
                            _groundService.selectedDate = null;
                            if (months.indexOf(dropdownValue) + 1 ==
                                DateTime.now().month) {
                              calenderStartingDate = DateTime.now().day;
                            } else {
                              calenderStartingDate = 1;
                            }
                            widget.isVisibleControllerFalse();
                          });
                        },
                        items: <String>[
                          months[DateTime.now().month - 1],
                          months[DateTime.now().month]
                        ].map<DropdownMenuItem<String>>((String val) {
                          return DropdownMenuItem<String>(
                            value: val,
                            child: Text(val),
                          );
                        }).toList(),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Container(
                    height: 65,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: DateTime(DateTime.now().year,
                                  months.indexOf(dropdownValue) + 1, 0)
                              .day -
                          calenderStartingDate +
                          1,
                      itemBuilder: (context, index) {
                        DateTime thisDate = DateTime(
                          DateTime.now().year,
                          months.indexOf(dropdownValue) + 1,
                          index + calenderStartingDate,
                        );
                        bool isScheduled =
                            _groundService.checkIsScheduled(thisDate);
                        widget.viewGroundProfile
                            ? isSelected = true
                            : isSelected = selectedIndex == index;
                        return Stack(
                          children: [
                            isScheduled
                                ? Positioned(
                                    right: 0,
                                    top: 0,
                                    child: Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        Container(
                                          width: 19,
                                          height: 19,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(11.5),
                                            color: Colors.white,
                                          ),
                                        ),
                                        Icon(
                                          Icons.check_circle_rounded,
                                          size: 23,
                                          color: containerGreen,
                                        ),
                                      ],
                                    ),
                                  )
                                : SizedBox(),
                            Container(
                              margin: EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 3),
                              child: Ink(
                                width: 45.w,
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8.0)),
                                    color: isSelected && isScheduled
                                        ? KRed
                                        : Colors.white,
                                    border: isSelected && isScheduled
                                        ? Border.all(color: Colors.white)
                                        : Border.all(color: Colors.black26)),
                                child: InkWell(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8.0)),
                                  onTap: widget.viewGroundProfile
                                      ? () {}
                                      : widget.createMatch
                                          ? () {
                                            selectedIndex = index;
                                              _groundService.groundAvailability(
                                                  DateFormat('yyyy-MM-dd')
                                                      .format(thisDate)
                                                      .toString());
                                            }
                                          : () {
                                              onDateSelect(index, isScheduled,
                                                  _groundService, thisDate);
                                            },
                                  child: Padding(
                                    padding: EdgeInsets.all(8),
                                    child: Center(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            "${intl.DateFormat('EEEE').format(DateTime(DateTime.now().year, months.indexOf(dropdownValue) + 1, index + calenderStartingDate)).substring(0, 3)}",
                                            style: themeData()
                                                .textTheme
                                                .bodyText1!
                                                .copyWith(
                                                    fontSize: 10,
                                                    fontWeight: FontWeight.bold,
                                                    color: isSelected &&
                                                            isScheduled
                                                        ? Colors.white
                                                        : Colors.black),
                                          ),
                                          Text(
                                            "${index + calenderStartingDate}",
                                            style: themeData()
                                                .textTheme
                                                .bodyText1!
                                                .copyWith(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.bold,
                                                    color: isSelected &&
                                                            isScheduled
                                                        ? Colors.white
                                                        : Colors.black),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  void onDateSelect(
      int index, bool isScheduled, GroundController _groundService, thisDate) {
    setState(() {
      selectedIndex = index;
      isSelected = true;
      isScheduled
          ? widget.isVisibleControllerTrue()
          : widget.isVisibleControllerFalse();
    });
    _groundService.selectedDate = thisDate;
    !isScheduled
        ? showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return ScheduleCard(
                groundName: false,
                scheduleDate: DateTime(
                    DateTime.now().year,
                    months.indexOf(dropdownValue) + 1,
                    index + calenderStartingDate),
              );
            },
          )
        : print("");
  }
}
