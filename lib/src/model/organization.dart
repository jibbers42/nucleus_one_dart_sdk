import '../api_model/organization.dart' as api_mod;
import '../common/get_it.dart';
import '../nucleus_one.dart';

class Organization with NucleusOneAppDependent {
  Organization._({
    NucleusOneApp? app,
    required this.id,
    required this.createdOn,
    required this.disabled,
    required this.name,
    required this.nameLower,
    required this.creatingUserID,
    required this.creatingUserName,
    required this.creatingUserEmail,
    required this.crmLeadId,
    required this.crmAccountId,
    required this.crmContactId,
    required this.crmDealId,
    required this.subscriptionRequired,
    required this.subscriptionFreeUsers,
    required this.subscriptionExpiration,
    required this.maxProjects,
  }) {
    this.app = app ?? getIt.get<NucleusOneApp>();
  }

  factory Organization.fromApiModel(
    api_mod.Organization apiModel, {
    NucleusOneApp? app,
  }) {
    return Organization._(
      app: app,
      id: apiModel.id!,
      createdOn: apiModel.createdOn!,
      disabled: apiModel.disabled!,
      name: apiModel.name!,
      nameLower: apiModel.nameLower!,
      creatingUserID: apiModel.creatingUserID!,
      creatingUserName: apiModel.creatingUserName!,
      creatingUserEmail: apiModel.creatingUserEmail!,
      crmLeadId: apiModel.crmLeadId!,
      crmAccountId: apiModel.crmAccountId!,
      crmContactId: apiModel.crmContactId!,
      crmDealId: apiModel.crmDealId!,
      subscriptionRequired: apiModel.subscriptionRequired!,
      subscriptionFreeUsers: apiModel.subscriptionFreeUsers!,
      subscriptionExpiration: apiModel.subscriptionExpiration!,
      maxProjects: apiModel.maxProjects!,
    );
  }

  String id;

  String createdOn;

  bool disabled;

  String name;

  String nameLower;

  String creatingUserID;

  String creatingUserName;

  String creatingUserEmail;

  String crmLeadId;

  String crmAccountId;

  String crmContactId;

  String crmDealId;

  bool subscriptionRequired;

  int subscriptionFreeUsers;

  String subscriptionExpiration;

  int maxProjects;

  api_mod.Organization toApiModel() {
    return api_mod.Organization()
      ..id = id
      ..createdOn = createdOn
      ..disabled = disabled
      ..name = name
      ..nameLower = nameLower
      ..creatingUserID = creatingUserID
      ..creatingUserName = creatingUserName
      ..creatingUserEmail = creatingUserEmail
      ..crmLeadId = crmLeadId
      ..crmAccountId = crmAccountId
      ..crmContactId = crmContactId
      ..crmDealId = crmDealId
      ..subscriptionRequired = subscriptionRequired
      ..subscriptionFreeUsers = subscriptionFreeUsers
      ..subscriptionExpiration = subscriptionExpiration
      ..maxProjects = maxProjects;
  }
}
