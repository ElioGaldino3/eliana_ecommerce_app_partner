import 'package:dartz/dartz.dart';

import '../../domain/models/user_model.dart';

abstract class UserStorageInterface {
  Future<Either<Exception, UserModel>> getUserFromStorage();

  Future<void> saveUserInStorage(UserModel user);
}
