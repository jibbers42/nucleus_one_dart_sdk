import 'package:json_annotation/json_annotation.dart';

part 'email_login_options.g.dart';

// Originally generated by nucleus_one_utilities.
// Serializable members must be explicitly marked with [JsonKey].
@JsonSerializable(ignoreUnannotated: true, includeIfNull: false)
class EmailLoginOptions {
  EmailLoginOptions();

  /// A necessary factory constructor for creating a new EmailLoginOptions instance
  /// from a map. Pass the map to the generated [_$EmailLoginOptionsFromJson()] constructor.
  /// The constructor is named after the source class, in this case, EmailLoginOptions.
  factory EmailLoginOptions.fromJson(Map<String, dynamic> json) =>
      _$EmailLoginOptionsFromJson(json);

  @JsonKey(name: 'UserExists')
  bool? userExists;

  @JsonKey(name: 'SMSNumberLast2')
  String? smsNumberLast2;

  // coverage:ignore-start
  /// [toJson] is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method [_$EmailLoginOptionsToJson].
  Map<String, dynamic> toJson() => _$EmailLoginOptionsToJson(this);
  // coverage:ignore-end
}