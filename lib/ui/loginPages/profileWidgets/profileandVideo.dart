import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:multi_image_picker2/multi_image_picker2.dart';
import 'package:vamos/core/service/controller/authController.dart';
import 'package:vamos/core/service/controller/profileController.dart';
import 'package:vamos/ui/utils/color.dart';
import 'package:vamos/widget/numvalueContainer.dart';
import 'package:vamos/widget/profileContainer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';

class ProfilePhoto extends StatefulWidget {
  const ProfilePhoto({Key? key}) : super(key: key);

  @override
  _ProfilePhotoState createState() => _ProfilePhotoState();
}

class _ProfilePhotoState extends State<ProfilePhoto> {
  List networkImages = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) => setState(() {
          networkImages = Get.find<ProfileController>().profile?.photo ?? [];
          Get.find<AuthController>().networkImages = networkImages;
        }));
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(builder: (_authService) {
      return Container(
        padding: EdgeInsets.only(top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ProfileContainer(
                    title:
                        AppLocalizations.of(context)!.profilePage_profilePhoto),
                Padding(
                    padding: EdgeInsets.only(left: 10.w),
                    child: IconButton(
                      onPressed: _authService.addImageButton
                          ? () {
                              _authService.loadAssets();
                            }
                          : null,
                      icon: Icon(
                        Icons.add,
                      ),
                      color: containerGreen,
                      disabledColor: KLightGrey,
                    ))
              ],
            ),
            Container(
              padding: EdgeInsets.fromLTRB(30.w, 15, 0, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  _authService.networkImages.length == 0 &&
                          _authService.images.length == 0
                      ? GestureDetector(
                          onTap: () {
                            _authService.loadAssets();
                          },
                          child: Container(
                            height: 86.h,
                            width: 130.w,
                            color: Color.fromRGBO(249, 249, 249, 1),
                            child: Center(
                                child: Image.asset(
                              "assets/images/add_image_1.webp",
                              height: 28.h,
                              width: 34.w,
                            )),
                          ),
                        )
                      : SizedBox(
                          child: buildImageGrid(),
                        ),
                  // _authService.images.length == 0 &&
                  //         networkImages?.length == 0
                  //     ? GestureDetector(
                  //         onTap: () {
                  //           _authService.loadAssets();
                  //         },
                  //         child: Container(
                  //           height: 86.h,
                  //           width: 130.w,
                  //           color: Color.fromRGBO(249, 249, 249, 1),
                  //           child: Center(
                  //               child: Image.asset(
                  //             "assets/images/add_image_1.webp",
                  //             height: 28.h,
                  //             width: 34.w,
                  //           )),
                  //         ),
                  //       )
                  //     : _authService.images.length != 0
                  //         ? SizedBox(
                  //             child: buildGridView([]),
                  //           )
                  //         : SizedBox(),
                ],
              ),
            )
          ],
        ),
      );
    });
  }
}

Widget buildImageGrid() {
  return GetBuilder<AuthController>(builder: (_authService) {
    return SingleChildScrollView(
      physics: NeverScrollableScrollPhysics(),
      child: GridView.count(
        crossAxisCount: 2,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        children: List.generate(
            _authService.networkImages.length + _authService.images.length,
            (index) {
          return index < _authService.networkImages.length
              ? Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.network(
                          _authService.networkImages[index]["url"],
                          width: 130,
                          height: 130),
                    ),
                    Positioned(
                      top: -5,
                      right: 10.w,
                      child: IconButton(
                        icon: Icon(
                          Icons.delete,
                          color: kLogoColor2,
                        ),
                        onPressed: () {
                          _authService.deleteMedia(index, "image");
                        },
                      ),
                    ),
                  ],
                )
              : Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: AssetThumb(
                        asset: _authService
                            .images[index - _authService.networkImages.length],
                        width: 130,
                        height: 130,
                      ),
                    ),
                    Positioned(
                      top: -5,
                      right: 10.w,
                      child: IconButton(
                        icon: Icon(
                          Icons.delete,
                          color: kLogoColor2,
                        ),
                        onPressed: () {
                          _authService.deleteFile(
                              index - _authService.networkImages.length);
                        },
                      ),
                    ),
                  ],
                );
        }),
      ),
    );
  });
}

class SkillVideo extends StatefulWidget {
  const SkillVideo({Key? key}) : super(key: key);

  @override
  _SkillVideoState createState() => _SkillVideoState();
}

class _SkillVideoState extends State<SkillVideo> {
  List networkVideos = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) => setState(() {
          networkVideos =
              Get.find<ProfileController>().profile?.skill_video ?? [];
          Get.find<AuthController>().networkFiles = networkVideos;
        }));
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
        builder: (_authService) => Container(
              padding: EdgeInsets.only(top: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ProfileContainer(
                          title: AppLocalizations.of(context)!
                              .profilePage_skillVideos),
                      Padding(
                          padding: EdgeInsets.only(left: 10.w),
                          child: IconButton(
                            onPressed: _authService.addVideoButton
                                ? () {
                                    _authService.loadVideo();
                                  }
                                : null,
                            icon: Icon(
                              Icons.add,
                            ),
                            color: containerGreen,
                            disabledColor: KLightGrey,
                          )),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(30.w, 15, 0, 0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        _authService.files.length == 0 &&
                                networkVideos.length == 0
                            ? Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      _authService.loadVideo();
                                    },
                                    child: Container(
                                      height: 86.h,
                                      width: 130.w,
                                      color: Color.fromRGBO(249, 249, 249, 1),
                                      child: Center(
                                          child: Image.asset(
                                        "assets/images/add_video_copy.webp",
                                        height: 28.h,
                                        width: 34.w,
                                      )),
                                    ),
                                  ),
                                  SizedBox(width: 30.w),
                                  GestureDetector(
                                    onTap: () {
                                      _authService.loadVideo();
                                    },
                                    child: Container(
                                      height: 86.h,
                                      width: 130.w,
                                      color: Color.fromRGBO(249, 249, 249, 1),
                                      child: Center(
                                          child: Image.asset(
                                        "assets/images/add_video_copy.webp",
                                        height: 28.h,
                                        width: 34.w,
                                      )),
                                    ),
                                  ),
                                ],
                              )
                            : SizedBox(
                                child: buildVideoGridView(networkVideos),
                              ),
                      ],
                    ),
                  )
                ],
              ),
            ));
  }
}

Widget buildVideoGridView(List _networkVideos) {
  return GetBuilder<AuthController>(builder: (_authService) {
    return SingleChildScrollView(
      physics: NeverScrollableScrollPhysics(),
      child: GridView.count(
        crossAxisCount: 2,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        children: _networkVideos.length == 0
            ? List.generate(
                _authService.files.length,
                (index) {
                  return Stack(
                    children: [
                      InkWell(
                        onTap: () {
                          _authService.selectedVideo = index;
                          Get.toNamed("/videoScreen");
                        },
                        child: Container(
                          height: 130.h,
                          width: 130.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                              border: Border.all(color: bgroundCol)),
                          child: Center(
                            child: Icon(
                              Icons.video_collection_outlined,
                              color: kLogoColor2,
                              size: 30,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: -5,
                        right: 1.w,
                        child: IconButton(
                          icon: Icon(
                            Icons.delete,
                            color: kLogoColor2,
                          ),
                          onPressed: () {
                            _authService.deleteVideoFile(index);
                          },
                        ),
                      ),
                    ],
                  );
                },
              )
            : List.generate(
                _networkVideos.length,
                (index) {
                  return Stack(
                    children: [
                      InkWell(
                        onTap: () {
                          // _authService.selectedVideo = index;
                          // Get.toNamed("/videoScreen");
                        },
                        child: Container(
                          height: 130.h,
                          width: 130.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                              border: Border.all(color: bgroundCol)),
                          child: Center(
                            child: Icon(
                              Icons.video_collection_outlined,
                              color: kLogoColor2,
                              size: 30,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: -5,
                        right: 1.w,
                        child: IconButton(
                          icon: Icon(
                            Icons.delete,
                            color: kLogoColor2,
                          ),
                          onPressed: () {
                            _authService.deleteMedia(index, "video");
                          },
                        ),
                      ),
                    ],
                  );
                },
              ),
      ),
    );
  });
}
