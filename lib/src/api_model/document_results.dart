import 'package:json_annotation/json_annotation.dart';
import 'package:nucleus_one_dart_sdk/src/common/model.dart';

import 'document.dart';

part 'document_results.g.dart';

// Originally generated by nucleus_one_utilities.
// Serializable members must be explicitly marked with [JsonKey].
@JsonSerializable(ignoreUnannotated: true, includeIfNull: false)
class DocumentResults implements IApiModelPagingCursor {
  DocumentResults();

  /// A necessary factory constructor for creating a new DocumentResults instance
  /// from a map. Pass the map to the generated [_$DocumentResultsFromJson()] constructor.
  /// The constructor is named after the source class, in this case, DocumentResults.
  factory DocumentResults.fromJson(Map<String, dynamic> json) => _$DocumentResultsFromJson(json);

  @JsonKey(name: 'Documents')
  List<Document>? documents;

  @override
  @JsonKey(name: 'Cursor')
  String? cursor;

  @override
  @JsonKey(name: 'PageSize')
  int? pageSize;

  // coverage:ignore-start
  /// [toJson] is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method [_$DocumentResultsToJson].
  Map<String, dynamic> toJson() => _$DocumentResultsToJson(this);
  // coverage:ignore-end
}
