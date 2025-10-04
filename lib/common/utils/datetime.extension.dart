import 'package:flutter/material.dart';

const Locale defaultLocale = const Locale("fr", "FR");

String get locale => defaultLocale.languageCode;

String getDate(DateTime dateTime){
  return "${numbeFormat(dateTime.day)}/${numbeFormat(dateTime.month)}/${dateTime.year}";
}

String getHour(DateTime dateTime){
  return "${numbeFormat(dateTime.hour)}:${numbeFormat(dateTime.minute)}";
}

String numbeFormat(int nb){
  return "${nb < 10 ? '0${nb}' : nb }";
}