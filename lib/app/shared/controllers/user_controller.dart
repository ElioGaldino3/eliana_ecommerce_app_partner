import 'package:eliana_partner/app/shared/domain/usecases/check_role.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';

import '../../app_module.dart';
import '../domain/models/user_model.dart';
import '../repositories/user_storage/user_contract.dart';

class UserController extends NotifierStore<Exception, UserModel> {
  UserController(UserModel initialState) : super(initialState) {
    loadUserStorage();
  }

  void setUser(UserModel user) {
    update(user);
  }

  Future<void> loadUserStorage() async {
    await Modular.isModuleReady<AppModule>();
    final userStorage = Modular.get<UserStorageInterface>();
    final userEither = await userStorage.getUserFromStorage();
    await Future.delayed(const Duration(seconds: 2));
    userEither.fold((l) => setUser(UserModel.emptyUser()), (user) async {
      final userUpdated = await CheckRole(user).call();
      await userStorage.saveUserInStorage(userUpdated);
      setUser(userUpdated);
    });
  }
}
