import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserFeedbackRecord extends FirestoreRecord {
  UserFeedbackRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "selection" field.
  String? _selection;
  String get selection => _selection ?? '';
  bool hasSelection() => _selection != null;

  // "createdAt" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

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

  // "feedback" field.
  String? _feedback;
  String get feedback => _feedback ?? '';
  bool hasFeedback() => _feedback != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  void _initializeFields() {
    _selection = snapshotData['selection'] as String?;
    _createdAt = snapshotData['createdAt'] as DateTime?;
    _firstName = snapshotData['first_name'] as String?;
    _lastName = snapshotData['last_name'] as String?;
    _email = snapshotData['email'] as String?;
    _feedback = snapshotData['feedback'] as String?;
    _name = snapshotData['name'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('user_feedback');

  static Stream<UserFeedbackRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UserFeedbackRecord.fromSnapshot(s));

  static Future<UserFeedbackRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UserFeedbackRecord.fromSnapshot(s));

  static UserFeedbackRecord fromSnapshot(DocumentSnapshot snapshot) =>
      UserFeedbackRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UserFeedbackRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UserFeedbackRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UserFeedbackRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UserFeedbackRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUserFeedbackRecordData({
  String? selection,
  DateTime? createdAt,
  String? firstName,
  String? lastName,
  String? email,
  String? feedback,
  String? name,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'selection': selection,
      'createdAt': createdAt,
      'first_name': firstName,
      'last_name': lastName,
      'email': email,
      'feedback': feedback,
      'name': name,
    }.withoutNulls,
  );

  return firestoreData;
}

class UserFeedbackRecordDocumentEquality
    implements Equality<UserFeedbackRecord> {
  const UserFeedbackRecordDocumentEquality();

  @override
  bool equals(UserFeedbackRecord? e1, UserFeedbackRecord? e2) {
    return e1?.selection == e2?.selection &&
        e1?.createdAt == e2?.createdAt &&
        e1?.firstName == e2?.firstName &&
        e1?.lastName == e2?.lastName &&
        e1?.email == e2?.email &&
        e1?.feedback == e2?.feedback &&
        e1?.name == e2?.name;
  }

  @override
  int hash(UserFeedbackRecord? e) => const ListEquality().hash([
        e?.selection,
        e?.createdAt,
        e?.firstName,
        e?.lastName,
        e?.email,
        e?.feedback,
        e?.name
      ]);

  @override
  bool isValidKey(Object? o) => o is UserFeedbackRecord;
}
