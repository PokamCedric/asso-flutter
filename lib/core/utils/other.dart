import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class Other {
  static fieldFocusChange(
    BuildContext context,
    FocusNode current,
    FocusNode next,
  ) {
    current.unfocus();
    FocusScope.of(context).requestFocus(next);
  }

  static hiddenKeyboard(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
  }

  static String formatDate(DateTime date) {
    final format = DateFormat.yMMMd('en_US');
    return format.format(date);
  }

  ///Singleton factory
  static final Other _instance = Other._internal();

  factory Other() {
    return _instance;
  }

  Other._internal();
}
