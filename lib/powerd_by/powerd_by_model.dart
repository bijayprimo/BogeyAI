import '/flutter_flow/flutter_flow_util.dart';
import 'powerd_by_widget.dart' show PowerdByWidget;
import 'package:flutter/material.dart';

class PowerdByModel extends FlutterFlowModel<PowerdByWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
