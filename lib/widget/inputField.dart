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
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: inputText),
      ),
      labelText: '$placeholderText',
      labelStyle: TextStyle(
        color: labelText,
      ),
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
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: inputText),
      ),
      labelText: '$placeholderText',
      labelStyle: TextStyle(
        color: labelText,
      ),
    ),
  );
}
