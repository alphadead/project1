import 'package:flutter/material.dart';
import 'package:vamos/widget/customAppBar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MatchDetails extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MatchDetailsState();
  }
}

class _MatchDetailsState extends State<MatchDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.h),
        child: CustomAppBar(),
      ),
    );
  }
}
