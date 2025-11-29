// ignore_for_file: unused-code

import 'package:flutter/material.dart';

// ignore: prefer-match-file-name
extension EdgeInsetsX on EdgeInsets {
  EdgeInsets get verticalOnly => copyWith(left: 0, right: 0);

  EdgeInsets get horizontalOnly => copyWith(top: 0, bottom: 0);

  EdgeInsets get leftOnly => copyWith(top: 0, right: 0, bottom: 0);

  EdgeInsets get topOnly => copyWith(left: 0, right: 0, bottom: 0);

  EdgeInsets get bottomOnly => copyWith(left: 0, top: 0, right: 0);

  EdgeInsets get rightOnly => copyWith(left: 0, top: 0, bottom: 0);
}
