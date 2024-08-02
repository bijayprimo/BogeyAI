// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class MessagesStruct extends FFFirebaseStruct {
  MessagesStruct({
    String? message,
    bool? isUser,
    DateTime? createdTime,
    bool? isLoading,
    bool? isAd,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _message = message,
        _isUser = isUser,
        _createdTime = createdTime,
        _isLoading = isLoading,
        _isAd = isAd,
        super(firestoreUtilData);

  // "message" field.
  String? _message;
  String get message => _message ?? '';
  set message(String? val) => _message = val;

  bool hasMessage() => _message != null;

  // "is_user" field.
  bool? _isUser;
  bool get isUser => _isUser ?? false;
  set isUser(bool? val) => _isUser = val;

  bool hasIsUser() => _isUser != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  set createdTime(DateTime? val) => _createdTime = val;

  bool hasCreatedTime() => _createdTime != null;

  // "isLoading" field.
  bool? _isLoading;
  bool get isLoading => _isLoading ?? false;
  set isLoading(bool? val) => _isLoading = val;

  bool hasIsLoading() => _isLoading != null;

  // "isAd" field.
  bool? _isAd;
  bool get isAd => _isAd ?? false;
  set isAd(bool? val) => _isAd = val;

  bool hasIsAd() => _isAd != null;

  static MessagesStruct fromMap(Map<String, dynamic> data) => MessagesStruct(
        message: data['message'] as String?,
        isUser: data['is_user'] as bool?,
        createdTime: data['created_time'] as DateTime?,
        isLoading: data['isLoading'] as bool?,
        isAd: data['isAd'] as bool?,
      );

  static MessagesStruct? maybeFromMap(dynamic data) =>
      data is Map ? MessagesStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'message': _message,
        'is_user': _isUser,
        'created_time': _createdTime,
        'isLoading': _isLoading,
        'isAd': _isAd,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'message': serializeParam(
          _message,
          ParamType.String,
        ),
        'is_user': serializeParam(
          _isUser,
          ParamType.bool,
        ),
        'created_time': serializeParam(
          _createdTime,
          ParamType.DateTime,
        ),
        'isLoading': serializeParam(
          _isLoading,
          ParamType.bool,
        ),
        'isAd': serializeParam(
          _isAd,
          ParamType.bool,
        ),
      }.withoutNulls;

  static MessagesStruct fromSerializableMap(Map<String, dynamic> data) =>
      MessagesStruct(
        message: deserializeParam(
          data['message'],
          ParamType.String,
          false,
        ),
        isUser: deserializeParam(
          data['is_user'],
          ParamType.bool,
          false,
        ),
        createdTime: deserializeParam(
          data['created_time'],
          ParamType.DateTime,
          false,
        ),
        isLoading: deserializeParam(
          data['isLoading'],
          ParamType.bool,
          false,
        ),
        isAd: deserializeParam(
          data['isAd'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'MessagesStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is MessagesStruct &&
        message == other.message &&
        isUser == other.isUser &&
        createdTime == other.createdTime &&
        isLoading == other.isLoading &&
        isAd == other.isAd;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([message, isUser, createdTime, isLoading, isAd]);
}

MessagesStruct createMessagesStruct({
  String? message,
  bool? isUser,
  DateTime? createdTime,
  bool? isLoading,
  bool? isAd,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    MessagesStruct(
      message: message,
      isUser: isUser,
      createdTime: createdTime,
      isLoading: isLoading,
      isAd: isAd,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

MessagesStruct? updateMessagesStruct(
  MessagesStruct? messages, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    messages
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addMessagesStructData(
  Map<String, dynamic> firestoreData,
  MessagesStruct? messages,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (messages == null) {
    return;
  }
  if (messages.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && messages.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final messagesData = getMessagesFirestoreData(messages, forFieldValue);
  final nestedData = messagesData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = messages.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getMessagesFirestoreData(
  MessagesStruct? messages, [
  bool forFieldValue = false,
]) {
  if (messages == null) {
    return {};
  }
  final firestoreData = mapToFirestore(messages.toMap());

  // Add any Firestore field values
  messages.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getMessagesListFirestoreData(
  List<MessagesStruct>? messagess,
) =>
    messagess?.map((e) => getMessagesFirestoreData(e, true)).toList() ?? [];
