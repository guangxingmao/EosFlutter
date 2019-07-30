import 'dart:ui';

import 'package:eos_flutter/common/model/eos.dart';
import 'package:eos_flutter/common/redux/theme_redux.dart';
import 'package:flutter/material.dart';

import 'eos_redux.dart';
import 'locale_redux.dart';

class MgxState {
  /// eos 钱包数据
  Eos eos;

  /// 语言
  Locale locale;

  /// 主题
  ThemeData themeData;

  MgxState({this.eos, this.locale, this.themeData});
}

///创建 Reducer
///源码中 Reducer 是一个方法 typedef State Reducer<State>(State state, dynamic action);
///我们自定义了 appReducer 用于创建 store
MgxState appReducer(MgxState state, action) {
  return MgxState(
    ///通过 EosReducer 将 MgxState 内的 eos 和 action 关联在一起
    eos: EosReducer(state.eos, action),

    ///通过 LocaleReducer 将 MgxState 内的 locale 和 action 关联在一起
    locale: LocaleReducer(state.locale, action),

    ///通过 LocaleReducer 将 MgxState 内的 locale 和 action 关联在一起
    themeData: ThemeDataReducer(state.themeData, action),
  );
}
