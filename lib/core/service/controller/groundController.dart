import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vamos/core/models/groundProfileView.dart';
import 'package:vamos/core/models/updateGround.dart';
import 'package:vamos/core/service/api/api.dart';
import 'package:vamos/core/service/controller/authController.dart';
import 'package:vamos/locator.dart';
import 'package:vamos/ui/utils/utility.dart';

class GroundController extends GetxController {
  Api api = locator<Api>();
  String? groundName;
  String? groundLocation;
  int currentDateIndex = -1;
  DateTime? selectedDate;
  DateTime? selectedOpeningTime;
  DateTime? selectedClosingTime;
  DateTime? selectedSlotDuration;
  int? selectedSlotPrice;
  List<Map<String, dynamic>> availableDates = [];
  late String _bookingFee;

  void updateSchedule() {
    deleteSchedule();
    Map<String, dynamic> newValue = {
      "date": selectedDate,
      "availablility": {
        "opening_time": selectedOpeningTime,
        "closing_time": selectedClosingTime,
        "slot_time": selectedSlotDuration,
        "cost_per_slot": selectedSlotPrice,
      },
    };
    availableDates.add(newValue);
    print(availableDates);
  }

  void deleteSchedule() {
    if (checkIsScheduled(selectedDate!)) {
      availableDates.removeAt(availableDates
          .indexWhere((element) => element["date"] == selectedDate));
    }
  }

  bool checkIsScheduled(DateTime? _date) {
    bool check = false;
    if (availableDates.indexWhere((element) => element["date"] == _date) !=
        -1) {
      check = true;
    }
    return check;
  }

  void setSelectedOpeningTime(DateTime _value) {
    selectedOpeningTime = _value;
    update();
  }

  void setSelectedClosingTime(DateTime _value) {
    selectedClosingTime = _value;
    update();
  }

  void setSelectedSlotDuration(DateTime _value) {
    selectedSlotDuration = _value;
    update();
  }

  void setSelectedSlotPrice(int _value) {
    selectedSlotPrice = _value;
    update();
  }

  void clearSchedule() {
    selectedOpeningTime = null;
    selectedClosingTime = null;
    selectedSlotDuration = null;
    selectedSlotPrice = null;
    update();
  }

  String get bookingFee => _bookingFee;

  set bookingFee(String value) {
    _bookingFee = value;
    update();
  }

  String? latitude;
  String? longitude;
  String? bookingFees;
  List? photos;
  // GroundInfo? groundInfo;
  // GroundInfo? groundDisplay;

  void getProfileData() async {
    Utility.showLoadingDialog();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    GroundProfileViewResponse response =
        await api.getGroundProfile(prefs.getString("ground_id"));
    if (response.data != null) {
      groundName = response.data?.name;
      groundLocation = response.data?.location;
      latitude = response.data?.latitude;
      longitude = response.data?.longitude;
      bookingFees = response.data?.bookingFee;
      photos = response.data?.photo;
      update();
      Utility.closeDialog();
    }
  }

  void groundUpdate() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    AuthController controller = Get.find<AuthController>();
    print("++++  passing argument in api ++++++++++++++");
    print(groundName);
    print(prefs.getString("userId").toString());

    print(groundLocation);

    print(bookingFee);
    print(availableDates);

    Utility.showLoadingDialog();
    UpdateGround response = await api.updateGround(
        prefs.getString("userId").toString(),
        groundName,
        groundLocation,
        bookingFee,
        availableDates
        // [
        //   {
        //     "date": "2021-10-01",
        //     "availablility": {
        //       "opening_time": "05:20:00",
        //       "closing_time": "11:30:00",
        //       "slot_time": "00:20:00",
        //       "cost_per_slot": 2000
        //     }
        //   }
        // ],
        );
    if (response.data != null) {
      Utility.closeDialog();
      prefs.setString("ground_id", response.data!.id.toString());
      // groundInfo = response.data!;
      // groundDisplay = groundInfo;
      print("======================");
      // do not uncomment the below line other wise again we have to register user for testing the flow
      //   controller.completedStep("2", "/homeScreen");
    } else {
      Utility.closeDialog();
      Utility.showSnackbar("${response.message}");
    }
    update();
  }
}
