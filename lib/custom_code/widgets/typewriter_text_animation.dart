// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:typewritertext/typewritertext.dart';

class TypewriterTextAnimation extends StatefulWidget {
  const TypewriterTextAnimation({
    super.key,
    this.width,
    this.height,
    this.text,
  });

  final double? width;
  final double? height;
  final String? text;

  @override
  State<TypewriterTextAnimation> createState() =>
      _TypewriterTextAnimationState();
}

class _TypewriterTextAnimationState extends State<TypewriterTextAnimation> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: TypeWriter.text(
        widget.text!,
        maintainSize: true,
        style: FlutterFlowTheme.of(context).labelLarge.override(
              fontFamily: 'SF pro',
              color: FlutterFlowTheme.of(context).info,
              fontSize: 16,
              letterSpacing: 0,
              fontWeight: FontWeight.w100,
              useGoogleFonts: false,
            ),
        duration: const Duration(milliseconds: 1),
      ),
    );
  }
}
// Set your widget name, define your parameter, and then add the
// boilerplate code using the green button on the right!
