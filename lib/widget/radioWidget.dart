import 'package:flutter/material.dart';
import 'package:vamos/ui/utils/color.dart';

Widget radioWidget(
    String value, String groupValue, Function(String?) onChanged) {
  return Container(
    padding: EdgeInsets.only(left: 10),
    child: Row(
      children: [
        Transform.scale(
          scale: 1.35,
          child: Radio(
              splashRadius: 15,
              fillColor: MaterialStateProperty.all(profileContainerColor),
              value: value,
              groupValue: groupValue,
              onChanged: onChanged),
        ),
        Text(
          value,
          style: TextStyle(fontSize: 15, color: lightGrey),
        )
      ],
    ),
  );
}
