import '/flutter_flow/flutter_flow_util.dart';
import 'forget_password_page_widget.dart' show ForgetPasswordPageWidget;
import 'package:flutter/material.dart';

class ForgetPasswordPageModel
    extends FlutterFlowModel<ForgetPasswordPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for txtEmail widget.
  FocusNode? txtEmailFocusNode;
  TextEditingController? txtEmailTextController;
  String? Function(BuildContext, String?)? txtEmailTextControllerValidator;
  String? _txtEmailTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Email is required';
    }

    if (val.length > 256) {
      return 'Email characters should not exceed 256.';
    }
    if (!RegExp('^[\\w\\.]+@([\\w-]+\\.)+[\\w-]{2,4}\$').hasMatch(val)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  @override
  void initState(BuildContext context) {
    txtEmailTextControllerValidator = _txtEmailTextControllerValidator;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    txtEmailFocusNode?.dispose();
    txtEmailTextController?.dispose();
  }
}
