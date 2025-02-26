import 'dart:convert';

import 'package:nucleus_one_dart_sdk/nucleus_one_dart_sdk.dart';
import 'package:nucleus_one_dart_sdk/src/api_model/organization.dart' as api_mod;
import 'package:nucleus_one_dart_sdk/src/common/util.dart';
import 'package:nucleus_one_dart_sdk/src/hierarchy/nucleus_one_app_subscriptions.dart';
import 'package:test/test.dart';

import '../../../src/common.dart';
import '../api_model/organization.dart';

void main() {
  group('Organization class tests', () {
    setUp(() async {
      await NucleusOne.intializeSdk();
    });

    tearDown(() async {
      await NucleusOne.resetSdk();
    });

    test('Serialization test', () async {
      void performTests(api_mod.Organization apiModel) {
        expect(apiModel.id, 'A');
        expect(apiModel.createdOn, '2021-05-25T13:21:29.111348Z');
        expect(apiModel.disabled, true);
        expect(apiModel.name, 'B');
        expect(apiModel.nameLower, 'C');
        expect(apiModel.creatingUserID, 'D');
        expect(apiModel.creatingUserName, 'E');
        expect(apiModel.creatingUserEmail, 'F');
        expect(apiModel.crmLeadId, 'G');
        expect(apiModel.crmAccountId, 'H');
        expect(apiModel.crmContactId, 'I');
        expect(apiModel.crmDealId, 'J');
        expect(apiModel.subscriptionRequired, false);
        expect(apiModel.subscriptionFreeUsers, 0);
        expect(apiModel.subscriptionExpiration, '0001-01-01T00:00:00Z');
        expect(apiModel.maxProjects, 1);
      }

      final apiModelOrig = api_mod.Organization.fromJson(jsonDecode(organizationJson));
      performTests(apiModelOrig);

      await DefineN1AppInScope(getStandardN1App(), () {
        // Convert it to a model class then back again
        final apiModelCycled = Organization.fromApiModel(apiModelOrig).toApiModel();
        performTests(apiModelCycled);
      });
    });

    test('subscriptions method tests', () {
      final org = getStandardN1Org();

      final sub = org.subscriptions();
      expect(sub, isA<NucleusOneAppSubscriptions>());
      expect(sub.app, org.app);
    });
  });
}
