import 'package:get_it/get_it.dart';
import 'package:nucleus_one_dart_sdk/src/common/model.dart';

import '../../nucleus_one_dart_sdk.dart';
import '../api_model/document_for_client.dart' as api_mod;

import '../nucleus_one.dart';
import 'preview_metadata_item.dart';

class DocumentForClientCollection extends EntityCollection<DocumentForClient, void> {
  DocumentForClientCollection({
    NucleusOneAppInternal? app,
    List<DocumentForClient>? items,
  }) : super(app: app, items: items);

  @override
  void toApiModel() =>
      throw UnsupportedError('toApiModel() is not supported for this collection type.');

  // Future<mod.DocumentResults> getNeedSignatureRecent({
  //   String sortType = 'CreatedOn',
  //   bool sortDescending = true,
  //   int? offset,
  //   String? cursor,
  //   bool? singleRecord,
  // }) async {
  //   return _getRecentInternal(
  //     sortType: sortType,
  //     sortDescending: sortDescending,
  //     offset: offset,
  //     cursor: cursor,
  //     singleRecord: singleRecord,
  //     qpAdditional: {
  //       'documentSignatureSessionRecipients': true,
  //       'showForAllTenantMembers': this.props.isAdmin
  //     },
  //   );
  // }

}

class DocumentForClient with NucleusOneAppDependent {
  DocumentForClient._({
    NucleusOneAppInternal? app,
    required this.id,
    required this.documentID,
    required this.createdOn,
    required this.purgeDate,
    required this.name,
    required this.pageCount,
    required this.fileSize,
    required this.thumbnailUrl,
    required this.isSigned,
    required this.classificationID,
    required this.classificationName,
    required this.previewMetadata,
    required this.documentApprovalID,
    required this.documentApprovalCreatedOn,
    required this.documentSubscriptionID,
    required this.documentSubscriptionCreatedOn,
    required this.documentSignatureSessionRecipientID,
    required this.documentSignatureSessionID,
    required this.documentSignatureSessionRecipientEmail,
    required this.documentSignatureSessionRecipientFullName,
    required this.documentSignatureSessionRecipientRequestedOn,
    required this.roleName,
    required this.processName,
    required this.processElementName,
    required this.score,
  }) {
    this.app = app ?? GetIt.instance.get<NucleusOneApp>() as NucleusOneAppInternal;
  }

  DocumentForClient({
    NucleusOneAppInternal? app,
  }) : this._(
          app: app,
          id: '',
          documentID: '',
          createdOn: '',
          purgeDate: '',
          name: '',
          pageCount: 0,
          fileSize: 0,
          thumbnailUrl: '',
          isSigned: false,
          classificationID: '',
          classificationName: '',
          previewMetadata: [],
          documentApprovalID: '',
          documentApprovalCreatedOn: '',
          documentSubscriptionID: '',
          documentSubscriptionCreatedOn: '',
          documentSignatureSessionRecipientID: '',
          documentSignatureSessionID: '',
          documentSignatureSessionRecipientEmail: '',
          documentSignatureSessionRecipientFullName: '',
          documentSignatureSessionRecipientRequestedOn: '',
          roleName: '',
          processName: '',
          processElementName: '',
          score: 0,
        );

  factory DocumentForClient.fromApiModel(api_mod.DocumentForClient apiModel) {
    return DocumentForClient._(
      id: apiModel.id!,
      documentID: apiModel.documentID!,
      createdOn: apiModel.createdOn!,
      purgeDate: apiModel.purgeDate!,
      name: apiModel.name!,
      pageCount: apiModel.pageCount!,
      fileSize: apiModel.fileSize!,
      thumbnailUrl: apiModel.thumbnailUrl!,
      isSigned: apiModel.isSigned!,
      classificationID: apiModel.classificationID!,
      classificationName: apiModel.classificationName!,
      previewMetadata:
          apiModel.previewMetadata?.map((x) => PreviewMetadataItem.fromApiModel(x)).toList(),
      documentApprovalID: apiModel.documentApprovalID!,
      documentApprovalCreatedOn: apiModel.documentApprovalCreatedOn!,
      documentSubscriptionID: apiModel.documentSubscriptionID!,
      documentSubscriptionCreatedOn: apiModel.documentSubscriptionCreatedOn!,
      documentSignatureSessionRecipientID: apiModel.documentSignatureSessionRecipientID!,
      documentSignatureSessionID: apiModel.documentSignatureSessionID!,
      documentSignatureSessionRecipientEmail: apiModel.documentSignatureSessionRecipientEmail!,
      documentSignatureSessionRecipientFullName:
          apiModel.documentSignatureSessionRecipientFullName!,
      documentSignatureSessionRecipientRequestedOn:
          apiModel.documentSignatureSessionRecipientRequestedOn!,
      roleName: apiModel.roleName!,
      processName: apiModel.processName!,
      processElementName: apiModel.processElementName!,
      score: apiModel.score!,
    );
  }

  String id;

  String documentID;

  String createdOn;

  String purgeDate;

  String name;

  int pageCount;

  int fileSize;

  String thumbnailUrl;

  bool isSigned;

  String classificationID;

  String classificationName;

  List<PreviewMetadataItem>? previewMetadata;

  String documentApprovalID;

  String documentApprovalCreatedOn;

  String documentSubscriptionID;

  String documentSubscriptionCreatedOn;

  String documentSignatureSessionRecipientID;

  String documentSignatureSessionID;

  String documentSignatureSessionRecipientEmail;

  String documentSignatureSessionRecipientFullName;

  String documentSignatureSessionRecipientRequestedOn;

  String roleName;

  String processName;

  String processElementName;

  int score;

  api_mod.DocumentForClient toApiModel() {
    return api_mod.DocumentForClient()
      ..id = id
      ..documentID = documentID
      ..createdOn = createdOn
      ..purgeDate = purgeDate
      ..name = name
      ..pageCount = pageCount
      ..fileSize = fileSize
      ..thumbnailUrl = thumbnailUrl
      ..isSigned = isSigned
      ..classificationID = classificationID
      ..classificationName = classificationName
      ..previewMetadata = previewMetadata!.map((x) => x.toApiModel()).toList()
      ..documentApprovalID = documentApprovalID
      ..documentApprovalCreatedOn = documentApprovalCreatedOn
      ..documentSubscriptionID = documentSubscriptionID
      ..documentSubscriptionCreatedOn = documentSubscriptionCreatedOn
      ..documentSignatureSessionRecipientID = documentSignatureSessionRecipientID
      ..documentSignatureSessionID = documentSignatureSessionID
      ..documentSignatureSessionRecipientEmail = documentSignatureSessionRecipientEmail
      ..documentSignatureSessionRecipientFullName = documentSignatureSessionRecipientFullName
      ..documentSignatureSessionRecipientRequestedOn = documentSignatureSessionRecipientRequestedOn
      ..roleName = roleName
      ..processName = processName
      ..processElementName = processElementName
      ..score = score;
  }
}
