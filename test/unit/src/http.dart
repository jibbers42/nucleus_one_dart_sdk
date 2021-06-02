import 'dart:io';

import 'package:nucleus_one_dart_sdk/src/http.dart';
import 'package:test/test.dart';

import '../../src/common.dart';
import '../../src/mocks/http.dart';

void main() {
  const expectedCommonHeaderCount = 5;

  test('getStandardHttpClient method Tests', () {
    expect(getStandardHttpClient(), isA<HttpClient>());
  });

  test('setRequestHeadersCommon method Tests', () async {
    late MockHttpHeaders headers;
    await createMockHttpClientScopeForGetRequest(
      additionalMockSetup: (client, requestLocal, response) {
        setRequestHeadersCommon(requestLocal);
        headers = requestLocal.headers as MockHttpHeaders;
      },
      callback: () async {
        // This is an arbitrary http call to trigger HTTP request execution
        await HttpClient().getUrl(Uri.parse('https://google.com'));
      },
      responseBody: '',
    );

    final headersMap = headers.headers;
    expect(headersMap.length, expectedCommonHeaderCount);
    expect(headersMap['Pragma'], ['no-cache']);
    expect(headersMap['Cache-Control'], ['no-cache']);
    expect(headersMap['Accept'], ['application/json, text/plain, */*']);
    expect(headersMap['Content-Type'], ['application/json;charset=UTF-8']);
    expect(headersMap['Accept-Encoding'], ['gzip, deflate, br']);
  });

  test('setAuthenticatedRequestHeaders method Tests', () async {
    late MockHttpHeaders headers;
    await createMockHttpClientScopeForGetRequest(
      additionalMockSetup: (client, requestLocal, response) {
        final n1App = getStandardN1App();
        n1App.setAuthenticationState('123');
        setAuthenticatedRequestHeaders(requestLocal, n1App);
        headers = requestLocal.headers as MockHttpHeaders;
      },
      callback: () async {
        // This is an arbitrary http call to trigger HTTP request execution
        await HttpClient().getUrl(Uri.parse('https://google.com'));
      },
      responseBody: '',
    );

    expect(headers.headers.length, greaterThan(1));
    expect(headers.headers['Cookie'], isNotNull);
  });

  group('setRequestHeadersAuthCookie method Tests', () {
    test('Unset session', () async {
      late MockHttpHeaders headers;
      await createMockHttpClientScopeForGetRequest(
        additionalMockSetup: (client, requestLocal, response) {
          final n1App = getStandardN1App();
          setRequestHeadersAuthCookie(requestLocal, n1App);
          headers = requestLocal.headers as MockHttpHeaders;
        },
        callback: () async {
          // This is an arbitrary http call to trigger HTTP request execution
          await HttpClient().getUrl(Uri.parse('https://google.com'));
        },
        responseBody: '',
      );

      expect(headers.headers['Cookie'], isNull);
    });

    test('Sucessful', () async {
      late MockHttpHeaders headers;
      await createMockHttpClientScopeForGetRequest(
        additionalMockSetup: (client, requestLocal, response) {
          final n1App = getStandardN1App();
          n1App.setAuthenticationState('123');
          setRequestHeadersAuthCookie(requestLocal, n1App);
          headers = requestLocal.headers as MockHttpHeaders;
        },
        callback: () async {
          // This is an arbitrary http call to trigger HTTP request execution
          await HttpClient().getUrl(Uri.parse('https://google.com'));
        },
        responseBody: '',
      );

      expect(headers.headers['Cookie'], ['session_v1=123']);
    });
  });

  group('_executeStandardHttpRequest consumer methods Tests', () {
    // The tests for this operation (GET) are more thorough than the other operations because they
    // are also testing different combination of the parameters for the _executeStandardHttpRequest
    // method, which only needs to be tested in one place; not for all operations.
    test('executeGetRequestWithTextResponse method Tests', () async {
      final requestCombinations = [
        {
          'query': null,
          'body': null,
          'authenticated': true,
          'responseHttpStatus': HttpStatus.ok,
        },
        {
          'query': {'A': 1},
          'body': 'B',
          'authenticated': false,
          'responseHttpStatus': HttpStatus.ok,
        },
        {
          'query': {'A': 1},
          'body': 'B',
          'authenticated': false,
          'responseHttpStatus': HttpStatus.unauthorized,
        },
        {
          'query': {'A': 1},
          'body': 'B',
          'authenticated': false,
          'responseHttpStatus': HttpStatus.internalServerError,
        },
      ];

      late MockHttpHeaders headers;
      for (var requestCombo in requestCombinations) {
        late String responseText;
        final reqQuery = requestCombo['query'] as Map<String, dynamic>?;
        final reqBody = requestCombo['body'] as String?;
        final reqAuthenticated = requestCombo['authenticated'] as bool;
        final responseHttpStatus = requestCombo['responseHttpStatus'] as int;
        final responseIsError = (responseHttpStatus != HttpStatus.ok);

        late HttpClientOperationResult opResult;
        try {
          opResult = await createMockHttpClientScopeForGetRequest(
            additionalMockSetup: (client, requestLocal, response) {
              headers = requestLocal.headers as MockHttpHeaders;
            },
            callback: () async {
              final n1App = getStandardN1App();
              if (reqAuthenticated) {
                n1App.setAuthenticationState('123');
              }
              responseText = await executeGetRequestWithTextResponse(
                '',
                n1App,
                query: reqQuery,
                body: reqBody,
                authenticated: reqAuthenticated,
              );
            },
            responseBody: '123',
            responseHttpStatus: responseHttpStatus,
          );
        } on HttpException catch (e) {
          // Verify that an exception was expected and that it has the right HTTP status
          expect(responseIsError, isTrue);
          expect(e.status, responseHttpStatus);
          expect(e.message, '123');
        }

        if (!responseIsError) {
          expect(opResult.request.method, 'GET');
          expect(responseText, '123');
          (reqQuery == null)
              ? expect(opResult.request.uri.query, '')
              : expect(opResult.request.uri.query, 'A=1');
          expect(opResult.request.getBodyAsString(), reqBody ?? '');

          if (reqAuthenticated) {
            expect(headers.headers.length, greaterThan(expectedCommonHeaderCount));
            expect(headers.headers['Cookie'], isNotNull);
          } else {
            expect(headers.headers.length, expectedCommonHeaderCount);
            expect(headers.headers['Cookie'], isNull);
          }
        }
      }
    });

    test('executeDeleteRequest method Tests', () async {
      final opResult = await createMockHttpClientScopeForDeleteRequest(
        callback: () async {
          await executeDeleteRequest(
            '',
            getStandardN1App(),
            query: {},
          );
        },
        responseBody: '123',
      );

      expect(opResult.request.method, 'DELETE');
    });

    test('executePostRequest method Tests', () async {
      final opResult = await createMockHttpClientScopeForPostRequest(
        callback: () async {
          await executePostRequest(
            '',
            getStandardN1App(),
            query: {},
          );
        },
        responseBody: '123',
      );

      expect(opResult.request.method, 'POST');
    });

    test('executePutRequest method Tests', () async {
      final opResult = await createMockHttpClientScopeForPutRequest(
        callback: () async {
          await executePutRequest(
            '',
            getStandardN1App(),
            query: {},
          );
        },
        responseBody: '123',
      );

      expect(opResult.request.method, 'PUT');
    });
  });

  group('getQueryParamsString method Tests', () {
    test('Valid query strings', () {
      var s = getQueryParamsString({});
      expect(s, '');

      s = getQueryParamsString({
        'A': 1,
        'B': 1.2,
        'C': true,
        'D': 'XYZ',
      });
      expect(s, 'A=1&B=1.2&C=true&D=XYZ');
    });

    test('Invalid query strings', () {
      final qp = {
        'A': {'B': 1.2}
      };
      expect(
          () => getQueryParamsString(qp),
          throwsA(allOf(
            isUnsupportedError,
            predicate((UnsupportedError e) =>
                e.message == 'Unsupported value type provided in query parameters.'),
          )));
    });
  });

  group('ApiRequestBodyObject class Tests', () {
    final json = '{"A":"1","B":2,"C":3.4}';
    void validateMapContents(Map<String, dynamic> map) {
      expect(map.length, 3);
      expect(map['A'], '1');
      expect(map['B'], 2);
      expect(map['C'], 3.4);
    }

    test('populateFromJson method tests', () {
      final arbo = _ApiRequestBodyObjectTest();
      arbo.populateFromJsonPublic(json);
      validateMapContents(arbo.mapPublic);
    });

    test('toJson method tests', () {
      final arbo = _ApiRequestBodyObjectTest();
      expect(arbo.toJson().length, 0);

      arbo.populateFromJsonPublic(json);
      validateMapContents(arbo.toJson());
    });
  });

  group('HttpException class tests', () {
    test('Constructor test', () {
      var e = HttpException(200);
      expect(e.status, 200);
      expect(e.message, isNull);

      e = HttpException(500, 'abc');
      expect(e.status, 500);
      expect(e.message, 'abc');
    });

    test('fromJsonSafe factory constructor test', () {
      var e = HttpException.fromJsonSafe(200, 'abc');
      expect(e.status, 200);
      expect(e.message, 'abc');

      e = HttpException.fromJsonSafe(500, '{"message":"xyz"}');
      expect(e.status, 500);
      expect(e.message, 'xyz');
    });
  });
}

class _ApiRequestBodyObjectTest extends ApiRequestBodyObject {
  Map<String, dynamic> get mapPublic => map;
  void populateFromJsonPublic(String json) => populateFromJson(json);
}
