import 'package:dio/dio.dart';
import 'package:eliana_partner/app/shared/controllers/user_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

final tokenInterceptor = InterceptorsWrapper(
  onRequest: (options, handler) async {
    final userController = Modular.get<UserController>();
    if (userController.state.token != null) {
      options.headers['Authorization'] = 'Bearer ${userController.state.token}';
    }
    return handler.next(options);
  },
);
