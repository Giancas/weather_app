import 'package:flutter/material.dart';

import './show_alert_dialog.dart';

Future<void> showExceptionAlert(
        {required BuildContext context, required Exception error}) =>
    showAlertDialog(
        context: context,
        title: 'An error occurred',
        defaultText: error.toString());
