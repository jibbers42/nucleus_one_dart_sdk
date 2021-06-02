import 'package:json_annotation/json_annotation.dart';

part 'index_field.g.dart';

// Originally generated by nucleus_one_utilities.
// Serializable members must be explicitly marked with [JsonKey].
@JsonSerializable(ignoreUnannotated: true, includeIfNull: false)
class IndexField {
  IndexField();

  /// A necessary factory constructor for creating a new IndexField instance
  /// from a map. Pass the map to the generated [_$IndexFieldFromJson()] constructor.
  /// The constructor is named after the source class, in this case, IndexField.
  factory IndexField.fromJson(Map<String, dynamic> json) => _$IndexFieldFromJson(json);

  @JsonKey(name: 'ClassificationFieldID')
  String? classificationFieldID;

  @JsonKey(name: 'ClassificationFieldRank')
  int? classificationFieldRank;

  @JsonKey(name: 'FieldID')
  String? fieldID;

  @JsonKey(name: 'ParentFieldID')
  String? parentFieldID;

  @JsonKey(name: 'Name')
  String? name;

  @JsonKey(name: 'LabelOrName')
  String? labelOrName;

  @JsonKey(name: 'Type')
  String? type;

  @JsonKey(name: 'DisplaySelectionList')
  bool? displaySelectionList;

  @JsonKey(name: 'AllowMultipleLines')
  bool? allowMultipleLines;

  @JsonKey(name: 'Rows')
  int? rows;

  @JsonKey(name: 'AllowMultipleValues')
  bool? allowMultipleValues;

  @JsonKey(name: 'AllowNewSelectionListItems')
  bool? allowNewSelectionListItems;

  @JsonKey(name: 'SaveNewSelectionListItems')
  bool? saveNewSelectionListItems;

  @JsonKey(name: 'DecimalPlaces')
  int? decimalPlaces;

  @JsonKey(name: 'Mask')
  String? mask;

  @JsonKey(name: 'Required')
  bool? required;

  @JsonKey(name: 'Value')
  String? value;

  @JsonKey(name: 'Values')
  String? values;

  @JsonKey(name: 'UseCreationDate')
  bool? useCreationDate;

  @JsonKey(name: 'TextMatchType')
  String? textMatchType;

  // coverage:ignore-start
  /// [toJson] is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method [_$IndexFieldToJson].
  Map<String, dynamic> toJson() => _$IndexFieldToJson(this);
  // coverage:ignore-end
}
