import 'package:eliana_partner/app/shared/base/use_case.dart';
import 'package:eliana_partner/app/shared/controllers/user_controller.dart';
import 'package:eliana_partner/app/shared/domain/models/user_model.dart';
import 'package:eliana_partner/app/shared/repositories/user_storage/user_contract.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../dtos/login_dto.dart';
import '../repositories/user_auth_repository_interface.dart';

class Login implements UseCase<Future<UserModel>> {
  final LoginDto loginDto;
  late UserController _userController;
  late UserAuthRepositoryInterface _repo;
  late UserStorageInterface _storage;

  Login(this.loginDto) {
    _storage = Modular.get();
    _userController = Modular.get();
    _repo = Modular.get();
  }

  @override
  Future<UserModel> call() async {
    final user = await _repo.login(loginDto);
    _userController.setUser(user);
    _storage.saveUserInStorage(user);

    return user;
  }
}
