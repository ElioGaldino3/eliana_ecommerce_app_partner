import 'package:dio/dio.dart';
import 'package:eliana_partner/app/shared/base/failure.dart';
import 'package:eliana_partner/app/shared/domain/models/erros.dart';
import 'package:eliana_partner/app/shared/domain/models/user_model.dart';
import 'package:eliana_partner/app/shared/domain/repositories/user_repository_interface.dart';

class UserRepositoryImpl implements UserRepositoryInterface {
  final Dio _dio;

  UserRepositoryImpl(this._dio);

  @override
  Future<UserModel> getUser(UserModel user) async {
    try {
      final response = await _dio.get('/auth/whoiam', options: Options(headers: {'Authorization': 'Bearer ${user.token}'}));

      return UserModel.fromMap(response.data);
    } on DioError catch (err) {
      if (err.response != null) {
        throw UnauthorizedFailure();
      } else {
        throw ConnectionFailure();
      }
    } catch (e) {
      throw Failure();
    }
  }
}
