import 'package:eos_flutter/common/localization/default_localizations.dart';
import 'package:eos_flutter/common/style/mgx_string_base.dart';
import 'package:flutter/material.dart';

class CommonUtils {
  static MgxStringBase getLocale(BuildContext context) {
    return MgxLocalizations.of(context).currentLocalized;
  }

  static getThemeData(Color color) {
    return ThemeData(primaryColor: color);
  }
}
