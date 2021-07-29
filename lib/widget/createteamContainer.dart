import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vamos/core/service/controller/authController.dart';
import 'package:vamos/ui/utils/color.dart';
import 'package:vamos/ui/utils/loginbkground.dart';
import 'package:vamos/widget/customAppBar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vamos/ui/utils/theme.dart';

// class TeamSizeButton extends StatefulWidget {
//   final int? teamSize;
//   const TeamSizeButton({Key? key, required this.teamSize}) : super(key: key);

//   @override
//   _TeamSizeButtonState createState() => _TeamSizeButtonState();
// }

// class _TeamSizeButtonState extends State<TeamSizeButton> {
//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<AuthController>(
//       builder: (_authservice) => GestureDetector(
//         onTap: () {
//           setState(() {
//             _authservice.teamSize = widget.teamSize.toString();
//           });
//         },
//         child: Container(
//           decoration: BoxDecoration(
//               color: _authservice.teamSize != widget.teamSize.toString()
//                   ? moneyBox
//                   : sliderGreenActive,
//               borderRadius: BorderRadius.circular(3)),
//           width: 125.w,
//           height: 20.h,
//           child: Center(
//               child: Text(
//             "${widget.teamSize} x ${widget.teamSize} Team",
//             style: themeData().textTheme.headline3,
//           )),
//         ),
//       ),
//     );
//   }
// }

Widget TeamSizeButton(int currentSize, int _teamSize) {
  return Container(
    decoration: BoxDecoration(
        color: currentSize == _teamSize ? sliderGreenActive : moneyBox,
        borderRadius: BorderRadius.circular(3)),
    width: 125.w,
    height: 20.h,
    child: Center(
        child: Text(
      "$_teamSize x $_teamSize Team",
      style: themeData().textTheme.headline3,
    )),
  );
}
