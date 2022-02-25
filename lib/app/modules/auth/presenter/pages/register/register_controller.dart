import 'package:eliana_partner/app/shared/base/failure.dart';
import 'package:flutter_triple/flutter_triple.dart';

import '../../../domain/dtos/register_dto.dart';
import '../../../domain/usecases/register.dart';

class RegisterController extends NotifierStore<Failure, bool> {
  RegisterController() : super(false);

  void register(String name, String email, String password) {
    execute(Register(RegisterDto(name, email, password)));
  }
}
