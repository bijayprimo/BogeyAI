import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MessagesRecord extends FirestoreRecord {
  MessagesRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "message" field.
  String? _message;
  String get message => _message ?? '';
  bool hasMessage() => _message != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "chatSessionRef" field.
  DocumentReference? _chatSessionRef;
  DocumentReference? get chatSessionRef => _chatSessionRef;
  bool hasChatSessionRef() => _chatSessionRef != null;

  // "createdBy" field.
  DocumentReference? _createdBy;
  DocumentReference? get createdBy => _createdBy;
  bool hasCreatedBy() => _createdBy != null;

  // "isBotMessage" field.
  bool? _isBotMessage;
  bool get isBotMessage => _isBotMessage ?? false;
  bool hasIsBotMessage() => _isBotMessage != null;

  void _initializeFields() {
    _message = snapshotData['message'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _chatSessionRef = snapshotData['chatSessionRef'] as DocumentReference?;
    _createdBy = snapshotData['createdBy'] as DocumentReference?;
    _isBotMessage = snapshotData['isBotMessage'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('messages');

  static Stream<MessagesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MessagesRecord.fromSnapshot(s));

  static Future<MessagesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MessagesRecord.fromSnapshot(s));

  static MessagesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MessagesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MessagesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MessagesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MessagesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MessagesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMessagesRecordData({
  String? message,
  DateTime? createdTime,
  DocumentReference? chatSessionRef,
  DocumentReference? createdBy,
  bool? isBotMessage,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'message': message,
      'created_time': createdTime,
      'chatSessionRef': chatSessionRef,
      'createdBy': createdBy,
      'isBotMessage': isBotMessage,
    }.withoutNulls,
  );

  return firestoreData;
}

class MessagesRecordDocumentEquality implements Equality<MessagesRecord> {
  const MessagesRecordDocumentEquality();

  @override
  bool equals(MessagesRecord? e1, MessagesRecord? e2) {
    return e1?.message == e2?.message &&
        e1?.createdTime == e2?.createdTime &&
        e1?.chatSessionRef == e2?.chatSessionRef &&
        e1?.createdBy == e2?.createdBy &&
        e1?.isBotMessage == e2?.isBotMessage;
  }

  @override
  int hash(MessagesRecord? e) => const ListEquality().hash([
        e?.message,
        e?.createdTime,
        e?.chatSessionRef,
        e?.createdBy,
        e?.isBotMessage
      ]);

  @override
  bool isValidKey(Object? o) => o is MessagesRecord;
}
