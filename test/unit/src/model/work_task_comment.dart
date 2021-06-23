import 'dart:convert';

import 'package:nucleus_one_dart_sdk/nucleus_one_dart_sdk.dart';
import 'package:nucleus_one_dart_sdk/src/api_model/work_task_comment.dart' as api_mod;
import 'package:nucleus_one_dart_sdk/src/api_model/query_result.dart' as api_mod;
import 'package:nucleus_one_dart_sdk/src/common/model.dart';
import 'package:test/test.dart';

import '../api_model/work_task_comment.dart';

void main() {
  group('WorkTaskCommentCollection tests', () {
    setUp(() async {
      await NucleusOne.intializeSdk();
    });

    tearDown(() async {
      await NucleusOne.resetSdk();
    });

    test('Serialization test', () {
      void performTests(api_mod.QueryResult2<api_mod.WorkTaskCommentCollection> apiModel) {
        expect(apiModel.results!.workTaskEvents!.length, 1);
        expect(apiModel.cursor, 'QueryResultA');
        expect(apiModel.reverseCursor, 'QueryResultB');
        expect(apiModel.pageSize, 24);
      }

      var apiModelOrig = api_mod.QueryResult2<api_mod.WorkTaskCommentCollection>.fromJson(
          jsonDecode(workTaskCommentsJson));
      performTests(apiModelOrig);

      // Convert it to a model class then back again
      final api_mod.QueryResult2<api_mod.WorkTaskCommentCollection> apiModelCycled =
          WorkTaskCommentCollectionQueryResult.fromApiModelWorkTaskCommentCollection(apiModelOrig)
              .toApiModel<api_mod.WorkTaskCommentCollection>();
      performTests(apiModelCycled);
    });
  });
}