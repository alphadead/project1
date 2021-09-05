import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:multi_image_picker2/multi_image_picker2.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vamos/core/models/createMatch.dart';
import 'package:vamos/core/models/groundProfileView.dart';
import 'package:vamos/core/models/updateGround.dart';
import 'package:vamos/core/service/api/api.dart';
import 'package:vamos/core/service/controller/authController.dart';
import 'package:vamos/locator.dart';
import 'package:vamos/ui/utils/utility.dart';

class GroundController extends GetxController {
  Api api = locator<Api>();
  String? groundName;
  String? matchName;
  String _eventDetails = '';
  String? groundLocation;
  int currentDateIndex = -1;
  DateTime? selectedDate;
  String? bookingDate;
  String? bookingSlotTime;
  List<Map<String, dynamic>> availableDates = [];
  DateTime? selectedOpeningTime;
  DateTime? selectedClosingTime;
  DateTime? selectedSlotDuration;
  int? selectedSlotPrice;
  Asset? image;
  List<Map<String, dynamic>> bookingTimeslots = [];
  late String _bookingFee;

  String get eventDetails => _eventDetails;
  set eventDetails(String value) {
    _eventDetails = value;
    update();
  }

  void updateSchedule() {
    print("UPDATE SCHEDULE");
    deleteSchedule();
    Map<String, dynamic> newValue = {
      "date": DateFormat('yyyy-MM-dd').format(selectedDate!),
      "availability": {
        "opening_time": DateFormat('HH:mm').format(selectedOpeningTime!),
        "closing_time": DateFormat('HH:mm').format(selectedClosingTime!),
        "slot_time": DateFormat('mm').format(selectedSlotDuration!),
        "event_details": eventDetails
      },
    };
    availableDates.add(newValue);
    print(availableDates);
  }

  void deleteSchedule() {
    if (checkIsScheduled(selectedDate!)) {
      availableDates.removeAt(availableDates.indexWhere((element) =>
          element["date"] == DateFormat('yyyy-MM-dd').format(selectedDate!)));
    }
  }

  bool checkIsScheduled(DateTime? _date) {
    if (availableDates.indexWhere((element) =>
            element["date"] == DateFormat('yyyy-MM-dd').format(_date!)) !=
        -1) {
      return true;
    } else {
      return false;
    }
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
    eventDetails = '';
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

  void createMatch() async {
    Utility.showLoadingDialog();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    CreateMatch response = await api.createMatch(
        prefs.getString("userId")!,
        matchName!,
        image!,
        prefs.getString("ground_id")!,
        groundName!,
        groundLocation!,
        _bookingFee,
        bookingDate!,
        bookingTimeslots,
        bookingSlotTime);
    print(response);
    if (response.data != null) {
      update();
      Utility.closeDialog();
    }
  }

  void groundUpdate() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    AuthController controller = Get.find<AuthController>();

    Utility.showLoadingDialog();
    UpdateGround response = await api.updateGround(
        prefs.getString("userId").toString(),
        groundName,
        groundLocation,
        bookingFee,
        availableDates);
    if (response.data != null) {
      Utility.closeDialog();
      prefs.setString("ground_id", response.data!.id.toString());

      controller.completedStep("2", "/homeScreen");
    } else {
      Utility.closeDialog();
      Utility.showSnackbar("${response.message}");
    }
    update();
  }
}
