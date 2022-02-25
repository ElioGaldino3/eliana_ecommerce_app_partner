import 'package:eliana_partner/app/shared/base/use_case.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../dtos/register_dto.dart';
import '../repositories/user_auth_repository_interface.dart';

class Register implements UseCase<Future<bool>> {
  final RegisterDto registerDto;

  Register(this.registerDto);

  @override
  Future<bool> call() async {
    try {
      await Modular.get<UserAuthRepositoryInterface>().register(registerDto);

      return true;
    } catch (e) {
      rethrow;
    }
  }
}
