import 'package:dio/dio.dart';
import 'package:eliana_partner/app/modules/auth/auth_module.dart';
import 'package:eliana_partner/app/modules/home/home_module.dart';
import 'package:eliana_partner/app/shared/controllers/user_controller.dart';
import 'package:eliana_partner/app/shared/infra/repositories/user_repository_impl.dart';
import 'package:eliana_partner/app/shared/presenter/pages/splash.dart';
import 'package:eliana_partner/app/shared/repositories/user_storage/user_contract.dart';
import 'package:eliana_partner/app/shared/repositories/user_storage/user_shared_preferences.dart';
import 'package:eliana_partner/app/shared/utils/dio_interceptors.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hasura_connect/hasura_connect.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'shared/domain/models/user_model.dart';

class AppModule extends Module {
  final baseApiUrl = dotenv.env['API_URL'] ?? '';
  final hasuraConnectUrl = dotenv.env['HASURA_ENDPOINT'] ?? '';

  late final Dio _dio;
  AppModule() {
    _dio = Dio(BaseOptions(baseUrl: baseApiUrl));
    _dio.interceptors.add(tokenInterceptor);
  }

  @override
  List<Bind> get binds => [
        Bind((i) => UserController(UserModel.emptyUser()),),
        AsyncBind<UserStorageInterface>((i) async =>
            UserSharedPreferences(await SharedPreferences.getInstance())),
        Bind.lazySingleton((i) => _dio),
        Bind((i) => UserRepositoryImpl(i())),
        Bind.factory((i) => HasuraConnect(hasuraConnectUrl))
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (_, __) => const SplashPage()),
        ModuleRoute('/auth', module: AuthModule()),
        ModuleRoute('/home', module: HomeModule()),
      ];
}
