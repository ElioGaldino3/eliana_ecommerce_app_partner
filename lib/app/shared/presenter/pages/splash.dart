import 'package:eliana_partner/app/shared/controllers/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../widgets/eliana_progress_indicator.dart';

class SplashPage extends HookWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final hasError = useState(false);
    useEffect(() {
      final userController = Modular.get<UserController>();
      final disposer = userController.observer(
        onState: (user) {
          if (user.id != null) {
            Modular.to.pushReplacementNamed('/home/');
          } else {
            Modular.to.pushReplacementNamed('/auth/login');
          }
        },
        onError: (err) => hasError.value = true,
      );

      return disposer;
    });
    return Scaffold(
      body: hasError.value ? const Center(child: Text('Ocorreu um erro no carregamento, por favor reabra o aplicativo')) : const ElianaProgressIndicator(),
    );
  }
}
