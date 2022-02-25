import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../domain/models/user_model.dart';
import 'user_contract.dart';

class UserSharedPreferences implements UserStorageInterface {
  final SharedPreferences _sharedPreferences;

  UserSharedPreferences(this._sharedPreferences);

  @override
  Future<Either<Exception, UserModel>> getUserFromStorage() async {
    try {
      final userShared = _sharedPreferences.getString('user');
      if (userShared != null) {
        final user = UserModel.fromJson(userShared);
        return Right(user);
      } else {
        return Left(Exception('user not found'));
      }
    } catch (e) {
      return Left(e as Exception);
    }
  }

  @override
  Future<void> saveUserInStorage(UserModel user) async {
    try {
      _sharedPreferences.setString('user', user.toJson());
    } catch (_) {}
  }
}
