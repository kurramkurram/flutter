import 'package:dio/dio.dart';
import 'package:flutter_app/data/data_source/user_network_data_source.dart';
import 'package:flutter_app/data/data_source/user_local_data_source.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final userRepositoryProvider = Provider.family<UserRepository, Dio>(
  (ref, dio) => UserRepository(ref, dio),
);

class UserRepository {
  UserRepository(this._ref, this._dio);

  final Ref _ref;

  final Dio _dio;

  Future<UserResult> fetchPerson(String name) async {
    final localDataSource = _ref.read(userLocalDataSourceProvider);
    final person = await localDataSource.fetchPerson();
    final userName = person.name;

    // ローカルに保存済みであればそちらを利用する
    if (userName != null && userName.isNotEmpty && userName == name) {
      return UserResult(success: true, data: person);
    }

    // ローカルに保存済みでなければ取りに行く
    final personResult =
        await _ref.read(personRemoteDataSourceProvider(_dio)).fetchPerson(name);
    if (personResult.data != null) {
      localDataSource.savePerson(personResult.data!);
    }

    return personResult;
  }
}
