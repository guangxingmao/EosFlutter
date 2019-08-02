import 'package:eos_flutter/common/utils/common_utils.dart';
import 'package:eos_flutter/widget/mgx_material_widget.dart';
import 'package:flutter/material.dart';

import 'body/import_wallet_by_privatekey_body.dart';

class ImportWalletByPrivateKeyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MgxMaterialWidget(
      context,
      CommonUtils.getLocale(context).import_eos_by_privatekey,
      needLeftBtn: true,
      body: ImportWalletByPrivateBody(context),
    );
  }
}
