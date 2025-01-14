import 'dart:convert';

import 'package:nucleus_one_dart_sdk/nucleus_one_dart_sdk.dart';
import 'package:nucleus_one_dart_sdk/src/api_model/document_subscription_for_client.dart'
    as api_mod;
import 'package:nucleus_one_dart_sdk/src/common/util.dart';

import 'package:test/test.dart';

import '../../../src/common.dart';
import '../api_model/document_subscription_for_client.dart';

void main() {
  group('DocumentSubscriptionForClient class tests', () {
    setUp(() async {
      await NucleusOne.intializeSdk();
    });

    tearDown(() async {
      await NucleusOne.resetSdk();
    });

    test('Serialization test', () async {
      void performTests(api_mod.DocumentSubscriptionForClient apiModel) {
        expect(apiModel.subscribed, false);
        expect(apiModel.notify, false);
        expect(apiModel.createdOn, '0001-01-01T00:00:00Z');
        expect(apiModel.documentID, 'A');
        expect(apiModel.documentCreatedOn, '0001-01-01T00:00:00Z');
        expect(apiModel.documentName, 'B');
        expect(apiModel.documentPageCount, 0);
        expect(apiModel.documentFileSize, 1);
        expect(apiModel.documentClassificationID, 'C');
        expect(apiModel.documentClassificationName, 'D');
        expect(apiModel.documentPreviewMetadata, isNotNull);
        expect(apiModel.documentPreviewMetadata!.length, 1);
        expect(apiModel.documentIsSigned, false);
      }

      final apiModelOrig = api_mod.DocumentSubscriptionForClient.fromJson(
          jsonDecode(documentSubscriptionForClientJson));
      performTests(apiModelOrig);

      await DefineN1AppInScope(getStandardN1App(), () {
        // Convert it to a model class then back again
        final apiModelCycled =
            DocumentSubscriptionForClient.fromApiModel(apiModelOrig).toApiModel();
        performTests(apiModelCycled);
      });
    });
  });
}
