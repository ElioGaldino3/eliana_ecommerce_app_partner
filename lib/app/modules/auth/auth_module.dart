import 'package:flutter_modular/flutter_modular.dart';

import 'domain/repositories/user_auth_repository_interface.dart';
import 'infra/repositories/user_auth_repository_impl.dart';
import 'presenter/pages/login/login_controller.dart';
import 'presenter/pages/login/login_page.dart';
import 'presenter/pages/register/register_controller.dart';
import 'presenter/pages/register/register_page.dart';

class AuthModule extends Module {
  @override
  final List<Bind> binds = [
    Bind<UserAuthRepositoryInterface>((i) => UserAuthRepositoryImpl(i())),
    Bind.singleton((i) => LoginController()),
    Bind.singleton((i) => RegisterController()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/login', child: (_, __) => LoginPage()),
    ChildRoute('/register', child: (_, __) => RegisterPage()),
  ];
}
