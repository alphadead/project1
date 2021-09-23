import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vamos/core/models/match/createMatch.dart';
import 'package:vamos/core/models/groundList.dart';
import 'package:vamos/core/models/groundAvailability.dart';
import 'package:vamos/core/models/groundProfileView.dart';
import 'package:vamos/core/models/updateGround.dart';
import 'package:vamos/core/service/api/api.dart';
import 'package:vamos/core/service/controller/authController.dart';
import 'package:vamos/core/service/controller/matchController.dart';
import 'package:vamos/locator.dart';
import 'package:vamos/ui/utils/utility.dart';

class GroundController extends GetxController {
  Api api = locator<Api>();
  String? groundName = '';
  String? _customGroundName;
  String? _customGroundLocation;
  bool _isCustom = false;
  String? matchName;
  String _eventDetails = '';
  String? groundLocation = "";
  int currentDateIndex = -1;
  int? _groundId;
  DateTime? selectedDate;
  String? bookingDate;
  String? bookingSlotTime;
  DateTime? selectedOpeningTime;
  DateTime? selectedClosingTime;
  DateTime? selectedSlotDuration;
  int? selectedSlotPrice;
  List<Map<String, dynamic>> bookingTimeslots = [];
  List<dynamic> _availableDates = [];
  late String _bookingFee = '';
  List<Grounds> groundList = [];
  List<Datum> timeSlots = [];
  List<int> selectedIndices = [];
  Grounds? selectedGround;
  Grounds? customGround;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String get eventDetails => _eventDetails;
  set eventDetails(String value) {
    _eventDetails = value;
    update();
  }

  String? get customGroundName => _customGroundName;
  set customGroundName(String? val) {
    _customGroundName = val;
    update();
  }

  bool get isCustom => _isCustom;
  set isCustom(bool val) {
    _isCustom = val;
    update();
  }

  String? get customGroundlocation => _customGroundLocation;
  set customGroundlocation(String? val) {
    _customGroundLocation = val;
    update();
  }

  List<dynamic> get availableDates => _availableDates;
  set availableDates(List<dynamic> value) {
    _availableDates = value;
    update();
  }

  int? get groundId => _groundId;
  set groundId(int? value) {
    _groundId = value;
    update();
  }

  void updateSchedule() {
    deleteSchedule();
    Map<String, dynamic> newValue = {
      "date": DateFormat('yyyy-MM-dd').format(selectedDate!),
      "availability": {
        "opening_time": DateFormat('HH:mm').format(selectedOpeningTime!),
        "closing_time": DateFormat('HH:mm').format(selectedClosingTime!)
      },
    };
    availableDates.add(newValue);
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
  String? bookingFees = "";
  List? photos;

  void getProfileData() async {
    Utility.showLoadingDialog();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    GroundProfileViewResponse response =
        await api.getGroundProfile(prefs.getString("ground_id"));
    if (response.data != null) {
      groundId = response.data?.id;
      selectedGround = Grounds(
          id: response.data?.id,
          name: response.data?.name,
          location: response.data?.location,
          latitude: response.data?.latitude,
          longitude: response.data?.longitude,
          bookingFee: response.data?.bookingFee);
      groundName = response.data?.name;
      groundLocation = response.data?.location;
      latitude = response.data?.latitude;
      longitude = response.data?.longitude;
      bookingFees = response.data?.bookingFee;
      bookingFee = bookingFees!;
      photos = response.data?.photo;
      availableDates = response.data!.availableSlots!;
      update();
      Utility.closeDialog();
    }
  }

  void createMatch() async {
    Utility.showLoadingDialog();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    CreateMatch response = await api.createMatch(
      prefs.getString("userId")!,
      matchName ?? '',
      customGround?.id,
      isCustom ? customGroundName : selectedGround?.name,
      isCustom ? customGroundlocation : selectedGround?.location,
      bookingFee,
      bookingDate,
      isCustom
          ? [
              {
                "opening_time":
                    DateFormat('HH:mm').format(selectedOpeningTime!),
                "closing_time": DateFormat('HH:mm').format(selectedClosingTime!)
              }
            ]
          : [
              {
                "opening_time": timeSlots[selectedIndices.first].slotStartTime,
                "closing_time": timeSlots[selectedIndices.last].slotEndTime
              }
            ],
      '',
      // team size
      '6',
    );

    if (response.data != null) {
      Get.find<MatchController>().matchId = response.data?.id;
      update();
      Utility.closeDialog();
      Get.toNamed("/inviteTeamMatch");
    } else {
      Utility.closeDialog();
      Utility.showSnackbar("${response.message}");
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

  void groundAvailability(String date) async {
    Utility.showLoadingDialog();
    GroundAvailability response = await api.groundAvailable(groundId!, date);
    bookingDate = date;

    if (response.data != null) {
      timeSlots = response.data!;
      Utility.closeDialog();
    } else {
      timeSlots = [];
      Utility.closeDialog();
      Utility.showSnackbar("${response.message}");
    }
    update();
  }

  void setSelectedGroundInfo(int incomingGroundId) {
    Grounds ground =
        groundList.firstWhere((ground) => ground.id == incomingGroundId);
    groundId = incomingGroundId;
    availableDates = ground.availableSlots!;
    selectedGround = ground;
    timeSlots = [];
    selectedIndices = [];
    update();
  }

  void selectSlot(int currIndex) {
    var list = selectedIndices;
    list.sort();
    if (list.isEmpty ||
        currIndex == list.last + 1 ||
        currIndex == list.first - 1) {
      selectedIndices.add(currIndex);
      selectedIndices.sort();
      update();
    } else {
      selectedIndices = [currIndex];
      update();
    }
  }
}
