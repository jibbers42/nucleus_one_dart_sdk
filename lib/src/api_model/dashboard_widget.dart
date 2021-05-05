import 'package:json_annotation/json_annotation.dart';

part 'dashboard_widget.g.dart';

// Originally generated by nucleus_one_utilities.
class DashboardWidgetCollection {
  DashboardWidgetCollection() : items = [];

  /// This JSON structure has an array at its root, which is not currently implicitly supported by json_serializable.
  /// https://github.com/google/json_serializable.dart/issues/648
  factory DashboardWidgetCollection.fromJson(List<dynamic> json) {
    return DashboardWidgetCollection()
      ..items = json.map((m) => DashboardWidget.fromJson(m)).toList();
  }

  List<DashboardWidget> items;
}

// Originally generated by nucleus_one_utilities.
// Serializable members must be explicitly marked with [JsonKey].
@JsonSerializable(ignoreUnannotated: true, includeIfNull: false)
class DashboardWidget {
  DashboardWidget();

  /// A necessary factory constructor for creating a new DashboardWidget instance
  /// from a map. Pass the map to the generated [_$DashboardWidgetFromJson()] constructor.
  /// The constructor is named after the source class, in this case, DashboardWidget.
  factory DashboardWidget.fromJson(Map<String, dynamic> json) => _$DashboardWidgetFromJson(json);

  @JsonKey(name: 'ID')
  String? id;

  @JsonKey(name: 'TenantID')
  String? tenantID;

  @JsonKey(name: 'TenantMemberID')
  String? tenantMemberID;

  @JsonKey(name: 'Type')
  String? type;

  @JsonKey(name: 'GridColumn')
  double? gridColumn;

  @JsonKey(name: 'ColumnRank')
  double? columnRank;

  @JsonKey(name: 'Name')
  String? name;

  @JsonKey(name: 'Detail')
  String? detail;

  @JsonKey(name: 'JsonData')
  String? jsonData;

  // coverage:ignore-start
  /// [toJson] is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method [_$DashboardWidgetToJson].
  Map<String, dynamic> toJson() => _$DashboardWidgetToJson(this);
  // coverage:ignore-end

  factory DashboardWidget.forRankUpdate(String id, double gridColumn, double columnRank) {
    return DashboardWidget()
      ..id = id
      ..gridColumn = gridColumn
      ..columnRank = columnRank
      // The remainder of these fields are not required for the rank update operation, but will
      // cause an error when this class is converted to a "mode" class, if not populated
      ..tenantID = ''
      ..tenantMemberID = ''
      ..type = ''
      ..name = ''
      ..detail = ''
      ..jsonData = '';
  }
}