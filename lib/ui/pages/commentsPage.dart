import 'package:flutter/material.dart';
import 'package:vamos/ui/utils/color.dart';
import 'package:vamos/ui/utils/theme.dart';
import 'package:vamos/widget/customAppBar.dart';
import 'package:vamos/widget/customBottomNavBar.dart';
import 'package:vamos/widget/formWidgets/buttons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommentsPage extends StatefulWidget {
  const CommentsPage({Key? key}) : super(key: key);

  @override
  _CommentsPageState createState() => _CommentsPageState();
}

class _CommentsPageState extends State<CommentsPage> {
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
                          'Comments',
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
                SingleChildScrollView(
                  child: Container(
                    height: 400.h,
                    width: 320.w,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 12),
                      child: ListView.builder(
                        itemCount: 10,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            width: 260.w,
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(2.5.w)),
                              elevation: 1,
                              margin: EdgeInsets.fromLTRB(5.w, 0, 5.w, 25.h),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                      Container(
                                        margin: EdgeInsets.symmetric(
                                            vertical: 0.h, horizontal: 0),
                                        child: CircleAvatar(
                                            radius: 18.h,
                                            backgroundImage: AssetImage(
                                                'assets/images/placeholder_team_icon.png')),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15, vertical: 12),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Lionel Andres Messi',
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              style: themeData()
                                                  .textTheme
                                                  .bodyText1!
                                                  .copyWith(
                                                    fontSize: 12.sp,
                                                    fontWeight: FontWeight.bold,
                                                    color: KRed,
                                                  ),
                                            ),
                                            SizedBox(
                                              width: 90.w,
                                            ),
                                            Image.asset(
                                              'assets/images/teamListDelete.webp',
                                              height: 12.h,
                                            )
                                          ],
                                        ),
                                        Container(
                                          width: 210.w,
                                          child: Text(
                                            'Duo ipsum elitr sit diam amet duo, diam diam magna vero kasd amet sed est eos, ea gubergren no justo at eos. Eirmod et est dolor sadipscing aliquyam duo et ea. Gubergren et amet sanctus clita sit dolor amet, nonumy elitr no et sea sadipscing invidunt sed sed. Dolore gubergren.',
                                            maxLines: 10,
                                            style: themeData()
                                                .textTheme
                                                .bodyText1!
                                                .copyWith(
                                                  color: KColorBlack,
                                                  fontSize: 8.sp,
                                                ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
