import 'package:flutter/material.dart';

void showErrorSnackbar(GlobalKey<ScaffoldState> _scaffoldKey, String message) {
  // ignore: deprecated_member_use
  _scaffoldKey.currentState!.showSnackBar(SnackBar(
      content: Text(message ?? "Something went wrong! Please try again.")));
}

void showSuccessSnackbar(
    GlobalKey<ScaffoldState> _scaffoldKey, String message) {
  _scaffoldKey.currentState!
      // ignore: deprecated_member_use
      .showSnackBar(SnackBar(content: Text(message ?? "Success!")));
}

void showCustomSnackbar(GlobalKey<ScaffoldState> _scaffoldKey, String message) {
  // ignore: deprecated_member_use
  _scaffoldKey.currentState!.showSnackBar(SnackBar(
      backgroundColor: Colors.black,
      content: Text(
        message,
        style: TextStyle(color: Colors.amber),
      )));
}


// import 'package:flutter/material.dart';

// void showErrorSnackbar(GlobalKey<ScaffoldState> _scaffoldKey, String message) {
//   ScaffoldMessenger.of(_scaffoldKey.currentContext).showSnackBar(SnackBar(
//       content: Text(message ?? "Something went wrong! Please try again.")));
// }

// void showSuccessSnackbar(
//     GlobalKey<ScaffoldState> _scaffoldKey, String message) {
//   ScaffoldMessenger.of(_scaffoldKey.currentContext)
//       .showSnackBar(SnackBar(content: Text(message ?? "Success!")));
// }

// void showCustomSnackbar(GlobalKey<ScaffoldState> _scaffoldKey, String message) {
//   ScaffoldMessenger.of(_scaffoldKey.currentContext).showSnackBar(SnackBar(
//       backgroundColor: Colors.black,
//       content: Text(
//         message,
//         style: TextStyle(color: Colors.amber),
//       )));
// }
