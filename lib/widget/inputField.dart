import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:vamos/ui/utils/color.dart';

Widget inputField(String placeholderText, Function(String)? onChange,
    {TextInputType? keyType, String? Function(String?)? validate}) {
  return TextFormField(
    validator: validate,
    onChanged: onChange,
    keyboardType: keyType,
    style: TextStyle(color: inputText),
    decoration: InputDecoration(
      labelText: '$placeholderText',
    ),
  );
}

Widget inputPasswordField(String placeholderText, Function(String)? onChange,
    {TextInputType? keyType, String? Function(String?)? validate}) {
  return TextFormField(
    validator: validate,
    onChanged: onChange,
    obscuringCharacter: '*',
    obscureText: true,
    keyboardType: keyType,
    style: TextStyle(color: inputText),
    decoration: InputDecoration(
      labelText: '$placeholderText',
    ),
  );
}

class RegisterPageTextField extends StatelessWidget {
  final label;
  final obscureText;
  final otpvalue;
  RegisterPageTextField(
      {@required this.label, this.obscureText = false, this.otpvalue});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
      child: TextField(
        obscureText: obscureText,
        controller: TextEditingController(text: otpvalue),
        obscuringCharacter: "*",
        style: TextStyle(color: inputText),
        decoration: InputDecoration(
          labelText: label,
        ),
      ),
    );
  }
}
