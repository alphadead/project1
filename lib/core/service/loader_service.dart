import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:vamos/core/service/loader.dart';
import 'package:vamos/ui/shared/loader.dart';
import 'package:vamos/ui/utils/keys.dart';

void setLoader(BuildContext context, bool value) {
  Provider.of<Loader>(context, listen: false).isLoading = value;
  if (value) {
    Dialogs.showLoadingDialog(context, loaderKey);
  } else {
    if (Navigator.canPop(context)) {
      Navigator.of(context, rootNavigator: true).pop();
    }
  }
}
