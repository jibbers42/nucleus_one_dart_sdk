import 'package:get_it/get_it.dart';

import '../../nucleus_one_dart_sdk.dart';
import '../api_model/field.dart' as api_mod;
import '../common/model.dart';
import '../nucleus_one.dart';

class FieldCollection extends EntityCollection<Field, api_mod.FieldCollection> {
  FieldCollection({
    NucleusOneAppInternal? app,
    List<Field>? items,
  }) : super(app: app, items: items);

  factory FieldCollection.fromApiModel(api_mod.FieldCollection apiModel) {
    return FieldCollection(items: apiModel.fields?.map((x) => Field.fromApiModel(x)).toList());
  }

  @override
  api_mod.FieldCollection toApiModel() {
    return api_mod.FieldCollection()..fields = items.map((x) => x.toApiModel()).toList();
  }
}

class Field with NucleusOneAppDependent {
  Field._(
      {NucleusOneAppInternal? app,
      required this.id,
      required this.createdOn,
      required this.parentFieldID,
      required this.name,
      required this.nameLower,
      required this.label,
      required this.labelLower,
      required this.labelOrName,
      required this.labelOrNameLower,
      required this.type,
      required this.displaySelectionList,
      required this.allowMultipleLines,
      required this.rows,
      required this.allowMultipleValues,
      required this.allowNewSelectionListItems,
      required this.saveNewSelectionListItems,
      required this.decimalPlaces,
      required this.mask,
      required this.required,
      required this.sensitive,
      required this.useCreationDate,
      required this.textMatchType}) {
    this.app = app ?? GetIt.instance.get<NucleusOneApp>() as NucleusOneAppInternal;
  }

  factory Field.fromApiModel(api_mod.Field apiModel) {
    return Field._(
        id: apiModel.id!,
        createdOn: apiModel.createdOn!,
        parentFieldID: apiModel.parentFieldID!,
        name: apiModel.name!,
        nameLower: apiModel.nameLower!,
        label: apiModel.label!,
        labelLower: apiModel.labelLower!,
        labelOrName: apiModel.labelOrName!,
        labelOrNameLower: apiModel.labelOrNameLower!,
        type: apiModel.type!,
        displaySelectionList: apiModel.displaySelectionList!,
        allowMultipleLines: apiModel.allowMultipleLines!,
        rows: apiModel.rows!,
        allowMultipleValues: apiModel.allowMultipleValues!,
        allowNewSelectionListItems: apiModel.allowNewSelectionListItems!,
        saveNewSelectionListItems: apiModel.saveNewSelectionListItems!,
        decimalPlaces: apiModel.decimalPlaces!,
        mask: apiModel.mask!,
        required: apiModel.required!,
        sensitive: apiModel.sensitive!,
        useCreationDate: apiModel.useCreationDate!,
        textMatchType: apiModel.textMatchType!);
  }

  String id;

  String createdOn;

  String parentFieldID;

  String name;

  String nameLower;

  String label;

  String labelLower;

  String labelOrName;

  String labelOrNameLower;

  String type;

  bool displaySelectionList;

  bool allowMultipleLines;

  int rows;

  bool allowMultipleValues;

  bool allowNewSelectionListItems;

  bool saveNewSelectionListItems;

  int decimalPlaces;

  String mask;

  bool required;

  bool sensitive;

  bool useCreationDate;

  String textMatchType;

  api_mod.Field toApiModel() {
    return api_mod.Field()
      ..id = id
      ..createdOn = createdOn
      ..parentFieldID = parentFieldID
      ..name = name
      ..nameLower = nameLower
      ..label = label
      ..labelLower = labelLower
      ..labelOrName = labelOrName
      ..labelOrNameLower = labelOrNameLower
      ..type = type
      ..displaySelectionList = displaySelectionList
      ..allowMultipleLines = allowMultipleLines
      ..rows = rows
      ..allowMultipleValues = allowMultipleValues
      ..allowNewSelectionListItems = allowNewSelectionListItems
      ..saveNewSelectionListItems = saveNewSelectionListItems
      ..decimalPlaces = decimalPlaces
      ..mask = mask
      ..required = required
      ..sensitive = sensitive
      ..useCreationDate = useCreationDate
      ..textMatchType = textMatchType;
  }
}
