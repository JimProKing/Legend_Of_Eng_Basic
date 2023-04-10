import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import '/backend/supabase/supabase.dart';

double? wordC(List<String>? intList) {
  if (intList == null) {
    return 0.0;
  }
  double dividedValue = intList.length / 30.0;
  return dividedValue;
}

double? lcalculator(
  int? l1,
  int? l2,
  int? l3,
  int? l4,
) {
  if (l1 == null) {
    l1 = 0;
  }
  if (l2 == null) {
    l2 = 0;
  }
  if (l3 == null) {
    l3 = 0;
  }
  if (l4 == null) {
    l4 = 0;
  }
  int sum = l1 + l2 + l3 + l4;
  double result = sum * 0.25;
  return result;
}

double? fReading(List<int>? list) {
  if (list == null || list.isEmpty) {
    return 0.0;
  }

  return list.length / 8.0;
}

String? percent(double? number) {
  if (number == null) {
    number = 0;
  }
  double multipliedValue = number * 100.0;
  double roundedValue = double.parse(multipliedValue.toStringAsFixed(2));
  String formattedValue = roundedValue.toInt().toString() + '%';
  return formattedValue;
}

bool? newCustomFunction(List<String>? lst) {
  if (lst == null) {
    return false;
  } else {
    return lst.length == 30;
  }
}

bool? newCustomFunction2(List<int>? temp) {
  if (temp == null) {
    return false;
  }
  if (temp.length == 7) {
    return true;
  } else {
    return false;
  }
}
