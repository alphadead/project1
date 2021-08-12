import 'package:get/get.dart';
import 'package:vamos/core/service/controller/addsController.dart';
import 'package:vamos/core/service/controller/authController.dart';
import 'package:vamos/core/service/controller/playerListingController.dart';
import 'package:vamos/core/service/controller/inviteController.dart';
import 'package:vamos/core/service/controller/teamListingController.dart';

class AllBinder extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<AuthController>(() => AuthController());
    Get.lazyPut<TeamListController>(() => TeamListController());
    Get.lazyPut<AddsController>(() => AddsController());
    Get.lazyPut<PlayerListController>(() => PlayerListController());
    Get.lazyPut<InviteController>(() => InviteController());
  }
}
