import 'dart:convert';

import 'package:http/http.dart';

typedef HttpHeaders = Map<String, String>;
typedef HttpQueryParameters = Map<String, String>;
typedef Json = Map<String, dynamic>;

enum HttpRequestMethod {
  get,
  head,
  post,
  put,
  delete,
  connect,
  options,
  trace,
  patch
}

extension IsThatHttpRequestMethod on HttpRequestMethod {
  bool get isGet => this == HttpRequestMethod.get;
  bool get isHead => this == HttpRequestMethod.head;
  bool get isPost => this == HttpRequestMethod.post;
  bool get isPut => this == HttpRequestMethod.put;
  bool get isDelete => this == HttpRequestMethod.delete;
  bool get isConnect => this == HttpRequestMethod.connect;
  bool get isOptions => this == HttpRequestMethod.options;
  bool get isTrace => this == HttpRequestMethod.trace;
  bool get isPatch => this == HttpRequestMethod.patch;
}

abstract class RestfulApiServiceBase {
  RestfulApiServiceBase(this._authority);

  final String _authority;
  late final Client _client = Client();

  Future<Response> request(
    String path, {
    HttpRequestMethod method = HttpRequestMethod.get,
    HttpHeaders? headers,
    HttpQueryParameters? queryParameters,
    Object? body,
    Encoding? encoding,
  }) {
    final Uri url = Uri.https(_authority, path, queryParameters);

    if (method.isGet || method.isHead) {
      final Future<Response> Function(
        Uri url, {
        HttpHeaders? headers,
      }) requestFunction = method.isGet ? _client.get : _client.head;

      return requestFunction(url, headers: headers);
    } else {
      late final Future<Response> Function(
        Uri url, {
        HttpHeaders? headers,
        Object? body,
        Encoding? encoding,
      }) requestFunction;

      switch (method) {
        case HttpRequestMethod.post:
          requestFunction = _client.post;
          break;
        case HttpRequestMethod.put:
          requestFunction = _client.put;
          break;
        case HttpRequestMethod.delete:
          requestFunction = _client.delete;
          break;
        case HttpRequestMethod.patch:
          requestFunction = _client.patch;
          break;
        default:
          throw UnsupportedError('Unsupported HttpRequestMethod: $method');
      }

      return requestFunction(
        url,
        headers: headers,
        body: body,
        encoding: encoding,
      );
    }
  }

  Future<T> requestData<T>({
    required String path,
    required T Function(Json) deserializer,
    HttpRequestMethod method = HttpRequestMethod.get,
    HttpHeaders? headers,
    HttpQueryParameters? queryParameters,
    Object? body,
    Encoding? encoding,
  }) {
    return request(
      path,
      method: method,
      headers: headers,
      queryParameters: queryParameters,
      body: body,
      encoding: encoding,
    ).then((response) {
      return deserializer(
        json.decode(response.body),
      );
    });
  }

  Future<List<T>> requestDataList<T>({
    required String path,
    required T Function(Json) deserializer,
    HttpRequestMethod method = HttpRequestMethod.get,
    HttpHeaders? headers,
    HttpQueryParameters? queryParameters,
    Object? body,
    Encoding? encoding,
  }) {
    return request(
      path,
      method: method,
      headers: headers,
      queryParameters: queryParameters,
      body: body,
      encoding: encoding,
    ).then((response) {
      return (json.decode(response.body) as Iterable<dynamic>)
          .map((jsonDynamic) => deserializer(jsonDynamic as Json))
          .toList(growable: false);
    });
  }

  void close() {
    _client.close();
  }
}
