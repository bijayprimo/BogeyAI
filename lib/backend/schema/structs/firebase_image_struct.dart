// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class FirebaseImageStruct extends FFFirebaseStruct {
  FirebaseImageStruct({
    String? name,
    String? downloadURL,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _name = name,
        _downloadURL = downloadURL,
        super(firestoreUtilData);

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "downloadURL" field.
  String? _downloadURL;
  String get downloadURL => _downloadURL ?? '';
  set downloadURL(String? val) => _downloadURL = val;

  bool hasDownloadURL() => _downloadURL != null;

  static FirebaseImageStruct fromMap(Map<String, dynamic> data) =>
      FirebaseImageStruct(
        name: data['name'] as String?,
        downloadURL: data['downloadURL'] as String?,
      );

  static FirebaseImageStruct? maybeFromMap(dynamic data) => data is Map
      ? FirebaseImageStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'downloadURL': _downloadURL,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'downloadURL': serializeParam(
          _downloadURL,
          ParamType.String,
        ),
      }.withoutNulls;

  static FirebaseImageStruct fromSerializableMap(Map<String, dynamic> data) =>
      FirebaseImageStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        downloadURL: deserializeParam(
          data['downloadURL'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'FirebaseImageStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is FirebaseImageStruct &&
        name == other.name &&
        downloadURL == other.downloadURL;
  }

  @override
  int get hashCode => const ListEquality().hash([name, downloadURL]);
}

FirebaseImageStruct createFirebaseImageStruct({
  String? name,
  String? downloadURL,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    FirebaseImageStruct(
      name: name,
      downloadURL: downloadURL,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

FirebaseImageStruct? updateFirebaseImageStruct(
  FirebaseImageStruct? firebaseImage, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    firebaseImage
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addFirebaseImageStructData(
  Map<String, dynamic> firestoreData,
  FirebaseImageStruct? firebaseImage,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (firebaseImage == null) {
    return;
  }
  if (firebaseImage.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && firebaseImage.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final firebaseImageData =
      getFirebaseImageFirestoreData(firebaseImage, forFieldValue);
  final nestedData =
      firebaseImageData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = firebaseImage.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getFirebaseImageFirestoreData(
  FirebaseImageStruct? firebaseImage, [
  bool forFieldValue = false,
]) {
  if (firebaseImage == null) {
    return {};
  }
  final firestoreData = mapToFirestore(firebaseImage.toMap());

  // Add any Firestore field values
  firebaseImage.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getFirebaseImageListFirestoreData(
  List<FirebaseImageStruct>? firebaseImages,
) =>
    firebaseImages
        ?.map((e) => getFirebaseImageFirestoreData(e, true))
        .toList() ??
    [];
