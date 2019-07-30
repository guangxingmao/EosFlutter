import 'package:eos_flutter/common/style/mgx_style.dart';
import 'package:eos_flutter/common/utils/common_utils.dart';
import 'package:eos_flutter/widget/mgx_item_widget.dart';
import 'package:eos_flutter/widget/mgx_material_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ImportWalletWays extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MgxMaterialWidget(
      CommonUtils.getLocale(context).import_eos_account_placeholder,
      needLeftBtn: true,
      body: Column(
        children: <Widget>[
          Padding(padding: EdgeInsets.only(top: 24)),
          MgxItemWidget(
            CommonUtils.getLocale(context).import_eos_by_privatekey,
            placeHolderColor: Color(MgxColor.black),
            needLeftIcon: false,
          ),
        ],
      ),
    );
  }
}
