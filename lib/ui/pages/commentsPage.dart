import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vamos/core/service/controller/commentController.dart';
import 'package:vamos/core/service/controller/profileController.dart';
import 'package:vamos/ui/utils/color.dart';
import 'package:vamos/ui/utils/loginbkground.dart';
import 'package:vamos/ui/utils/theme.dart';
import 'package:vamos/widget/customAppBar.dart';
import 'package:vamos/widget/customBottomNavBar.dart';
import 'package:vamos/widget/formWidgets/buttons.dart';

class CommentsPage extends StatefulWidget {
  const CommentsPage({Key? key}) : super(key: key);

  @override
  _CommentsPageState createState() => _CommentsPageState();
}

class _CommentsPageState extends State<CommentsPage> {
  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      Get.find<CommentController>().commentList();
      Get.find<ProfileController>().getProfileData();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String ss;
    return SafeArea(
      child: GetBuilder<CommentController>(
        builder: (_commentsService) => Directionality(
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
                  Stack(
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: SingleChildScrollView(
                          child: Container(
                            height: 400.h,
                            width: 320.w,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 12),
                              child: ListView.builder(
                                itemCount: _commentsService.comment!.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return Container(
                                    width: 260.w,
                                    child: Card(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(2.5.w)),
                                      elevation: 1,
                                      margin: EdgeInsets.fromLTRB(
                                          5.w, 0, 5.w, 25.h),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                height: 7.h,
                                              ),
                                              Container(
                                                margin: EdgeInsets.symmetric(
                                                    vertical: 0.h,
                                                    horizontal: 8.w),
                                                child: CircleAvatar(
                                                    radius: 18.h,
                                                    backgroundImage: AssetImage(
                                                        'assets/images/placeholder_team_icon.png')),
                                              ),
                                            ],
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 5, vertical: 12),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      width: 150,
                                                      child: Text(
                                                        'Cristiano Ronaldo',
                                                        maxLines: 2,
                                                        softWrap: true,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style: themeData()
                                                            .textTheme
                                                            .bodyText1!
                                                            .copyWith(
                                                              fontSize: 12.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color: KRed,
                                                            ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 90.w,
                                                    ),
                                                    GestureDetector(
                                                      onTap: () {
                                                        _commentsService
                                                            .deleteComment(
                                                                index,
                                                                _commentsService
                                                                    .comment![
                                                                        index]
                                                                    .id!);
                                                      },
                                                      child: Image.asset(
                                                        'assets/images/teamListDelete.webp',
                                                        height: 12.h,
                                                      ),
                                                    )
                                                  ],
                                                ),
                                                Container(
                                                  width: 210.w,
                                                  child: Text(
                                                    _commentsService
                                                        .comment![index]
                                                        .comment!,
                                                    maxLines: 10,
                                                    style: themeData()
                                                        .textTheme
                                                        .bodyText1!
                                                        .copyWith(
                                                          color: KColorBlack,
                                                          fontSize: 9.sp,
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
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Container(
                          margin: EdgeInsets.only(right: 10.w),
                          height: 220.h,
                          child: FloatingActionButton(
                            heroTag: null,
                            backgroundColor: containerGreen,
                            child: Icon(Icons.add),
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return Center(
                                      child: Container(
                                        margin: EdgeInsets.symmetric(
                                            horizontal: 20, vertical: 10),
                                        width: 250.w,
                                        height: 250.h,
                                        decoration: BoxDecoration(
                                            color: titleText,
                                            borderRadius:
                                                BorderRadius.circular(2.5.h)),
                                        child: SingleChildScrollView(
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          10, 8, 0, 0),
                                                  child: Text(
                                                    'Add comment and\nRate a player',
                                                    style: themeData()
                                                        .textTheme
                                                        .bodyText1!
                                                        .copyWith(
                                                          color:
                                                              profileContainerColor,
                                                          fontSize: 15.sp,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          8, 20, 0, 5),
                                                  child: Text(
                                                    'Comment',
                                                    style: themeData()
                                                        .textTheme
                                                        .bodyText1!
                                                        .copyWith(
                                                          color: KLightGrey,
                                                          fontSize: 12.sp,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                  ),
                                                ),
                                                Container(
                                                  height: 130.h,
                                                  child: Card(
                                                    elevation: 0,
                                                    child: TextFormField(
                                                      minLines: 3,
                                                      maxLines: 20,
                                                      onChanged: (value) {
                                                        _commentsService
                                                                .commentByUser =
                                                            value;
                                                      },
                                                      decoration:
                                                          InputDecoration(
                                                        alignLabelWithHint:
                                                            true,
                                                        floatingLabelBehavior:
                                                            FloatingLabelBehavior
                                                                .never,
                                                        labelText:
                                                            "Comment Goes Here",
                                                        labelStyle: themeData()
                                                            .textTheme
                                                            .bodyText1!
                                                            .copyWith(
                                                                color:
                                                                    KLightGrey),
                                                        enabledBorder:
                                                            OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                        color:
                                                                            KLightGrey,
                                                                        width:
                                                                            1.0),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .zero),
                                                        focusedBorder:
                                                            OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                        color:
                                                                            KLightGrey,
                                                                        width:
                                                                            1.0),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .zero),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Card(
                                                  elevation: 0,
                                                  child: Container(
                                                    margin: EdgeInsets.only(
                                                      bottom: 15.h,
                                                    ),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          "Ratings",
                                                          style: themeData()
                                                              .textTheme
                                                              .bodyText1!
                                                              .copyWith(
                                                                  color:
                                                                      KLightGrey),
                                                        ),
                                                        SizedBox(
                                                          width: 10.w,
                                                        ),
                                                        Container(
                                                          height: 35.h,
                                                          width: 100.w,
                                                          color: KLightGrey
                                                              .withOpacity(0.2),
                                                          child: Center(
                                                              child:
                                                                  TextFormField(
                                                            textAlign: TextAlign
                                                                .center,
                                                            keyboardType:
                                                                TextInputType
                                                                    .number,
                                                            onChanged: (val) {
                                                              _commentsService
                                                                  .rating = val;
                                                            },
                                                            initialValue: '',
                                                            style: themeData()
                                                                .textTheme
                                                                .bodyText1!
                                                                .copyWith(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold),
                                                          )),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              vertical: 20.h,
                                                              horizontal: 10.w),
                                                      child:
                                                          primaryActionButton(
                                                        color: moneyBox,
                                                        context: context,
                                                        onPressed: () {
                                                          Get.back();
                                                        },
                                                        text: "Cancel",
                                                        width: 100,
                                                        height: 30,
                                                        fontSize: 12,
                                                      ),
                                                    ),
                                                    Container(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              vertical: 20.h,
                                                              horizontal: 10.w),
                                                      child:
                                                          primaryActionButton(
                                                        context: context,
                                                        onPressed: () {
                                                          _commentsService
                                                              .commentAdd();
                                                        },
                                                        text: "Save",
                                                        width: 100,
                                                        height: 30,
                                                        fontSize: 12,
                                                      ),
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  });
                            },
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
