import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vamos/core/models/addComment.dart';
import 'package:vamos/core/models/commentsList.dart';
import 'package:vamos/core/models/deleteComments.dart';
import 'package:vamos/core/service/api/api.dart';
import 'package:vamos/core/service/controller/otherPlayerInfoController.dart';
import 'package:vamos/locator.dart';
import 'package:vamos/ui/utils/utility.dart';

class CommentController extends GetxController {
  String? rating = "3";
  String? commentByUser;
  String? playerId;
  Api api = locator<Api>();
  List<CommentModel>? comment = [];
  List<String> comments = [];
  void commentList() async {
    Utility.showLoadingDialog();
    String profileId =
        Get.find<OtherPlayerInfoController>().profile?.user_id?.toString() ??
            "";
    SharedPreferences prefs = await SharedPreferences.getInstance();
    CommentListModel response = await api.commentListModel(profileId);
    if (response.data != null) {
      comment = response.data;
      update();
      Utility.closeDialog();
    }
    update();
  }

  void commentAdd() async {
    Utility.showLoadingDialog();
    String profileId =
        Get.find<OtherPlayerInfoController>().profile?.user_id?.toString() ??
            "";

    AddComment response =
        await api.addComment(profileId, commentByUser!, rating!);
    if (response.data != null) {
      comment?.add(CommentModel.fromJson(response.data!.toJson()));
      // comments.add(response.data!.comment!);
      update();
      Utility.closeDialog();
      Get.back();
    }
  }

  void deleteComment(int index, int id) async {
    Utility.showLoadingDialog();
    DeleteComment response = await api.deleteComment(id);
    if (response.success!) {
      comment!.removeAt(index);
      update();
      Utility.closeDialog();
    }
  }
}
