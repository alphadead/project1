import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:vamos/core/service/controller/teamListingController.dart';
import 'package:vamos/ui/utils/utility.dart';

class TeamButton extends StatefulWidget {
  final int? id;
  TeamButton({this.id, Key? key}) : super(key: key);

  @override
  _TeamButtonState createState() => _TeamButtonState();
}

class _TeamButtonState extends State<TeamButton> {
  bool pressed = false;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<TeamListController>(
      builder: (_teamService) => InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () {
          if (!pressed) {
            _teamService.joinTeam(widget.id!);
            setState(() {
              pressed = !pressed;
            });
          } else {
            Utility.showSnackbar(AppLocalizations.of(context)!
                .registeredTeamsPage_alreadyPresentSnackbar);
          }
        },
        child: Center(
          child: pressed == true
              ? Icon(
                  Icons.check,
                  color: Colors.white,
                )
              : Text(
                  AppLocalizations.of(context)!
                      .registeredTeamsPage_joinButtonText,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                      fontSize: 10.sp),
                ),
        ),
      ),
    );
  }
}
