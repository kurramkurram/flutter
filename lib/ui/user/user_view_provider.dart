import 'package:dio/dio.dart';
import 'package:flutter_app/data/repository/user_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final userViewProvider = FutureProvider((ref) async {
  final dio = Dio();
  return await ref.read(userRepositoryProvider(dio)).fetchPerson('Shakespeare');
});
