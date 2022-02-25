
import 'package:dio/dio.dart';
import 'package:eliana_partner/app/shared/base/failure.dart';
import 'package:eliana_partner/app/shared/domain/models/user_model.dart';

import '../../domain/dtos/login_dto.dart';
import '../../domain/dtos/register_dto.dart';
import '../../domain/erros/erros.dart';
import '../../domain/repositories/user_auth_repository_interface.dart';

class UserAuthRepositoryImpl implements UserAuthRepositoryInterface {
  final Dio _dio;

  UserAuthRepositoryImpl(this._dio);

  @override
  Future<UserModel> login(LoginDto loginDto) async {
    try {
      if (loginDto.email.isEmpty || loginDto.password.isEmpty) {
        throw InvalidFieldsFailure();
      }

      final response = await _dio.post('/auth/login', data: loginDto.toMap());

      return UserModel.fromMap(response.data);
    } on DioError catch (e) {
      int? statusCode = e.response?.statusCode;
      if (statusCode != null && statusCode >= 400 && statusCode < 500) {
        throw InvalidCredencialsFailure();
      } else {
        await Future.delayed(const Duration(milliseconds: 500));
        throw ConectionFailure();
      }
    } catch (e) {
      if (e is Failure) rethrow;
      throw Failure();
    }
  }

  @override
  Future<void> register(RegisterDto registerDto) async {
    try {
      if (registerDto.email.isEmpty || registerDto.password.isEmpty || registerDto.name.isEmpty) {
        throw InvalidFieldsFailure();
      }
      await _dio.post('/auth/register', data: registerDto.toMap());
    } on DioError catch (e) {
      int? statusCode = e.response?.statusCode;
      if (statusCode != null && statusCode >= 500) {
        throw SystemFailure();
      } else if (statusCode == 409) {
        throw ConflictFailure();
      } else {
        throw ConectionFailure();
      }
    } catch (e) {
      throw Failure();
    }
  }
}
