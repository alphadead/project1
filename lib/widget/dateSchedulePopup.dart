import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vamos/core/service/controller/groundController.dart';
import 'package:vamos/ui/utils/color.dart';
import 'package:vamos/ui/utils/loginbkground.dart';
import 'package:vamos/ui/utils/theme.dart';
import 'package:vamos/widget/formWidgets/inputField.dart';

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

class ScheduleCard extends StatelessWidget {
  ScheduleCard({Key? key, required this.groundName, required this.scheduleDate})
      : super(key: key);
  final DateTime scheduleDate;
  final bool groundName;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<GroundController>(builder: (_groundService) {
      String dateString = "${scheduleDate.day}" +
          (scheduleDate.day == 1
              ? "st"
              : scheduleDate.day == 2
                  ? "nd"
                  : scheduleDate.day == 3
                      ? "rd"
                      : "th") +
          " ${months[scheduleDate.month - 1].substring(0, 3)} ${scheduleDate.year}";
      return AlertDialog(
        contentPadding: EdgeInsets.zero,
        content: Card(
          margin: EdgeInsets.zero,
          elevation: 0,
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            width: 305.w,
            height: 415.h,
            decoration:
                BoxDecoration(borderRadius: BorderRadius.circular(2.5.h)),
            child: SingleChildScrollView(
              padding: EdgeInsets.zero,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Few More Details",
                    style: themeData().textTheme.bodyText1!.copyWith(
                        color: KRed,
                        fontWeight: FontWeight.w600,
                        fontSize: 18.sp),
                  ),
                  groundName
                      ? inputField("Ground Name", (value) {
                          _groundService.groundName = value;
                        }, validate: (arg) {}, keyType: TextInputType.name)
                      : SizedBox(),
                  Container(
                    margin: EdgeInsets.only(top: 20.sp),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Selected date",
                          style: themeData()
                              .textTheme
                              .bodyText1!
                              .copyWith(color: KLightGrey),
                        ),
                        Text(
                          dateString,
                          style: themeData().textTheme.bodyText1!.copyWith(
                              color: KRed, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                  CalenderScheduleRow(
                      title: "Opening Time",
                      isDate: true,
                      defaultDateValue: DateTime(DateTime.now().year)
                          .add(Duration(hours: 5, minutes: 30))),
                  CalenderScheduleRow(
                      title: "Closing Time",
                      isDate: true,
                      defaultDateValue: DateTime(DateTime.now().year)
                          .add(Duration(hours: 11, minutes: 30))),
                  CalenderScheduleRow(
                      title: "Slot Time(Mins)",
                      isDate: true,
                      defaultDateValue: DateTime(DateTime.now().year)
                          .add(Duration(minutes: 30))),
                  Container(
                    margin: EdgeInsets.only(top: 20.sp),
                    child: Row(
                      children: [
                        Text(
                          "Event details",
                          style: themeData()
                              .textTheme
                              .bodyText1!
                              .copyWith(color: KLightGrey),
                        ),
                      ],
                    ),
                  ),
                  TextFormField(
                    minLines: 3,
                    maxLines: 20,
                    onChanged: (value) {
                      _groundService.eventDetails = value;
                    },
                    decoration: InputDecoration(
                      alignLabelWithHint: true,
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      labelText: "Text Goes Here",
                      labelStyle: themeData()
                          .textTheme
                          .bodyText1!
                          .copyWith(color: KLightGrey),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: KLightGrey, width: 1.0),
                          borderRadius: BorderRadius.zero),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: KLightGrey, width: 1.0),
                          borderRadius: BorderRadius.zero),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 20.h, horizontal: 10.w),
                        child: primaryActionButton(
                          color: moneyBox,
                          context: context,
                          onPressed: () {
                            _groundService.clearSchedule();
                            Get.back();
                          },
                          text: "Cancel",
                          width: 100,
                          height: 30,
                          fontSize: 12,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 20.h, horizontal: 10.w),
                        child: primaryActionButton(
                          context: context,
                          onPressed: () {
                            _groundService.updateSchedule();
                            _groundService.clearSchedule();
                            Get.back();
                          },
                          text: "Save",
                          width: 100,
                          height: 30,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}

class CalenderScheduleRow extends StatefulWidget {
  const CalenderScheduleRow({
    Key? key,
    required this.title,
    required this.isDate,
    this.defaultDateValue,
    this.defaultPriceValue,
  }) : super(key: key);
  final String title;
  final bool isDate;
  final DateTime? defaultDateValue;
  final int? defaultPriceValue;
  @override
  _CalenderScheduleRowState createState() => _CalenderScheduleRowState();
}

class _CalenderScheduleRowState extends State<CalenderScheduleRow> {
  DateTime? _currentDateValue;
  int? _currentPriceValue;

  @override
  void initState() {
    _currentDateValue = widget.defaultDateValue;
    _currentPriceValue = widget.defaultPriceValue;
    widget.isDate
        ? updateControllerValue(widget.defaultDateValue)
        : updateControllerValue(widget.defaultPriceValue);
    super.initState();
  }

  void updateControllerValue(var _value) {
    if (widget.title == "Opening Time") {
      WidgetsBinding.instance!.addPostFrameCallback((_) {
        Get.find<GroundController>().setSelectedOpeningTime(_value);
      });
    }
    if (widget.title == "Closing Time") {
      WidgetsBinding.instance!.addPostFrameCallback((_) {
        Get.find<GroundController>().setSelectedClosingTime(_value);
      });
    }
    if (widget.title == "Slot Time(Mins)") {
      WidgetsBinding.instance!.addPostFrameCallback((_) {
        Get.find<GroundController>().setSelectedSlotDuration(_value);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GroundController>(builder: (_groundService) {
      return Container(
        margin: EdgeInsets.only(top: 20.sp),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.title,
              style:
                  themeData().textTheme.bodyText1!.copyWith(color: KLightGrey),
            ),
            Ink(
              decoration: BoxDecoration(
                  color: KRed, borderRadius: BorderRadius.circular(15)),
              width: 90.w,
              height: 30.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    borderRadius: BorderRadius.circular(15),
                    child: Container(
                      height: 30.h,
                      width: 30.h,
                      child: Icon(
                        Icons.remove,
                        size: 13.h,
                        color: Colors.white,
                      ),
                    ),
                    onTap: () {
                      if (widget.isDate) {
                        if (Duration(
                                    hours: _currentDateValue!.hour,
                                    minutes: _currentDateValue!.minute)
                                .compareTo(Duration(hours: 0, minutes: 1)) >
                            0) {
                          setState(() {
                            _currentDateValue = _currentDateValue!
                                .subtract((Duration(minutes: 1)));
                            updateControllerValue(_currentDateValue);
                          });
                        }
                      } else {
                        if (_currentPriceValue! > 0) {
                          setState(() {
                            _currentPriceValue = _currentPriceValue! - 1;
                            updateControllerValue(_currentPriceValue);
                          });
                        }
                      }
                    },
                  ),
                  Text(
                    widget.isDate
                        ? "${_currentDateValue!.hour}:${_currentDateValue!.minute}"
                        : "\$$_currentPriceValue",
                    style: themeData().textTheme.bodyText1!.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 10),
                  ),
                  InkWell(
                    borderRadius: BorderRadius.circular(15),
                    child: Container(
                      height: 30.h,
                      width: 30.h,
                      child: Icon(
                        Icons.add,
                        size: 13.h,
                        color: Colors.white,
                      ),
                    ),
                    onTap: () {
                      if (widget.isDate) {
                        if (Duration(
                                    hours: _currentDateValue!.hour,
                                    minutes: _currentDateValue!.minute)
                                .compareTo(Duration(hours: 23, minutes: 59)) <
                            0) {
                          setState(() {
                            _currentDateValue =
                                _currentDateValue!.add(Duration(minutes: 1));
                          });
                        }
                      } else {
                        if (_currentPriceValue! < 9999) {
                          setState(() {
                            _currentPriceValue = _currentPriceValue! + 1;
                          });
                        }
                      }
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      );
    });
  }
}
