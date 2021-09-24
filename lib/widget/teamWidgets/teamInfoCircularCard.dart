import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vamos/ui/utils/color.dart';
import 'package:vamos/ui/utils/theme.dart';

class TeamInfoCircularCard extends StatelessWidget {
  final String? title;
  final String? image;
  final bool isAsset;
  const TeamInfoCircularCard({Key? key, this.image, this.title, this.isAsset = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.sp),
          ),
          child: Container(
            height: 50,
            width: 50,
            child: isAsset? Image.asset(image.toString()): Image.network(image.toString()),
          ),
        ),
        Text(
          title.toString(),
          style: themeData()
              .textTheme
              .headline4!
              .copyWith(color: KRed, fontSize: 10.sp),
        )
      ],
    );
  }
}
