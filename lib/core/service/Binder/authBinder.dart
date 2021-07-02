import 'package:get/get.dart';
import 'package:vamos/core/service/controller/authController.dart';

class AllBinder extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<AuthController>(() => AuthController());
  }
}
