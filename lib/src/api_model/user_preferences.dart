import 'package:json_annotation/json_annotation.dart';

import 'selected_twain_device.dart';

part 'user_preferences.g.dart';

// Originally generated by nucleus_one_utilities.
// Serializable members must be explicitly marked with [JsonKey].
@JsonSerializable(ignoreUnannotated: true, includeIfNull: false)
class UserPreferences {
  UserPreferences();

  /// A necessary factory constructor for creating a new UserPreferences instance
  /// from a map. Pass the map to the generated [_$UserPreferencesFromJson()] constructor.
  /// The constructor is named after the source class, in this case, UserPreferences.
  factory UserPreferences.fromJson(Map<String, dynamic> json) => _$UserPreferencesFromJson(json);

  @JsonKey(name: 'UserID')
  String? userID;

  @JsonKey(name: 'UserName')
  String? userName;

  @JsonKey(name: 'UserEmail')
  String? userEmail;

  @JsonKey(name: 'ActiveOrganizationID')
  String? activeOrganizationID;

  @JsonKey(name: 'ActiveOrganizationName')
  String? activeOrganizationName;

  @JsonKey(name: 'ActiveTenantID')
  String? activeTenantID;

  @JsonKey(name: 'ActiveTenantName')
  String? activeTenantName;

  @JsonKey(name: 'ViewType')
  String? viewType;

  @JsonKey(name: 'DocumentPropertiesOpen')
  bool? documentPropertiesOpen;

  @JsonKey(name: 'DocumentCommentsOpen')
  bool? documentCommentsOpen;

  @JsonKey(name: 'SinglePagePreview')
  bool? singlePagePreview;

  @JsonKey(name: 'SelectedTwainDevice')
  SelectedTwainDevice? selectedTwainDevice;

  @JsonKey(name: 'DisableTwainDeviceSoftware')
  bool? disableTwainDeviceSoftware;

  // coverage:ignore-start
  /// [toJson] is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method [_$UserPreferencesToJson].
  Map<String, dynamic> toJson() => _$UserPreferencesToJson(this);
  // coverage:ignore-end
}