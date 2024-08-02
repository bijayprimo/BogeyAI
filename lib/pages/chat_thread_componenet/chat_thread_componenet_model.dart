import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/chat_thread/chat_thread_widget.dart';
import 'chat_thread_componenet_widget.dart' show ChatThreadComponenetWidget;
import 'package:flutter/material.dart';

class ChatThreadComponenetModel
    extends FlutterFlowModel<ChatThreadComponenetWidget> {
  ///  Local state fields for this component.

  List<MessagesStruct> messages = [];
  void addToMessages(MessagesStruct item) => messages.add(item);
  void removeFromMessages(MessagesStruct item) => messages.remove(item);
  void removeAtIndexFromMessages(int index) => messages.removeAt(index);
  void insertAtIndexInMessages(int index, MessagesStruct item) =>
      messages.insert(index, item);
  void updateMessagesAtIndex(int index, Function(MessagesStruct) updateFn) =>
      messages[index] = updateFn(messages[index]);

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // Models for chatThread dynamic component.
  late FlutterFlowDynamicModels<ChatThreadModel> chatThreadModels;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - API (Chat Bot)] action in Image widget.
  ApiCallResponse? response;

  @override
  void initState(BuildContext context) {
    chatThreadModels = FlutterFlowDynamicModels(() => ChatThreadModel());
  }

  @override
  void dispose() {
    chatThreadModels.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
