import 'package:eos_flutter/page/main_page.dart';
import 'package:eos_flutter/page/wallet_page.dart';
import 'package:flutter/cupertino.dart';

class NavigatorUtils {


  ///主页
  static goMain(BuildContext context) {
    Navigator.pushReplacementNamed(context, MainPage.sName);  ///这种方法会替换
  }

  ///选择钱包页面
  static void goWallet(BuildContext context) {
    Navigator.pushReplacementNamed(context, WalletPage.sName);

  }

  ///公共打开方法
  static navigatorRouter(BuildContext context, Widget widget) {
    return Navigator.push(context,
        new CupertinoPageRoute(builder: (context) => pageContainer(widget)));
  }

  ///Page页面的容器，做一次通用自定义
  static Widget pageContainer(widget) {
    return MediaQuery(

      ///不受系统字体缩放影响
        data: MediaQueryData.fromWindow(WidgetsBinding.instance.window)
            .copyWith(textScaleFactor: 1),
        child: widget);
  }
}