import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AdManagementRecord extends FirestoreRecord {
  AdManagementRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "adName" field.
  String? _adName;
  String get adName => _adName ?? '';
  bool hasAdName() => _adName != null;

  // "adBanner" field.
  List<FirebaseImageStruct>? _adBanner;
  List<FirebaseImageStruct> get adBanner => _adBanner ?? const [];
  bool hasAdBanner() => _adBanner != null;

  // "adOnClickLink" field.
  String? _adOnClickLink;
  String get adOnClickLink => _adOnClickLink ?? '';
  bool hasAdOnClickLink() => _adOnClickLink != null;

  // "adType" field.
  String? _adType;
  String get adType => _adType ?? '';
  bool hasAdType() => _adType != null;

  // "isHtml" field.
  bool? _isHtml;
  bool get isHtml => _isHtml ?? false;
  bool hasIsHtml() => _isHtml != null;

  // "htmlContent" field.
  String? _htmlContent;
  String get htmlContent => _htmlContent ?? '';
  bool hasHtmlContent() => _htmlContent != null;

  void _initializeFields() {
    _adName = snapshotData['adName'] as String?;
    _adBanner = getStructList(
      snapshotData['adBanner'],
      FirebaseImageStruct.fromMap,
    );
    _adOnClickLink = snapshotData['adOnClickLink'] as String?;
    _adType = snapshotData['adType'] as String?;
    _isHtml = snapshotData['isHtml'] as bool?;
    _htmlContent = snapshotData['htmlContent'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('ad_management');

  static Stream<AdManagementRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AdManagementRecord.fromSnapshot(s));

  static Future<AdManagementRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AdManagementRecord.fromSnapshot(s));

  static AdManagementRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AdManagementRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AdManagementRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AdManagementRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AdManagementRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AdManagementRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAdManagementRecordData({
  String? adName,
  String? adOnClickLink,
  String? adType,
  bool? isHtml,
  String? htmlContent,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'adName': adName,
      'adOnClickLink': adOnClickLink,
      'adType': adType,
      'isHtml': isHtml,
      'htmlContent': htmlContent,
    }.withoutNulls,
  );

  return firestoreData;
}

class AdManagementRecordDocumentEquality
    implements Equality<AdManagementRecord> {
  const AdManagementRecordDocumentEquality();

  @override
  bool equals(AdManagementRecord? e1, AdManagementRecord? e2) {
    const listEquality = ListEquality();
    return e1?.adName == e2?.adName &&
        listEquality.equals(e1?.adBanner, e2?.adBanner) &&
        e1?.adOnClickLink == e2?.adOnClickLink &&
        e1?.adType == e2?.adType &&
        e1?.isHtml == e2?.isHtml &&
        e1?.htmlContent == e2?.htmlContent;
  }

  @override
  int hash(AdManagementRecord? e) => const ListEquality().hash([
        e?.adName,
        e?.adBanner,
        e?.adOnClickLink,
        e?.adType,
        e?.isHtml,
        e?.htmlContent
      ]);

  @override
  bool isValidKey(Object? o) => o is AdManagementRecord;
}
