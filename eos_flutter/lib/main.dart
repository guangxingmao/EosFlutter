import 'dart:async';

import 'package:eos_flutter/page/main_page.dart';
import 'package:eos_flutter/page/splash_page.dart';
import 'package:eos_flutter/page/wallet_page.dart';
import 'package:eos_flutter/widget/mgx_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import 'common/localization/mgx_localizations_delegate.dart';
import 'common/model/eos.dart';
import 'common/redux/mgx_state.dart';
import 'common/style/mgx_style.dart';
import 'common/utils/common_utils.dart';

void main() {
  runZoned(() {
    runApp(new FlutterEosApp());
  }, onError: (Object obj, StackTrace stack) {
    //在onError中捕获未捕获的异常,可以作为日志上传
    print(obj);
    print(stack);
  });
}

class FlutterEosApp extends StatelessWidget {
  final store = new Store<MgxState>(
    appReducer,
    initialState: new MgxState(
        eos: Eos.empty(),
        locale: Locale("zh", "CH"),
        themeData: ThemeData(primaryColor: Color(MgxColor.colorPrimaryDark))),
  );

  FlutterEosApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new StoreProvider(
        store: store,
        child: new StoreBuilder<MgxState>(builder: (context, store) {
          return MaterialApp(
            localizationsDelegates: [
              MgxLocalizationsDelegate.delegate,
            ],
            locale: store.state.locale,
            supportedLocales: [store.state.locale],
            theme: store.state.themeData,
            routes: {
              //通过Name跳转，需要先注册路由，关联Name和界面
              SplashPage.sName: (_) => SplashPage(),
              WalletPage.sName: (_) => WalletPage(),
              MainPage.sName: (_) => MainPage()
            },
            home: new SplashPage(),
          );
        }));
  }
}
