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
  bool isloading = false;
  int offset = 0;
  void commentList() async {
    Utility.showLoadingDialog();
    String profileId =
        Get.find<OtherPlayerInfoController>().profile?.user_id?.toString() ??
            "";
    CommentListModel response =
        await api.commentListPageModel(offset, profileId);
    if (response.data != null) {
      offset = offset + 10;
      comment = response.data;
      update();
      Utility.closeDialog();
    }
    update();
  }

  void commentListPage() async {
    isloading = true;
    String profileId =
        Get.find<OtherPlayerInfoController>().profile?.user_id?.toString() ??
            "";
    CommentListModel response =
        await api.commentListPageModel(offset, profileId);
    if (response.data != null) {
      if (response.data!.length > 0) {
        offset = offset + 10;
        comment!.addAll(response.data!);
        isloading = true;
        update();
      } else {
        isloading = false;
        update();
        Utility.showSnackbar("No data to load");
      }
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
