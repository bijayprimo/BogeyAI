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

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!

import 'dart:html' as html;
import 'dart:typed_data';

import 'package:flutter/services.dart' show rootBundle;

Future<void> shareContentOnWeb() async {
  final byteData = await rootBundle.load('assets/images/app_launcher_icon.png');
  final bytes = Uint8List.view(byteData.buffer);
  final blob = html.Blob([bytes]);
  final imageUrl = html.Url.createObjectUrlFromBlob(blob);

  try {
    await html.window.navigator.share({
      'title': 'Join the Rival Slam App.',
      'text': 'Join the Rival Slam App.\nhttps://slammie.ai/',
      'url': 'https://slammie.ai/',
      'files': [
        html.File([bytes], 'Image.jpg', {'type': 'image/jpeg'})
      ],
    });
  } catch (e) {
    print('Error sharing content: $e');
  } finally {
    html.Url.revokeObjectUrl(imageUrl);
  }
}
