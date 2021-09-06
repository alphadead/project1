import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vamos/core/models/groundAvailability.dart';
import 'package:vamos/core/service/controller/groundController.dart';
import 'package:vamos/ui/utils/color.dart';
import 'package:vamos/ui/utils/theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vamos/widget/dateSchedulePopup.dart';

class TimeSlots extends StatefulWidget {
  const TimeSlots({Key? key, this.timeslots}) : super(key: key);

  final List<Datum>? timeslots;
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
                widget.timeslots?.length == 0
                    ? Padding(
                        padding: const EdgeInsets.all(8),
                        child:
                            Text("No Slots available, try changing the date!"),
                      )
                    : Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Container(
                          height: 65,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: widget.timeslots?.length,
                            itemBuilder: (context, index) {
                              isSelected = _groundService.selectedIndices
                                  .contains(index);
                              return Stack(
                                children: [
                                  Container(
                                    margin: EdgeInsets.symmetric(
                                        vertical: 5, horizontal: 3),
                                    child: Ink(
                                      width: 45.w,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(8.0)),
                                          color:
                                              isSelected ? KRed : Colors.white,
                                          border: isSelected
                                              ? Border.all(color: Colors.white)
                                              : Border.all(
                                                  color: Colors.black26)),
                                      child: InkWell(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(8.0)),
                                        onTap: () {
                                          _groundService.selectSlot(index);
                                        },
                                        child: Padding(
                                          padding: EdgeInsets.all(4),
                                          child: Center(
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Text(
                                                  "${widget.timeslots?[index].slotStartTime} - ${widget.timeslots?[index].slotEndTime}",
                                                  style: themeData()
                                                      .textTheme
                                                      .bodyText1!
                                                      .copyWith(
                                                        fontSize: 10,
                                                        fontWeight:
                                                            FontWeight.bold,
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
