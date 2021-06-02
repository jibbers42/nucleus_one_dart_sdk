import 'package:json_annotation/json_annotation.dart';
import 'preview_metadata_item.dart';

part 'document_subscription.g.dart';

// Originally generated by nucleus_one_utilities.
// Serializable members must be explicitly marked with [JsonKey].
@JsonSerializable(ignoreUnannotated: true, includeIfNull: false)
class DocumentSubscription {
  DocumentSubscription();

  /// A necessary factory constructor for creating a new DocumentSubscription instance
  /// from a map. Pass the map to the generated [_$DocumentSubscriptionFromJson()] constructor.
  /// The constructor is named after the source class, in this case, DocumentSubscription.
  factory DocumentSubscription.fromJson(Map<String, dynamic> json) =>
      _$DocumentSubscriptionFromJson(json);

  @JsonKey(name: 'Subscribed')
  bool? subscribed;

  @JsonKey(name: 'Notify')
  bool? notify;

  @JsonKey(name: 'CreatedOn')
  String? createdOn;

  @JsonKey(name: 'DocumentID')
  String? documentID;

  @JsonKey(name: 'DocumentCreatedOn')
  String? documentCreatedOn;

  @JsonKey(name: 'DocumentName')
  String? documentName;

  @JsonKey(name: 'DocumentPageCount')
  int? documentPageCount;

  @JsonKey(name: 'DocumentFileSize')
  int? documentFileSize;

  @JsonKey(name: 'DocumentClassificationID')
  String? documentClassificationID;

  @JsonKey(name: 'DocumentClassificationName')
  String? documentClassificationName;

  @JsonKey(name: 'DocumentPreviewMetadata')
  List<PreviewMetadataItem>? documentPreviewMetadata;

  @JsonKey(name: 'DocumentIsSigned')
  bool? documentIsSigned;

  // coverage:ignore-start
  /// [toJson] is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method [_$DocumentSubscriptionToJson].
  Map<String, dynamic> toJson() => _$DocumentSubscriptionToJson(this);
  // coverage:ignore-end
}
