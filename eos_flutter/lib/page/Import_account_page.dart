import 'package:eos_flutter/common/utils/common_utils.dart';
import 'package:eos_flutter/widget/mgx_btn_widget.dart';
import 'package:eos_flutter/widget/mgx_input_widget.dart';
import 'package:eos_flutter/widget/mgx_loading_widget.dart';
import 'package:eos_flutter/widget/mgx_material_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ImportAccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MgxMaterialWidget(
      context,
      CommonUtils.getLocale(context).import_eos_account_placeholder,
      body: Column(
        children: <Widget>[
          MgxInputWidget(
            CommonUtils.getLocale(context).password_title,
            CommonUtils.getLocale(context).password_placeHolder,
            maxLine: 1,
            isPsd: true,
          ),
          MgxInputWidget(
            CommonUtils.getLocale(context).password_repeat_title,
            CommonUtils.getLocale(context).password_repeat_placeHolder,
            maxLine: 1,
            isPsd: true,
          ),
          MgxBtnWidget(
            CommonUtils.getLocale(context).import_eos_account_placeholder,
          )
        ],
      ),
    );
  }
}
