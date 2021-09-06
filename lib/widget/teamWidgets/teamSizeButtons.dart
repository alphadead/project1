import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vamos/core/service/controller/authController.dart';
import 'package:vamos/ui/utils/color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../createteamContainer.dart';

class TeamSizeButtonGrid extends StatefulWidget {
  const TeamSizeButtonGrid({Key? key}) : super(key: key);

  @override
  _TeamSizeButtonGridState createState() => _TeamSizeButtonGridState();
}

class _TeamSizeButtonGridState extends State<TeamSizeButtonGrid> {
  int currentSelectedSize = 6;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
      builder: (_authservice) => Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    _authservice.teamSize = "6";
                    currentSelectedSize = 6;
                  });
                },
                child: TeamSizeButton(currentSelectedSize, 6),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    _authservice.teamSize = "7";
                    currentSelectedSize = 7;
                  });
                },
                child: TeamSizeButton(currentSelectedSize, 7),
              ),
            ],
          ),
          SizedBox(
            height: 8.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    _authservice.teamSize = "8";
                    currentSelectedSize = 8;
                  });
                },
                child: TeamSizeButton(currentSelectedSize, 8),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    _authservice.teamSize = "11";
                    currentSelectedSize = 11;
                  });
                },
                child: TeamSizeButton(currentSelectedSize, 11),
              ),
            ],
          ),
          SizedBox(
            height: 25.h,
          ),
        ],
      ),
    );
  }
}
