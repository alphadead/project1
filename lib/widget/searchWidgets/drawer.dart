import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vamos/core/service/controller/searchByController.dart';
import 'package:vamos/ui/utils/color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vamos/ui/utils/theme.dart';

class SearchDrawer extends StatefulWidget {
  List<Map<String, dynamic>> values = [];
  SearchDrawer(this.values);
  @override
  State<StatefulWidget> createState() {
    return _SearchDrawerState();
  }
}

class _SearchDrawerState extends State<SearchDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Container(
                  margin: EdgeInsets.only(right: 10.w, top: 10.h),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: KRed)),
                  child: Icon(
                    Icons.close_outlined,
                    color: KRed,
                  )),
            ),
          ),
          Expanded(
            child: SizedBox(
              height: 100.h,
              child: ListView(
                  children: widget.values
                      .map((e) => Theme(
                            data: ThemeData(
                              checkboxTheme: CheckboxThemeData(
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(color: Colors.black),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                            ),
                            child: new CheckboxListTile(
                              contentPadding: EdgeInsets.only(left: 10),
                              dense: true,
                              activeColor: KRed,
                              controlAffinity: ListTileControlAffinity.leading,
                              title: new Text(
                                e['displayName'],
                                style: e['value'] == false
                                    ? themeData().textTheme.headline5
                                    : themeData().textTheme.headline6,
                              ),
                              value: e['value'],
                              onChanged: (bool? value) {
                                setState(() {
                                  e['value'] = value;

                                  if (value!) {
                                    Get.find<SearchByController>()
                                        .filters
                                        .add(e['key']);
                                  } else {
                                    Get.find<SearchByController>()
                                        .filters
                                        .remove(e['key']);
                                  }
                                });
                              },
                            ),
                          ))
                      .toList()),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 7, bottom: 50.0, right: 15),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      Get.find<SearchByController>()
                          .playerFilters
                          .forEach((element) {
                        element['value'] = false;
                      });
                    });

                    Get.find<SearchByController>().filters.clear();
                  },
                  child: Container(
                    width: 120.h,
                    height: 40.w,
                    child: Center(
                      child: Text(
                        'Clear',
                        style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    decoration: BoxDecoration(
                      color: moneyBox,
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Container(
                      width: 120.h,
                      height: 40.w,
                      child: Center(
                        child: Text(
                          'Apply',
                          style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.bold,
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
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
