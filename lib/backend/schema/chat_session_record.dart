import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ChatSessionRecord extends FirestoreRecord {
  ChatSessionRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  bool hasType() => _type != null;

  // "query_namespace" field.
  String? _queryNamespace;
  String get queryNamespace => _queryNamespace ?? '';
  bool hasQueryNamespace() => _queryNamespace != null;

  // "upserted_date" field.
  DateTime? _upsertedDate;
  DateTime? get upsertedDate => _upsertedDate;
  bool hasUpsertedDate() => _upsertedDate != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  void _initializeFields() {
    _type = snapshotData['type'] as String?;
    _queryNamespace = snapshotData['query_namespace'] as String?;
    _upsertedDate = snapshotData['upserted_date'] as DateTime?;
    _name = snapshotData['name'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('chat_session');

  static Stream<ChatSessionRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ChatSessionRecord.fromSnapshot(s));

  static Future<ChatSessionRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ChatSessionRecord.fromSnapshot(s));

  static ChatSessionRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ChatSessionRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ChatSessionRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ChatSessionRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ChatSessionRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ChatSessionRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createChatSessionRecordData({
  String? type,
  String? queryNamespace,
  DateTime? upsertedDate,
  String? name,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'type': type,
      'query_namespace': queryNamespace,
      'upserted_date': upsertedDate,
      'name': name,
    }.withoutNulls,
  );

  return firestoreData;
}

class ChatSessionRecordDocumentEquality implements Equality<ChatSessionRecord> {
  const ChatSessionRecordDocumentEquality();

  @override
  bool equals(ChatSessionRecord? e1, ChatSessionRecord? e2) {
    return e1?.type == e2?.type &&
        e1?.queryNamespace == e2?.queryNamespace &&
        e1?.upsertedDate == e2?.upsertedDate &&
        e1?.name == e2?.name;
  }

  @override
  int hash(ChatSessionRecord? e) => const ListEquality()
      .hash([e?.type, e?.queryNamespace, e?.upsertedDate, e?.name]);

  @override
  bool isValidKey(Object? o) => o is ChatSessionRecord;
}
