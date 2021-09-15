import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vamos/core/models/addComment.dart';
import 'package:vamos/core/models/commentsList.dart';
import 'package:vamos/core/models/deleteComments.dart';
import 'package:vamos/core/service/api/api.dart';
import 'package:vamos/locator.dart';
import 'package:vamos/ui/utils/utility.dart';

class CommentController extends GetxController {
  String? rating;
  String? commentByUser;
  String? playerId;
  Api api = locator<Api>();
  List<CommentModel>? comment = [];
  List<String> comments = [];
  void commentList() async {
    Utility.showLoadingDialog();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    CommentListModel response = await api.commentListModel(157.toString());
    if (response.data != null) {
      comment = response.data;

      print(comment);
      update();
      Utility.closeDialog();
    }
    update();
  }

  void commentAdd() async {
    Utility.showLoadingDialog();

    AddComment response =
        await api.addComment(145.toString(), commentByUser!, rating!);
    if (response.data != null) {
      comments.add(response.data!.comment!);
      update();
      Utility.closeDialog();
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
