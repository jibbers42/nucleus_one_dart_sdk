import 'package:json_annotation/json_annotation.dart';
import '../common/api_model.dart';

import 'document_content_package.dart';

part 'document_signature_session_signing_recipient_package.g.dart';

// Originally generated by nucleus_one_utilities.
// Serializable members must be explicitly marked with [JsonKey].
@JsonSerializable(ignoreUnannotated: true, includeIfNull: false)
class DocumentSignatureSessionSigningRecipientPackage extends Entity {
  DocumentSignatureSessionSigningRecipientPackage();

  /// A necessary factory constructor for creating a new DocumentSignatureSessionSigningRecipientPackage instance
  /// from a map. Pass the map to the generated [_$DocumentSignatureSessionSigningRecipientPackageFromJson()] constructor.
  /// The constructor is named after the source class, in this case, DocumentSignatureSessionSigningRecipientPackage.
  factory DocumentSignatureSessionSigningRecipientPackage.fromJson(Map<String, dynamic> json) =>
      _$DocumentSignatureSessionSigningRecipientPackageFromJson(json);

  @JsonKey(name: 'RequireAccessCode')
  bool? requireAccessCode;

  @JsonKey(name: 'SigningRecipient')
  DocumentSignatureSessionSigningRecipient? signingRecipient;

  @JsonKey(name: 'FormFieldPackage')
  DocumentSignatureSessionFormFieldPackage? formFieldPackage;

  @JsonKey(name: 'ServerDate')
  String? serverDate;

  @JsonKey(name: 'ContentPackage')
  DocumentContentPackage? contentPackage;

  // coverage:ignore-start
  /// [toJson] is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method [_$DocumentSignatureSessionSigningRecipientPackageToJson].
  @override
  Map<String, dynamic> toJson() => _$DocumentSignatureSessionSigningRecipientPackageToJson(this);
  // coverage:ignore-end
}

// Originally generated by nucleus_one_utilities.
// Serializable members must be explicitly marked with [JsonKey].
@JsonSerializable(ignoreUnannotated: true, includeIfNull: false)
class DocumentSignatureSessionFormFieldPackage extends Entity {
  DocumentSignatureSessionFormFieldPackage();

  /// A necessary factory constructor for creating a new DocumentSignatureSessionFormFieldPackage instance
  /// from a map. Pass the map to the generated [_$DocumentSignatureSessionFormFieldPackageFromJson()] constructor.
  /// The constructor is named after the source class, in this case, DocumentSignatureSessionFormFieldPackage.
  factory DocumentSignatureSessionFormFieldPackage.fromJson(Map<String, dynamic> json) =>
      _$DocumentSignatureSessionFormFieldPackageFromJson(json);

  @JsonKey(name: 'FormDesignType')
  String? formDesignType;

  @JsonKey(name: 'QuickDesignPlaceInitials')
  bool? quickDesignPlaceInitials;

  @JsonKey(name: 'QuickDesignPlaceFullName')
  bool? quickDesignPlaceFullName;

  @JsonKey(name: 'QuickDesignPlaceEmail')
  bool? quickDesignPlaceEmail;

  @JsonKey(name: 'QuickDesignPlaceTitle')
  bool? quickDesignPlaceTitle;

  @JsonKey(name: 'FormFields')
  List<DocumentSignatureSessionRecipientFormField>? formFields;

  @JsonKey(name: 'CompletedFormFields')
  List<DocumentSignatureSessionRecipientFormField>? completedFormFields;

  // coverage:ignore-start
  /// [toJson] is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method [_$DocumentSignatureSessionFormFieldPackageToJson].
  @override
  Map<String, dynamic> toJson() => _$DocumentSignatureSessionFormFieldPackageToJson(this);
  // coverage:ignore-end
}

// Originally generated by nucleus_one_utilities.
class DocumentSignatureSessionRecipientFormFieldCollection
    extends EntityCollection<DocumentSignatureSessionRecipientFormField> {
  DocumentSignatureSessionRecipientFormFieldCollection() : super();

  factory DocumentSignatureSessionRecipientFormFieldCollection.fromJson(List<dynamic> json) {
    return EntityCollection.fromJson(json, DocumentSignatureSessionRecipientFormFieldCollection(),
        (x) => DocumentSignatureSessionRecipientFormField.fromJson(x));
  }
}

// Originally generated by nucleus_one_utilities.
// Serializable members must be explicitly marked with [JsonKey].
@JsonSerializable(ignoreUnannotated: true, includeIfNull: false)
class DocumentSignatureSessionRecipientFormField extends Entity {
  DocumentSignatureSessionRecipientFormField();

  /// A necessary factory constructor for creating a new DocumentSignatureSessionRecipientFormField instance
  /// from a map. Pass the map to the generated [_$DocumentSignatureSessionRecipientFormFieldFromJson()] constructor.
  /// The constructor is named after the source class, in this case, DocumentSignatureSessionRecipientFormField.
  factory DocumentSignatureSessionRecipientFormField.fromJson(Map<String, dynamic> json) =>
      _$DocumentSignatureSessionRecipientFormFieldFromJson(json);

  @JsonKey(name: 'ID')
  String? id;

  @JsonKey(name: 'DocumentSignatureFormFieldID')
  String? documentSignatureFormFieldID;

  @JsonKey(name: 'DocumentSignatureSessionRecipientID')
  String? documentSignatureSessionRecipientID;

  @JsonKey(name: 'DocumentSignatureSessionRecipientRank')
  int? documentSignatureSessionRecipientRank;

  @JsonKey(name: 'IsComplete')
  bool? isComplete;

  @JsonKey(name: 'Type')
  String? type;

  @JsonKey(name: 'PageIndex')
  int? pageIndex;

  @JsonKey(name: 'X')
  double? x;

  @JsonKey(name: 'Y')
  double? y;

  @JsonKey(name: 'Value')
  String? value;

  @JsonKey(name: 'PlacementRank')
  int? placementRank;

  // coverage:ignore-start
  /// [toJson] is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method [_$DocumentSignatureSessionRecipientFormFieldToJson].
  @override
  Map<String, dynamic> toJson() => _$DocumentSignatureSessionRecipientFormFieldToJson(this);
  // coverage:ignore-end
}

// Originally generated by nucleus_one_utilities.
// Serializable members must be explicitly marked with [JsonKey].
@JsonSerializable(ignoreUnannotated: true, includeIfNull: false)
class DocumentSignatureSessionSigningRecipient extends Entity {
  DocumentSignatureSessionSigningRecipient();

  /// A necessary factory constructor for creating a new DocumentSignatureSessionSigningRecipient instance
  /// from a map. Pass the map to the generated [_$DocumentSignatureSessionSigningRecipientFromJson()] constructor.
  /// The constructor is named after the source class, in this case, DocumentSignatureSessionSigningRecipient.
  factory DocumentSignatureSessionSigningRecipient.fromJson(Map<String, dynamic> json) =>
      _$DocumentSignatureSessionSigningRecipientFromJson(json);

  @JsonKey(name: 'Email')
  String? email;

  @JsonKey(name: 'FullName')
  String? fullName;

  // coverage:ignore-start
  /// [toJson] is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method [_$DocumentSignatureSessionSigningRecipientToJson].
  @override
  Map<String, dynamic> toJson() => _$DocumentSignatureSessionSigningRecipientToJson(this);
  // coverage:ignore-end
}
