import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/chat_thread/chat_thread_widget.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart'
    show TutorialCoachMark;
import 'trash_me_widget.dart' show TrashMeWidget;
import 'package:flutter/material.dart';

class TrashMeModel extends FlutterFlowModel<TrashMeWidget> {
  ///  Local state fields for this page.

  List<MessagesStruct> messages = [];
  void addToMessages(MessagesStruct item) => messages.add(item);
  void removeFromMessages(MessagesStruct item) => messages.remove(item);
  void removeAtIndexFromMessages(int index) => messages.removeAt(index);
  void insertAtIndexInMessages(int index, MessagesStruct item) =>
      messages.insert(index, item);
  void updateMessagesAtIndex(int index, Function(MessagesStruct) updateFn) =>
      messages[index] = updateFn(messages[index]);

  bool isLoading = false;

  String? typedMessage;

  bool showConfetti = false;

  int? adGap = 0;

  bool focusTextField = true;

  List<AdManagementRecord> inChatAds = [];
  void addToInChatAds(AdManagementRecord item) => inChatAds.add(item);
  void removeFromInChatAds(AdManagementRecord item) => inChatAds.remove(item);
  void removeAtIndexFromInChatAds(int index) => inChatAds.removeAt(index);
  void insertAtIndexInInChatAds(int index, AdManagementRecord item) =>
      inChatAds.insert(index, item);
  void updateInChatAdsAtIndex(
          int index, Function(AdManagementRecord) updateFn) =>
      inChatAds[index] = updateFn(inChatAds[index]);

  ///  State fields for stateful widgets in this page.

  TutorialCoachMark? sharingIsCaringController;
  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Firestore Query - Query a collection] action in Trash_Me widget.
  List<AdManagementRecord>? inChatAdsFromQuery;
  // Models for chatThread dynamic component.
  late FlutterFlowDynamicModels<ChatThreadModel> chatThreadModels;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - API (Chat Bot)] action in TextField widget.
  ApiCallResponse? responseCopy;
  // Stores action output result for [Backend Call - API (Chat Bot)] action in Container widget.
  ApiCallResponse? responseCopy2;

  @override
  void initState(BuildContext context) {
    chatThreadModels = FlutterFlowDynamicModels(() => ChatThreadModel());
  }

  @override
  void dispose() {
    sharingIsCaringController?.finish();
    unfocusNode.dispose();
    chatThreadModels.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
