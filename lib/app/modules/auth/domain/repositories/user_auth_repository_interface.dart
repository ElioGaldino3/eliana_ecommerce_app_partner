import 'package:eliana_partner/app/shared/domain/models/user_model.dart';

import '../dtos/login_dto.dart';
import '../dtos/register_dto.dart';

abstract class UserAuthRepositoryInterface {
  Future<UserModel> login(LoginDto loginDto);
  Future<void> register(RegisterDto registerDto);
}
