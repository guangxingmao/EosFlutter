import 'package:eos_flutter/common/localization/default_localizations.dart';
import 'package:eos_flutter/common/style/mgx_string_base.dart';
import 'package:eos_flutter/common/style/mgx_style.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CommonUtils {
  static MgxStringBase getLocale(BuildContext context) {
    return MgxLocalizations.of(context).currentLocalized;
  }

  static getThemeData(Color color) {
    return ThemeData(primaryColor: color);
  }

  static showErrorToast(msg) {
    Fluttertoast.showToast(
      msg: msg,
      backgroundColor: Color(MgxColor.primary_colors_red),
      gravity: ToastGravity.CENTER,
      fontSize: 16,
      textColor: Color(MgxColor.white),
    );
  }

  static showSuccessToast(msg) {
    Fluttertoast.showToast(
      msg: msg,
      backgroundColor: Color(MgxColor.primary_colors_green),
      gravity: ToastGravity.CENTER,
      fontSize: 16,
      textColor: Color(MgxColor.white),
    );
  }
}
