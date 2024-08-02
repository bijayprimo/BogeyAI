import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PopupFromDataRecord extends FirestoreRecord {
  PopupFromDataRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "first_name" field.
  String? _firstName;
  String get firstName => _firstName ?? '';
  bool hasFirstName() => _firstName != null;

  // "last_name" field.
  String? _lastName;
  String get lastName => _lastName ?? '';
  bool hasLastName() => _lastName != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  void _initializeFields() {
    _firstName = snapshotData['first_name'] as String?;
    _lastName = snapshotData['last_name'] as String?;
    _email = snapshotData['email'] as String?;
    _createdAt = snapshotData['created_at'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('popup_from_data');

  static Stream<PopupFromDataRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PopupFromDataRecord.fromSnapshot(s));

  static Future<PopupFromDataRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PopupFromDataRecord.fromSnapshot(s));

  static PopupFromDataRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PopupFromDataRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PopupFromDataRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PopupFromDataRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PopupFromDataRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PopupFromDataRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPopupFromDataRecordData({
  String? firstName,
  String? lastName,
  String? email,
  DateTime? createdAt,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'first_name': firstName,
      'last_name': lastName,
      'email': email,
      'created_at': createdAt,
    }.withoutNulls,
  );

  return firestoreData;
}

class PopupFromDataRecordDocumentEquality
    implements Equality<PopupFromDataRecord> {
  const PopupFromDataRecordDocumentEquality();

  @override
  bool equals(PopupFromDataRecord? e1, PopupFromDataRecord? e2) {
    return e1?.firstName == e2?.firstName &&
        e1?.lastName == e2?.lastName &&
        e1?.email == e2?.email &&
        e1?.createdAt == e2?.createdAt;
  }

  @override
  int hash(PopupFromDataRecord? e) => const ListEquality()
      .hash([e?.firstName, e?.lastName, e?.email, e?.createdAt]);

  @override
  bool isValidKey(Object? o) => o is PopupFromDataRecord;
}
