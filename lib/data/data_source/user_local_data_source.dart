
import 'package:flutter_app/data/data_source/preferences_data_source.dart';
import 'package:flutter_app/data/data_source/user_network_data_source.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

enum User {
  /// ユーザ名
  name,

  /// ユーザの情報
  note,

  /// 年齢
  age,

  /// 登録日
  registerDate,
}

extension UserKey on User {
  String get key {
    switch (this) {
      case User.name:
        return 'name';
      case User.note:
        return 'note';
      case User.age:
        return 'age';
      case User.registerDate:
        return 'registerDate';
    }
  }
}

final userLocalDataSourceProvider = Provider(
  (ref) => UserLocalDataSource(),
);

class UserLocalDataSource {
  UserLocalDataSource({
    PreferencesDataSource? preferencesDataSource,
  }) : _sharedPreferenceDataSource =
            preferencesDataSource ?? PreferencesDataSourceImpl();

  final PreferencesDataSource _sharedPreferenceDataSource;

  Future<UserInfo> fetchPerson() async {
    final name = await _sharedPreferenceDataSource.getString(User.name.key, '');
    final note = await _sharedPreferenceDataSource.getString(User.note.key, '');
    final age = await _sharedPreferenceDataSource.getInt(User.age.key, -1);
    final registerDate =
        await _sharedPreferenceDataSource.getString(User.registerDate.key, '');

    return UserInfo(name: name, note: note, age: age, registerDate: registerDate);
  }

  Future<void> savePerson(UserInfo person) async {
    if (person.name != null) {
      await _sharedPreferenceDataSource.setString(User.name.key, person.name!);
    }
    if (person.note != null) {
      await _sharedPreferenceDataSource.setString(User.note.key, person.note!);
    }
    if (person.age != null) {
      await _sharedPreferenceDataSource.setInt(User.age.key, person.age!);
    }
    if (person.registerDate != null) {
      await _sharedPreferenceDataSource.setString(
          User.registerDate.key, person.registerDate!);
    }
  }
}
