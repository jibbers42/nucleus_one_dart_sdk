import 'package:json_annotation/json_annotation.dart';

import 'document.dart';

part 'recent_documents.g.dart';

// Originally generated by nucleus_one_utilities.
// Serializable members must be explicitly marked with [JsonKey].
@JsonSerializable(ignoreUnannotated: true, includeIfNull: false)
class RecentDocuments {
  RecentDocuments();

  /// A necessary factory constructor for creating a new RecentDocuments instance
  /// from a map. Pass the map to the generated [_$RecentDocumentsFromJson()] constructor.
  /// The constructor is named after the source class, in this case, RecentDocuments.
  factory RecentDocuments.fromJson(Map<String, dynamic> json) => _$RecentDocumentsFromJson(json);

  @JsonKey(name: 'Documents')
  List<Document>? documents;

  @JsonKey(name: 'Cursor')
  String? cursor;

  @JsonKey(name: 'PageSize')
  int? pageSize;

  // coverage:ignore-start
  /// [toJson] is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method [_$RecentDocumentsToJson].
  Map<String, dynamic> toJson() => _$RecentDocumentsToJson(this);
  // coverage:ignore-end
}
