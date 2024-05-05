import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';

part 'user_network_data_source.g.dart';

final personRemoteDataSourceProvider =
    Provider.family<UserRemoteDataSource, Dio>(
  (ref, dio) => UserRemoteDataSource(dio),
);

@RestApi(baseUrl: 'https://umayadia-apisample.azurewebsites.net/')
abstract class UserRemoteDataSource {
  factory UserRemoteDataSource(Dio dio, {String baseUrl}) =
      _UserRemoteDataSource;

  @GET('api/persons/{name}')
  Future<UserResult> fetchPerson(@Path('name') String name);
}

@JsonSerializable()
class UserResult {
  const UserResult({this.success, this.data});

  factory UserResult.fromJson(Map<String, dynamic> json) =>
      _$UserResultFromJson(json);

  final bool? success;
  final UserInfo? data;

  Map<String, dynamic> toJson() => _$UserResultToJson(this);
}

@JsonSerializable()
class UserInfo {
  const UserInfo({this.name, this.note, this.age, this.registerDate});

  factory UserInfo.fromJson(Map<String, dynamic> json) =>
      _$UserInfoFromJson(json);

  final String? name;
  final String? note;
  final int? age;
  final String? registerDate;

  Map<String, dynamic> toJson() => _$UserInfoToJson(this);
}
