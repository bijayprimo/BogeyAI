import '/flutter_flow/flutter_flow_util.dart';
import 'sign_up_page_widget.dart' show SignUpPageWidget;
import 'package:flutter/material.dart';

class SignUpPageModel extends FlutterFlowModel<SignUpPageWidget> {
  ///  Local state fields for this page.

  bool isEmailSignup = false;

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
      return 'Email length should not exceed 256.';
    }
    if (!RegExp('^[\\w\\.]+@([\\w-]+\\.)+[\\w-]{2,4}\$').hasMatch(val)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  // State field(s) for txtPassword widget.
  FocusNode? txtPasswordFocusNode;
  TextEditingController? txtPasswordTextController;
  late bool txtPasswordVisibility;
  String? Function(BuildContext, String?)? txtPasswordTextControllerValidator;
  String? _txtPasswordTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Password is required';
    }

    if (val.length < 8) {
      return 'Password must be at least 8 characters.';
    }
    if (val.length > 16) {
      return 'Password length should not exceed 16 characters.';
    }

    return null;
  }

  // State field(s) for txtConfirmPassword widget.
  FocusNode? txtConfirmPasswordFocusNode;
  TextEditingController? txtConfirmPasswordTextController;
  late bool txtConfirmPasswordVisibility;
  String? Function(BuildContext, String?)?
      txtConfirmPasswordTextControllerValidator;
  String? _txtConfirmPasswordTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Confirm Password is required';
    }

    if (val.length < 8) {
      return 'Confirm Password must be at least 8 characters.';
    }
    if (val.length > 16) {
      return 'Confirm Password length should not exceed 256 characters.';
    }

    return null;
  }

  @override
  void initState(BuildContext context) {
    txtEmailTextControllerValidator = _txtEmailTextControllerValidator;
    txtPasswordVisibility = false;
    txtPasswordTextControllerValidator = _txtPasswordTextControllerValidator;
    txtConfirmPasswordVisibility = false;
    txtConfirmPasswordTextControllerValidator =
        _txtConfirmPasswordTextControllerValidator;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    txtEmailFocusNode?.dispose();
    txtEmailTextController?.dispose();

    txtPasswordFocusNode?.dispose();
    txtPasswordTextController?.dispose();

    txtConfirmPasswordFocusNode?.dispose();
    txtConfirmPasswordTextController?.dispose();
  }
}
