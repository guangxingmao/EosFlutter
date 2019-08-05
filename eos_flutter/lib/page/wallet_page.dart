import 'package:eos_flutter/common/style/mgx_style.dart';
import 'package:eos_flutter/common/utils/common_utils.dart';
import 'package:eos_flutter/common/utils/navigator_utils.dart';
import 'package:eos_flutter/widget/mgx_item_widget.dart';
import 'package:eos_flutter/widget/mgx_material_widget.dart';
import 'package:flutter/material.dart';

import 'import_wallet_ways_page.dart';

class WalletPage extends StatelessWidget {
  static final sName = '/wallet';

  @override
  Widget build(BuildContext context) {
    return MgxMaterialWidget(
      context,
      CommonUtils.getLocale(context).eos_wallet_title,
      needLeftBtn: false,
      body: Column(
        children: <Widget>[
          MgxItemWidget(
            CommonUtils.getLocale(context).create_eos_account_placeholder,
            iconData: Icons.add,
            onPress: () {},
          ),
          MgxItemWidget(
            CommonUtils.getLocale(context).import_eos_account_placeholder,
            iconData: Icons.arrow_forward,
            onPress: () {
              NavigatorUtils.navigatorRouter(context, ImportWalletWaysPage());
            },
          )
        ],
      ),
    );
  }
}
