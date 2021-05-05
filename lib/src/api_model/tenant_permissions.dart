import 'package:json_annotation/json_annotation.dart';

part 'tenant_permissions.g.dart';

// Originally generated by nucleus_one_utilities.
// Serializable members must be explicitly marked with [JsonKey].
@JsonSerializable(ignoreUnannotated: true, includeIfNull: false)
class TenantPermissions {
  TenantPermissions();

  /// A necessary factory constructor for creating a new TenantPermissions instance
  /// from a map. Pass the map to the generated [_$TenantPermissionsFromJson()] constructor.
  /// The constructor is named after the source class, in this case, TenantPermissions.
  factory TenantPermissions.fromJson(Map<String, dynamic> json) =>
      _$TenantPermissionsFromJson(json);

  @JsonKey(name: 'OrganizationID')
  String? organizationID;

  @JsonKey(name: 'OrganizationName')
  String? organizationName;

  @JsonKey(name: 'TenantID')
  String? tenantID;

  @JsonKey(name: 'TenantName')
  String? tenantName;

  @JsonKey(name: 'TenantMemberID')
  String? tenantMemberID;

  @JsonKey(name: 'UserID')
  String? userID;

  @JsonKey(name: 'UserName')
  String? userName;

  @JsonKey(name: 'UserEmail')
  String? userEmail;

  @JsonKey(name: 'Disabled')
  bool? disabled;

  @JsonKey(name: 'IsAdmin')
  bool? isAdmin;

  // coverage:ignore-start
  /// [toJson] is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method [_$TenantPermissionsToJson].
  Map<String, dynamic> toJson() => _$TenantPermissionsToJson(this);
  // coverage:ignore-end
}