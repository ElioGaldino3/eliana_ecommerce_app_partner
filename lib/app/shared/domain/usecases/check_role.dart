import 'package:eliana_partner/app/shared/domain/repositories/user_repository_interface.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../base/use_case.dart';
import '../models/user_model.dart';

class CheckRole implements UseCase<Future<UserModel>> {
  final userRepo = Modular.get<UserRepositoryInterface>();
  final UserModel _user;

  CheckRole(this._user);

  @override
  Future<UserModel> call() async {
    return await userRepo.getUser(_user);
  }
}
