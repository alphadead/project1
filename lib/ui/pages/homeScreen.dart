import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vamos/core/service/controller/addsController.dart';
import 'package:vamos/ui/utils/color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vamos/widget/addsOptionsContainer.dart';
import 'package:vamos/widget/formWidgets/buttons.dart';
import 'package:vamos/widget/customAppBar.dart';
import 'package:vamos/widget/customBottomNavBar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String userType = '';

  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      // Get.find<AddsController>().getUserType();
      getUserType();
    });
    // TODO: implement initState
    super.initState();
  }

  void getUserType() async {
    print("+++++++++++++++++");
    print("lkj");
    SharedPreferences prefs = await SharedPreferences.getInstance();
    userType = prefs.getString("register_type")!;
    print("iop");
    print(userType);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetBuilder<AddsController>(
        builder: (_addService) => Directionality(
          textDirection: TextDirection.ltr,
          child: Scaffold(
            floatingActionButtonLocation:
                FloatingActionButtonLocation.miniCenterDocked,
            floatingActionButton: homeFABBottomNav(),
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
                        logoContainer(
                            context, 'assets/images/team_logo.webp', 'Team',
                            nextRoute: "/teamList"),
                        logoContainer(
                            context, 'assets/images/player_logo.webp', 'Player',
                            nextRoute: '/playerList'),
                        userType == "Ground"
                            ? SizedBox()
                            : logoContainer(
                                context,
                                'assets/images/create_logo.webp',
                                'Create Own Team'),
                        logoContainer(
                          context,
                          'assets/images/ground_logo.webp',
                          'Match',
                          nextRoute: '/matchListing',
                        ),
                        logoContainer(
                            context,
                            'assets/images/upcoming_logo.webp',
                            'Upcoming Matches'),
                        logoContainer(
                            context,
                            'assets/images/tournaments_logo.webp',
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
