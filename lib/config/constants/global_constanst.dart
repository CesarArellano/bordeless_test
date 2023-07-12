
import 'package:flutter/material.dart' show Color, Colors;
import 'package:intl/intl.dart';

class GlobalConstants {
  static final Map<String, Color> _statusColorMap = {
    'draft': Colors.grey,
    'processing': Colors.blue,
    'approved': Colors.lightGreen,
    'paid': Colors.redAccent,
  };
  static Color getStatusColor( String status ) {
    return _statusColorMap[status] ?? Colors.brown;
  }

  static String convertCurrencyToHumanFormat(int amount) {
    return NumberFormat.currency(
      decimalDigits: 2,
      name: ''  
    ).format(amount);
  }

  static String convertDateTimeToHumanFormat(DateTime dateTime) {
    return DateFormat('dd-MMM-yyyy').format(dateTime);
  }
}