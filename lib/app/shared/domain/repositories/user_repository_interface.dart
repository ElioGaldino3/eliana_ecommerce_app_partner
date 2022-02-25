import '../models/user_model.dart';

abstract class UserRepositoryInterface {
  Future<UserModel> getUser(UserModel user);
}
