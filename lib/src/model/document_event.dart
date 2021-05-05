import 'package:get_it/get_it.dart';

import '../api_model/document_event.dart' as api_mod;
import '../common/model.dart';
import '../nucleus_one.dart';

class DocumentEventCollection
    extends EntityCollection<DocumentEvent, api_mod.DocumentEventCollection> {
  DocumentEventCollection({
    NucleusOneAppInternal? app,
    List<DocumentEvent>? items,
  }) : super(app: app, items: items);

  @override
  api_mod.DocumentEventCollection toApiModel() {
    return api_mod.DocumentEventCollection()
      ..documentEvents = items.map((x) => x.toApiModel()).toList();
  }

  // @override
  // api_mod.DocumentEventCollection toApiModel<api_mod.DocumentEventCollection>() {
  //   return api_mod.DocumentEventCollection()
  //     ..documentEvents = items.map((x) => x.toApiModel()).toList();
  // }
}

class DocumentEvent with NucleusOneAppDependent {
  DocumentEvent._(
      {NucleusOneAppInternal? app,
      required this.id,
      required this.documentID,
      required this.createdOn,
      required this.createdByUserID,
      required this.createdByUserName,
      required this.createdByUserEmail,
      required this.type,
      required this.detailJson}) {
    this.app = app ?? GetIt.instance.get<NucleusOneApp>() as NucleusOneAppInternal;
  }

  factory DocumentEvent.fromApiModel(api_mod.DocumentEvent apiModel) {
    return DocumentEvent._(
        id: apiModel.id!,
        documentID: apiModel.documentID!,
        createdOn: apiModel.createdOn!,
        createdByUserID: apiModel.createdByUserID!,
        createdByUserName: apiModel.createdByUserName!,
        createdByUserEmail: apiModel.createdByUserEmail!,
        type: apiModel.type!,
        detailJson: apiModel.detailJson!);
  }

  String id;

  String documentID;

  String createdOn;

  String createdByUserID;

  String createdByUserName;

  String createdByUserEmail;

  String type;

  String detailJson;

  api_mod.DocumentEvent toApiModel() {
    return api_mod.DocumentEvent()
      ..id = id
      ..documentID = documentID
      ..createdOn = createdOn
      ..createdByUserID = createdByUserID
      ..createdByUserName = createdByUserName
      ..createdByUserEmail = createdByUserEmail
      ..type = type
      ..detailJson = detailJson;
  }
}