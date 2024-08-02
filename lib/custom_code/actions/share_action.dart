// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/rendering.dart';
import 'package:share_plus/share_plus.dart';
import 'package:flutter/services.dart';

Future<void> shareAction() async {
  try {
    await Share.share(
        "Hey, I just got slammed by a trash-talkin' AI chatbot. See if you can fleece it. Have fun chirpin' https://slammie.ai/",
        subject: "Share Slammie");
    // Clipboard.setData(
    //         ClipboardData(text: "${"Try Slammy - AI trash talking sortsbuddy"}\n${"https://slammie.ai/"}"))
    //     .then((value) {
    //   ScaffoldMessenger.of(context!).showSnackBar(
    //     SnackBar(
    //       content: Text(
    //         "If Referral link not send, Please paste it manually.",
    //         style: TextStyle(
    //           color: FlutterFlowTheme.of(context).accent4,
    //         ),
    //       ),
    //       duration: const Duration(milliseconds: 4000),
    //       backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
    //     ),
    //   );
    // });
    // context.goNamedAuth('HomePage', context.mounted);
  } catch (e) {
    debugPrint('error sharing: $e');
  }
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
