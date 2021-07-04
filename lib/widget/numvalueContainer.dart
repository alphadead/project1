import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:vamos/core/service/controller/authController.dart';
import 'package:vamos/ui/utils/color.dart';

class WeightValueContainer extends StatefulWidget {
  final String title;
  const WeightValueContainer({Key? key, required this.title}) : super(key: key);

  @override
  _WeightValueContainerState createState() => _WeightValueContainerState();
}

class _WeightValueContainerState extends State<WeightValueContainer> {
  int val = 18;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
        builder: (_authService) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  this.widget.title.toString(),
                  style: TextStyle(
                      color: profileContainerColor,
                      fontSize: 17,
                      fontWeight: FontWeight.w500),
                ),
                Ink(
                  color: Color.fromRGBO(249, 249, 249, 1),
                  child: Container(
                    width: 120.w,
                    height: 85.h,
                    //color: Color.fromRGBO(249, 249, 249, 1),
                    //margin: EdgeInsets.only(top: 0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          val.toString(),
                          style: TextStyle(
                              color: headAndIcon,
                              fontSize: 20,
                              fontWeight: FontWeight.w900),
                        ),
                        Container(
                          padding: EdgeInsets.only(bottom: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Ink(
                                width: 27,
                                height: 27,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: sliderGreenActive,
                                ),
                                child: InkWell(
                                  borderRadius: BorderRadius.circular(25),
                                  onTap: () {
                                    setState(() {
                                      if (val > 0) {
                                        val--;
                                      }
                                      _authService.weight = val.toString();
                                    });
                                  },
                                  child: Icon(
                                    Icons.remove,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                ),
                              ),
                              Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 7)),
                              Ink(
                                width: 27,
                                height: 27,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: sliderGreenActive,
                                ),
                                child: InkWell(
                                  borderRadius: BorderRadius.circular(25),
                                  onTap: () {
                                    setState(() {
                                      val++;
                                    });
                                    _authService.weight = val.toString();
                                  },
                                  child: Icon(
                                    Icons.add,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ));
  }
}

class AgeValueContainer extends StatefulWidget {
  final String title;
  const AgeValueContainer({Key? key, required this.title}) : super(key: key);

  @override
  _AgeValueContainerState createState() => _AgeValueContainerState();
}

class _AgeValueContainerState extends State<AgeValueContainer> {
  int val = 18;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
        builder: (_authService) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  this.widget.title.toString(),
                  style: TextStyle(
                      color: profileContainerColor,
                      fontSize: 17,
                      fontWeight: FontWeight.w500),
                ),
                Ink(
                  color: Color.fromRGBO(249, 249, 249, 1),
                  child: Container(
                    width: 120.w,
                    height: 85.h,
                    //color: Color.fromRGBO(249, 249, 249, 1),
                    //margin: EdgeInsets.only(top: 0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          val.toString(),
                          style: TextStyle(
                              color: headAndIcon,
                              fontSize: 20,
                              fontWeight: FontWeight.w900),
                        ),
                        Container(
                          padding: EdgeInsets.only(bottom: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Ink(
                                width: 27,
                                height: 27,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: sliderGreenActive,
                                ),
                                child: InkWell(
                                  borderRadius: BorderRadius.circular(25),
                                  onTap: () {
                                    setState(() {
                                      if (val > 0) {
                                        val--;
                                      }
                                      _authService.age = val.toString();
                                    });
                                  },
                                  child: Icon(
                                    Icons.remove,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                ),
                              ),
                              Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 7)),
                              Ink(
                                width: 27,
                                height: 27,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: sliderGreenActive,
                                ),
                                child: InkWell(
                                  borderRadius: BorderRadius.circular(25),
                                  onTap: () {
                                    setState(() {
                                      val++;
                                    });
                                    _authService.age = val.toString();
                                  },
                                  child: Icon(
                                    Icons.add,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ));
  }
}
