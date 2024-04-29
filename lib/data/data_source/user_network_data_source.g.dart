// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_network_data_source.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserResult _$UserResultFromJson(Map<String, dynamic> json) => UserResult(
      success: json['success'] as bool?,
      data: json['data'] == null
          ? null
          : UserInfo.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserResultToJson(UserResult instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
    };

UserInfo _$UserInfoFromJson(Map<String, dynamic> json) => UserInfo(
      name: json['name'] as String?,
      note: json['note'] as String?,
      age: json['age'] as int?,
      registerDate: json['registerDate'] as String?,
    );

Map<String, dynamic> _$UserInfoToJson(UserInfo instance) => <String, dynamic>{
      'name': instance.name,
      'note': instance.note,
      'age': instance.age,
      'registerDate': instance.registerDate,
    };

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _UserRemoteDataSource implements UserRemoteDataSource {
  _UserRemoteDataSource(
    this._dio, {
    this.baseUrl,
  }) {
    baseUrl ??= 'https://umayadia-apisample.azurewebsites.net/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<UserResult> fetchPerson(String name) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<UserResult>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'api/persons/${name}',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = UserResult.fromJson(_result.data!);
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }

  String _combineBaseUrls(
    String dioBaseUrl,
    String? baseUrl,
  ) {
    if (baseUrl == null || baseUrl.trim().isEmpty) {
      return dioBaseUrl;
    }

    final url = Uri.parse(baseUrl);

    if (url.isAbsolute) {
      return url.toString();
    }

    return Uri.parse(dioBaseUrl).resolveUri(url).toString();
  }
}
