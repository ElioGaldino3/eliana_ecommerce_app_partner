import 'package:eliana_partner/app/shared/base/failure.dart';
import 'package:eliana_partner/app/shared/domain/models/user_model.dart';
import 'package:flutter_triple/flutter_triple.dart';

import '../../../domain/dtos/login_dto.dart';
import '../../../domain/usecases/login.dart';

class LoginController extends NotifierStore<Failure, UserModel> {
  LoginController() : super(UserModel.emptyUser());

  void login(String email, String password) {
    execute(Login(LoginDto(email, password)));
  }
}
