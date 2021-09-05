import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vamos/core/service/controller/groundController.dart';
import 'package:vamos/ui/utils/color.dart';
import 'package:vamos/ui/utils/theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vamos/widget/dateSchedulePopup.dart';

class TimeSlots extends StatefulWidget {
  const TimeSlots({Key? key, this.timeslots}) : super(key: key);

  final List<dynamic>? timeslots;
  @override
  _TimeSlotsState createState() => _TimeSlotsState();
}

class _TimeSlotsState extends State<TimeSlots> {
  String dropdownValue = months[DateTime.now().month - 1];
  int calenderStartingDate = DateTime.now().day;
  int? selectedIndex;
  late bool isSelected = false;
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
                        "Available slots",
                        style: themeData().textTheme.bodyText1!.copyWith(
                              color: profileContainerColor,
                              fontSize: 13.sp,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Container(
                    height: 65,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: widget.timeslots?.length,
                      itemBuilder: (context, index) {
                        isSelected = _groundService.selectedIndices.contains(index);
                        return Stack(
                          children: [
                            Container(
                              margin: EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 3),
                              child: Ink(
                                width: 45.w,
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8.0)),
                                    color: isSelected ? KRed : Colors.white,
                                    border: isSelected
                                        ? Border.all(color: Colors.white)
                                        : Border.all(color: Colors.black26)),
                                child: InkWell(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8.0)),
                                  onTap: () {
                                    _groundService.selectSlot(index);
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.all(8),
                                    child: Center(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            widget.timeslots?[index],
                                            style: themeData()
                                                .textTheme
                                                .bodyText1!
                                                .copyWith(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold,
                                                  color: isSelected
                                                      ? Colors.white
                                                      : Colors.black,
                                                ),
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
}
