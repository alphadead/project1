import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vamos/core/service/controller/addsController.dart';
import 'package:vamos/ui/utils/color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vamos/ui/utils/theme.dart';
import 'package:vamos/widget/addsOptionsContainer.dart';
import 'package:vamos/widget/customAppBar.dart';
import 'package:vamos/widget/customBottomNavBar.dart';

class AddandOptions extends StatelessWidget {
  const AddandOptions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetBuilder<AddsController>(
        builder: (_addService) => Directionality(
          textDirection: TextDirection.ltr,
          child: Scaffold(
            floatingActionButtonLocation:
                FloatingActionButtonLocation.miniCenterDocked,
            floatingActionButton: Container(
              width: 60.w,
              child: FittedBox(
                child: FloatingActionButton(
                  elevation: 0,
                  onPressed: () {},
                  backgroundColor: KRed,
                  child: SizedBox(
                    height: 30,
                    child: Image.asset(
                      "assets/images/FloatingActionButton.png",
                      // scale: 30,
                    ),
                  ),
                ),
              ),
            ),
            bottomNavigationBar: CustomBottomAppBar(
              height: 50.h,
            ),
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(60.h),
              child: CustomAppBar(),
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  CarouselSlider(
                    items: _addService.listAdds
                        .map((item) => Container(
                              child: Center(child: item),
                            ))
                        .toList(),
                    options: CarouselOptions(
                        scrollDirection: Axis.horizontal, autoPlay: true),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                    child: GridView.count(
                      crossAxisSpacing: 5.w,
                      physics: ScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      crossAxisCount: 2,
                      children: [
                        logoContainer('assets/images/team_logo.webp', 'Team'),
                        logoContainer(
                            'assets/images/player_logo.webp', 'Player'),
                        logoContainer(
                          'assets/images/create_logo.webp',
                          'Create Own Team',
                        ),
                        logoContainer(
                            'assets/images/ground_logo.webp', 'Ground'),
                        logoContainer('assets/images/upcoming_logo.webp',
                            'Upcoming Matches'),
                        logoContainer('assets/images/tournaments_logo.webp',
                            'Tournaments')
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
