import 'package:eos_flutter/common/style/mgx_string_base.dart';
import 'package:eos_flutter/common/style/mgx_string_zh.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'default_localizations.dart';

class MgxLocalizationsDelegate extends LocalizationsDelegate<MgxLocalizations> {
  MgxLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    ///支持中文
    return ['zh'].contains(locale.languageCode);
  }

  ///根据locale，创建一个对象用于提供当前locale下的文本显示
  @override
  Future<MgxLocalizations> load(Locale locale) {
    return new SynchronousFuture<MgxLocalizations>(
        new MgxLocalizations(locale));
  }

  @override
  bool shouldReload(LocalizationsDelegate<MgxLocalizations> old) {
    return false;
  }
  ///全局静态的代理
  static MgxLocalizationsDelegate delegate = new MgxLocalizationsDelegate();
}
