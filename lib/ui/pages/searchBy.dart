import 'package:flutter/material.dart';
import 'package:vamos/ui/utils/color.dart';
import 'package:vamos/ui/utils/theme.dart';
import 'package:vamos/widget/customAppBar.dart';
import 'package:vamos/widget/customBottomNavBar.dart';
import 'package:vamos/widget/formWidgets/buttons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchBy extends StatefulWidget {
  const SearchBy({Key? key}) : super(key: key);

  @override
  _SearchByState createState() => _SearchByState();
}

class _SearchByState extends State<SearchBy> {
  bool groundCont = false;
  bool playerCont = true;
  bool teamCont = false;
  bool normalCont = true;
  bool premiumCont = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          floatingActionButtonLocation:
              FloatingActionButtonLocation.miniCenterDocked,
          floatingActionButton: homeFABBottomNav(),
          bottomNavigationBar: CustomBottomAppBar(height: 50.h),
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(60.h),
            child: CustomAppBar(),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Container(
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Search by player',
                        hintStyle: themeData().textTheme.bodyText2!.copyWith(
                              color: labelText,
                              fontSize: 10.sp,
                            ),
                        suffixIcon: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.search),
                        ),
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Container(
                    height: 100.h,
                    margin: EdgeInsets.symmetric(vertical: 20.h),
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 8.h),
                          height: 56.h,
                          child: Image.asset('assets/images/searchPage.webp'),
                        ),
                        Text(
                          'Search By',
                          style: themeData().textTheme.bodyText1!.copyWith(
                                color: profileContainerColor,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            groundCont = false;
                            playerCont = true;
                            teamCont = false;
                          });
                        },
                        child: Container(
                          width: 90.w,
                          height: 30.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: playerCont ? KRed : moneyBox,
                          ),
                          child: Center(
                            child: Text(
                              'Player',
                              style: themeData()
                                  .textTheme
                                  .headline2!
                                  .copyWith(fontSize: 10.sp),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            groundCont = false;
                            playerCont = false;
                            teamCont = true;
                          });
                        },
                        child: Container(
                          width: 90.w,
                          height: 30.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: teamCont ? KRed : moneyBox,
                          ),
                          child: Center(
                            child: Text(
                              'Team',
                              style: themeData()
                                  .textTheme
                                  .headline2!
                                  .copyWith(fontSize: 10.sp),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            groundCont = true;
                            playerCont = false;
                            teamCont = false;
                          });
                        },
                        child: Container(
                          width: 90.w,
                          height: 30.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: groundCont ? KRed : moneyBox,
                          ),
                          child: Center(
                            child: Text(
                              'Ground',
                              style: themeData()
                                  .textTheme
                                  .headline2!
                                  .copyWith(fontSize: 10.sp),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Container(
                    width: 300.w,
                    height: 320.h,
                    decoration: BoxDecoration(
                        color: KLightGrey.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(3)),
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      normalCont = true;
                                      premiumCont = false;
                                    });
                                  },
                                  child: Container(
                                    height: 30.h,
                                    width: 110.w,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: normalCont
                                            ? profileContainerColor
                                            : moneyBox.withOpacity(0.2)),
                                    child: Center(
                                      child: Text(
                                        'Normal Player',
                                        style: TextStyle(
                                            color: titleText, fontSize: 11.sp),
                                      ),
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      normalCont = false;
                                      premiumCont = true;
                                    });
                                  },
                                  child: Container(
                                    height: 30.h,
                                    width: 110.w,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: premiumCont
                                            ? profileContainerColor
                                            : moneyBox.withOpacity(0.2)),
                                    child: Center(
                                      child: Text(
                                        'Premium Player',
                                        style: TextStyle(
                                            color: titleText, fontSize: 11.sp),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          ClipRect(
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(3)),
                              margin: EdgeInsets.only(
                                  bottom: 12.h, left: 5.w, right: 5.w),
                              height: 40.h,
                              width: 250.w,
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Center(
                                        child: Text(
                                          'Messi',
                                          style: themeData()
                                              .textTheme
                                              .bodyText1!
                                              .copyWith(
                                                  fontSize: 12.sp,
                                                  color: KLightGrey),
                                        ),
                                      ),
                                      Center(
                                        child: GestureDetector(
                                          onTap: () {},
                                          child: Image.asset(
                                            'assets/images/filterIcon.webp',
                                            width: 20.w,
                                            height: 20.h,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            height: 180.h,
                            width: 260.w,
                            child: ListView.builder(
                              itemCount: 5,
                              itemBuilder: (BuildContext context, int index) {
                                return Container(
                                  height: 80.h,
                                  width: 260.w,
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(2.5.w)),
                                    elevation: 1,
                                    margin:
                                        EdgeInsets.fromLTRB(5.w, 0, 5.w, 25.h),
                                    child: Row(
                                      children: [
                                        Container(
                                          margin: EdgeInsets.symmetric(
                                              vertical: 0.h, horizontal: 10),
                                          child: CircleAvatar(
                                              radius: 18.h,
                                              backgroundImage: AssetImage(
                                                  'assets/images/placeholder_team_icon.png')),
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Lionel Andres Messi',
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              style: themeData()
                                                  .textTheme
                                                  .bodyText1!
                                                  .copyWith(
                                                    fontSize: 14.sp,
                                                    fontWeight: FontWeight.bold,
                                                    color:
                                                        profileContainerColor,
                                                  ),
                                            ),
                                            Text(
                                              'Nationality: Agrentinian',
                                              style: themeData()
                                                  .textTheme
                                                  .bodyText1!
                                                  .copyWith(
                                                      color: KColorBlack,
                                                      fontSize: 10.sp,
                                                      fontWeight:
                                                          FontWeight.bold),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
