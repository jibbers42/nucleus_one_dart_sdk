import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

/*
The functionality implemented in these mock classes is only what is applicable for all consumers of
these classes.  Any test-specific logic is extended via mocktail's "when(...).thenAnswer(...)"
functionality.
*/

class MockHttpClientRequest extends Mock implements HttpClientRequest {
  final _body = <int>[];

  @override
  String method = '';

  @override
  Uri uri = Uri.parse('');

  String getBodyAsString() {
    return utf8.decode(_body);
  }
}

class MockHttpClientResponse extends Mock implements HttpClientResponse {
  @override
  Future pipe(StreamConsumer<List<int>> streamConsumer) {
    return streamConsumer.addStream(this).then((_) => streamConsumer.close());
  }
}

class MockHttpHeaders extends Mock implements HttpHeaders {
  final headers = <String, List<String>>{};

  void expectContainsAllKeys(List<String> keys) {
    for (var key in keys) {
      expect(headers.containsKey(key), isTrue, reason: 'The "$key" key is expected');
    }
  }

  @override
  void add(
    String? name,
    Object? value, {
    bool? preserveHeaderCase = false,
  }) {
    if (name == null) {
      throw 'The parameter "name" cannot be null.';
    }

    var values = headers[name];
    if (values == null) {
      headers[name] = values = <String>[];
    }
    if (value is DateTime) {
      values.add(HttpDate.format(value));
    } else {
      values.add(value.toString());
    }
  }

  @override
  void set(
    String? name,
    Object? value, {
    bool? preserveHeaderCase = false,
  }) {
    headers.remove(name);
    add(name, value);
  }
}

class MockHttpClient extends Mock implements HttpClient {}

class HttpClientOperationResult {
  MockHttpClient client;
  MockHttpClientRequest request;
  MockHttpClientResponse response;
  MockHttpHeaders headers;

  HttpClientOperationResult()
      : client = MockHttpClient(),
        request = MockHttpClientRequest(),
        response = MockHttpClientResponse(),
        headers = MockHttpHeaders();
}

/// Mocks HttpClient and prepares it for an HTTP GET request.
Future<HttpClientOperationResult> createMockHttpClientScopeForGetRequest({
  required Future<void> Function() callback,
  void Function(MockHttpClient, MockHttpClientRequest, MockHttpClientResponse)? additionalMockSetup,
  required String responseBody,
  int responseHttpStatus = HttpStatus.ok,
  Map<String, String>? responseCookies,
}) async {
  return _createStandardMockHttpClientScopeForAllRequests(
    callback: callback,
    additionalMockSetup: additionalMockSetup,
    responseBody: responseBody,
    responseHttpStatus: responseHttpStatus,
    responseCookies: responseCookies,
  );
}

/// Mocks HttpClient and prepares it for an HTTP POST request.
Future<HttpClientOperationResult> createMockHttpClientScopeForPostRequest({
  required Future<void> Function() callback,
  void Function(MockHttpClient, MockHttpClientRequest, MockHttpClientResponse)? additionalMockSetup,
  required String responseBody,
  int responseHttpStatus = HttpStatus.ok,
  Map<String, String>? responseCookies,
}) async {
  return _createStandardMockHttpClientScopeForAllRequests(
    callback: callback,
    additionalMockSetup: additionalMockSetup,
    responseBody: responseBody,
    responseHttpStatus: responseHttpStatus,
    responseCookies: responseCookies,
  );
}

/// Mocks HttpClient and prepares it for an HTTP DELETE request.
Future<HttpClientOperationResult> createMockHttpClientScopeForDeleteRequest({
  required Future<void> Function() callback,
  void Function(MockHttpClient, MockHttpClientRequest, MockHttpClientResponse)? additionalMockSetup,
  required String responseBody,
  int responseHttpStatus = HttpStatus.ok,
  Map<String, String>? responseCookies,
}) async {
  return _createStandardMockHttpClientScopeForAllRequests(
    callback: callback,
    additionalMockSetup: additionalMockSetup,
    responseBody: responseBody,
    responseHttpStatus: responseHttpStatus,
    responseCookies: responseCookies,
  );
}

/// Mocks HttpClient and prepares it for an HTTP PUT request.
Future<HttpClientOperationResult> createMockHttpClientScopeForPutRequest({
  required Future<void> Function() callback,
  void Function(MockHttpClient, MockHttpClientRequest, MockHttpClientResponse)? additionalMockSetup,
  required String responseBody,
  int responseHttpStatus = HttpStatus.ok,
  Map<String, String>? responseCookies,
}) async {
  return _createStandardMockHttpClientScopeForAllRequests(
    callback: callback,
    additionalMockSetup: additionalMockSetup,
    responseBody: responseBody,
    responseHttpStatus: responseHttpStatus,
    responseCookies: responseCookies,
  );
}

/// Creates the standard MockHttpClient scope for all requests.
Future<HttpClientOperationResult> _createStandardMockHttpClientScopeForAllRequests({
  required Future<void> Function() callback,
  void Function(MockHttpClient, MockHttpClientRequest, MockHttpClientResponse)? additionalMockSetup,
  required String responseBody,
  int responseHttpStatus = HttpStatus.ok,
  Map<String, String>? responseCookies,
}) async {
  return _createMockHttpClientScopeForAllRequestsInternal(
    callback: callback,
    createHttpClientHandler: (SecurityContext? securityContext) {
      return _createMockHttpClientAllRequests(
        additionalMockSetup: additionalMockSetup,
        responseBody: responseBody,
        responseHttpStatus: responseHttpStatus,
        responseCookies: responseCookies,
      );
    },
  );
}

Future<HttpClientOperationResult> _createMockHttpClientScopeForAllRequestsInternal<T>({
  required Future<void> Function() callback,
  required HttpClientOperationResult Function(SecurityContext?) createHttpClientHandler,
}) async {
  late HttpClientOperationResult opResult;
  return await HttpOverrides.runZoned<Future<HttpClientOperationResult>>(
    () async {
      await callback();
      return opResult;
    },
    createHttpClient: (SecurityContext? securityContext) {
      opResult = createHttpClientHandler(securityContext);
      return opResult.client;
    },
  );
}

HttpClientOperationResult _createMockHttpClientAllRequests({
  void Function(MockHttpClient, MockHttpClientRequest, MockHttpClientResponse)? additionalMockSetup,
  required String responseBody,
  int responseHttpStatus = HttpStatus.ok,
  Map<String, String>? responseCookies,
}) {
  responseCookies ??= {};

  final httpOpResult = HttpClientOperationResult(),
      client = httpOpResult.client,
      request = httpOpResult.request,
      response = httpOpResult.response;

  {
    Future<HttpClientRequest> handleHttpUrlInvocation(Invocation invocation, String httpMethod) {
      request
        ..uri = invocation.positionalArguments[0]
        ..method = httpMethod;
      return Future.value(request);
    }

    when(() => client.getUrl(any())).thenAnswer((Invocation invocation) {
      return handleHttpUrlInvocation(invocation, 'GET');
    });
    when(() => client.deleteUrl(any())).thenAnswer((Invocation invocation) {
      return handleHttpUrlInvocation(invocation, 'DELETE');
    });
    when(() => client.postUrl(any())).thenAnswer((Invocation invocation) {
      return handleHttpUrlInvocation(invocation, 'POST');
    });
    when(() => client.putUrl(any())).thenAnswer((Invocation invocation) {
      return handleHttpUrlInvocation(invocation, 'PUT');
    });
  }

  when(() => request.headers).thenReturn(httpOpResult.headers);
  when(() => request.close()).thenAnswer((_) => Future<HttpClientResponse>.value(response));
  when(() => request.write(any())).thenAnswer((realInvocation) {
    final contentAsString = realInvocation.positionalArguments[0].toString();
    httpOpResult.request._body.addAll(utf8.encode(contentAsString));
  });

  when(() => response.contentLength).thenReturn(responseBody.length);
  when(() => response.statusCode).thenReturn(responseHttpStatus);
  when(() => response.compressionState)
      .thenReturn(HttpClientResponseCompressionState.notCompressed);
  when(() => response.cookies).thenReturn(
      responseCookies.entries.map((mapEntry) => Cookie(mapEntry.key, mapEntry.value)).toList());
  when(() => response.transform(utf8.decoder)).thenAnswer((_) {
    return Stream.value(responseBody);
  });
  // Originally from https://stackoverflow.com/a/49642337
  when(() => response.listen(
        any(),
        onError: any(named: 'onError'),
        onDone: any(named: 'onDone'),
        cancelOnError: any(named: 'cancelOnError'),
      )).thenAnswer((Invocation invocation) {
    final void Function(List<int>) onData = invocation.positionalArguments[0];
    final void Function() onDone = invocation.namedArguments[#onDone];
    final void Function(Object, StackTrace) onError = invocation.namedArguments[#onError];
    final bool cancelOnError = invocation.namedArguments[#cancelOnError];
    final responseBodyBytes = utf8.encode(responseBody);
    return Stream<List<int>>.value(responseBodyBytes).listen(
      onData,
      onDone: onDone,
      onError: onError,
      cancelOnError: cancelOnError,
    );
  });

  if (additionalMockSetup != null) {
    additionalMockSetup(client, request, response);
  }

  return httpOpResult;
}

abstract class HttpMethods {
  static const String GET = 'GET';
  static const String DELETE = 'DELETE';
  static const String POST = 'POST';
  static const String PUT = 'PUT';
}
