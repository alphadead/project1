import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:multi_image_picker2/multi_image_picker2.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vamos/ui/utils/constants.dart';

const Duration TIMEOUT = Duration(seconds: 15);

Future<Map<String, dynamic>> postRequest(url, body) async {
  //GlobalKey<ScaffoldState> _scaffoldKey;
  print(BASE_URL + url);
  print(body);
  final http.Response response = await http
      .post(Uri.parse(BASE_URL + url),
          body: json.encode(body), headers: await getHeaders())
      .timeout(TIMEOUT, onTimeout: () {
    return Future.value(http.Response(json.encode(timeoutResponse()), 400));
  }).catchError((error) {
    return getErrorMessage(error);
  });
  print("BODY ${response.body}");
  print("STATUS CODE ${response.statusCode}");
  // if (response.statusCode < 300 && response.statusCode >= 200) {
  Map<String, dynamic> responseBody = json.decode(response.body);

  if (responseBody['status'] == 'success' ||
      responseBody['status'] == 'error') {
    responseBody.putIfAbsent("success", () => true);
  }
  return responseBody;
  // }
  // else {
  //   return responseBody;
  //   //errorResponse();
  // }
}

Map<String, dynamic> timeoutResponse() {
  return {
    "success": false,
    "message": "Please check your network connection and try again.",
  };
}

Map<String, dynamic> errorResponse() {
  return {
    "success": false,
    "message": "Something went wrong, please try again."
  };
}

Future<Map<String, String>> getHeaders() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  printWrapped(prefs.getString('token') ?? '');
  return {
    "Content-Type": "application/json",
    'Authorization': prefs.getString('token') ?? ''
  };
}

void printWrapped(String text) {
  if (text != null) {
    final pattern = new RegExp('.{1,800}'); // 800 is the size of each chunk
    pattern.allMatches(text).forEach((match) => print(match.group(0)));
  }
}

getErrorMessage(error) {
  if (error.toString().indexOf("SocketException:") != -1)
    return Future.value(http.Response(json.encode(timeoutResponse()), 400));
  else
    return Future.value(http.Response(json.encode(errorResponse()), 400));
}

Future postDataRequest(url, body) async {
  //GlobalKey<ScaffoldState> _scaffoldKey;
  print(BASE_URL + url);
  print(body);
  final http.Response response = await http
      .post(Uri.parse(BASE_URL + url),
          body: json.encode(body), headers: await getHeaders())
      .timeout(TIMEOUT, onTimeout: () {
    return Future.value(http.Response(json.encode(timeoutResponse()), 400));
  }).catchError((error) {
    return getErrorMessage(error);
  });
  print("BODY ${response.body}");
  print("STATUS CODE ${response.statusCode}");
  dynamic responseBody = json.decode(response.body);
  if (response.statusCode < 300 && response.statusCode >= 200) {
    return responseBody;
  } else {
    return errorResponse();
  }
}

Future<Map<String, dynamic>> postProfileData(String url, userId, typeOfPlayer,
    position, age, weight, height, nationality, images, files) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  List<MultipartFile> multipartImageList = [];
  List<MultipartFile> multipartVideoList = [];

  if (images.length > 0) {
    for (Asset asset in images) {
      ByteData byteData = await asset.getByteData();
      List<int> imageData = byteData.buffer.asUint8List();
      MultipartFile multipartFile =
          new MultipartFile.fromBytes(imageData, filename: asset.name);
      multipartImageList.add(multipartFile);
    }
  }
  if (files.length > 0) {
    for (int i = 0; i < files.length; i++) {
      MultipartFile multipartFile = await MultipartFile.fromFile(files[i].path,
          filename: files[0].path.split('/').last);
      multipartVideoList.add(multipartFile);
    }
  }
  Dio dio = new Dio(BaseOptions(
    connectTimeout: 15000,
    receiveTimeout: 16000,
    headers: {
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.authorizationHeader: prefs.getString('token')
    },
    validateStatus: (_) => true,
  ));

  try {
    FormData formData = new FormData.fromMap({
      "user_id": userId,
      "type_of_player": typeOfPlayer,
      "position": position,
      "age": age,
      "weight": weight,
      "height": height,
      "nationality": nationality,
      "photo[]": multipartImageList,
      "skill_video[]": multipartVideoList
    });
    Response response = await dio.post(BASE_URL + url, data: formData,
        onSendProgress: (int sent, int total) {
      print("$sent $total");
    });
    if (response.statusCode! < 300 && response.statusCode! >= 200) {
      print(response.data);
      return response.data;
    }

    return response.data;
  } on DioError catch (e) {
    if (e.type == DioErrorType.connectTimeout) {
      return timeoutResponse();
    } else {
      return errorResponse();
    }
  }
}
