import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vamos/core/models/ground/groundList.dart';
import 'package:vamos/core/models/playerListResponse.dart';
import 'package:vamos/core/service/api/api.dart';
import 'package:vamos/core/service/controller/playerListingController.dart';
import 'package:vamos/ui/utils/utility.dart';

import '../../../locator.dart';

class SearchByController extends GetxController {
  List<PlayerData> playerList = [];
  List<PlayerData> playerListDisplay = [];
  late bool apiCall;
  String userType = '';
  List<Grounds> _groundList = [];

  Api api = locator<Api>();

  List<Map<String, dynamic>> playerFilters = [
    {'displayName': 'Player Name', 'value': false, 'key': 'first_name'},
    {'displayName': 'Address', 'value': false, 'key': 'address'},
    {'displayName': 'Age', 'value': false, 'key': 'age'},
    {'displayName': 'Rating', 'value': false, 'key': 'rating'},
    {'displayName': 'Player Role', 'value': false, 'key': 'role'},
  ];

  List<Map<String, dynamic>> teamFilters = [
    {'displayName': 'Team Name', 'value': false, 'key': 'name'},
    {'displayName': 'Team Size', 'value': false, 'key': 'team_size'},
  ];
  List<Map<String, dynamic>> groundFilters = [
    {'displayName': 'Ground Name', 'value': false, 'key': 'name'},
    {'displayName': 'Ground Location', 'value': false, 'key': 'location'},
    {
      'displayName': 'Ground Availability',
      'value': false,
      'key': 'availability'
    },
  ];

  List filters = [];

  List<Grounds> get groundList => _groundList;
  set groundList(List<Grounds> value) {
    _groundList = value;
    update();
  }

  void getPlayerlist() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    userType = prefs.getString("register_type")!;
    Utility.showLoadingDialog();
    PlayerListResponse response = await api.getPlayerlist();
    if (response.data != null) {
      Utility.closeDialog();
      playerList = response.data!;
      playerListDisplay = playerList;
    } else {
      Utility.closeDialog();
      Utility.showSnackbar("${response.message}");
    }
    update();
  }

  void getGroundlist() async {
    Utility.showLoadingDialog();
    GroundList response = await api.getGroundlist();
    if (response.data != null) {
      Utility.closeDialog();

      groundList = response.data!;
      update();
    } else {
      Utility.closeDialog();
      Utility.showSnackbar("${response.message}");
    }
    update();
  }

  void playerFilterSearch(value) async {
    Utility.showLoadingDialog();
    PlayerListResponse response =
        await api.searchPlayerWithFilter(value, filters);
    if (response.data != null) {
      Utility.closeDialog();
      Get.find<PlayerListController>().playerList = response.data!;
      Get.find<PlayerListController>().playerListDisplay =
          Get.find<PlayerListController>().playerList;
    } else {
      Utility.closeDialog();
      Utility.showSnackbar("${response.message}");
    }
    update();
  }
}
