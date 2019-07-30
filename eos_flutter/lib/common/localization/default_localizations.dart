import 'package:eos_flutter/common/style/mgx_string_base.dart';
import 'package:eos_flutter/common/style/mgx_string_zh.dart';
import 'package:flutter/material.dart';

class MgxLocalizations {
  final Locale locale;

  MgxLocalizations(this.locale);

  //此次可以设置多语言
  static Map<String, MgxStringBase> _localizedValues = {
    'zh': new MgxStringZh(),
  };

  MgxStringBase get currentLocalized {
    return _localizedValues[locale.languageCode];
  }

  ///通过 Localizations 加载当前的 MgxLocalizations
  static MgxLocalizations of(BuildContext context) {
    return Localizations.of(context, MgxLocalizations);
  }
}