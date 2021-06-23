import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
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
  if (response.statusCode < 300 && response.statusCode >= 200) {
    Map<String, dynamic> responseBody = json.decode(response.body);

    if (responseBody['status'] == 'success' ||
        responseBody['status'] == 'error') {
      responseBody.putIfAbsent("success", () => true);
    }
    return responseBody;
  } else {
    return errorResponse();
  }
}

Map<String, dynamic> timeoutResponse() {
  return {
    "success": false,
    "msg": "Please check your network connection and try again.",
  };
}

Map<String, dynamic> errorResponse() {
  return {"success": false, "msg": "Something went wrong, please try again."};
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
