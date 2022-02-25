import 'package:eliana_partner/app/shared/utils/hooks/use_disposer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:fusca_branco/widgets/elevated_button.dart';

import '../../login/login_controller.dart';



class RegisterButtons extends HookWidget {
  final VoidCallback onSubmitted;
  final VoidCallback onLogin;
  final loginController = Modular.get<LoginController>();
  RegisterButtons({
    Key? key,
    required this.onSubmitted,
    required this.onLogin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isLoading = useState(false);
    useDisposer(
      context,
      loginController.observer(
        onState: (_) => isLoading.value = false,
        onLoading: (loading) => isLoading.value = loading,
        onError: (e) => isLoading.value = false,
      ),
    );
    return Column(
      children: [
        FuscaElevatedButton(onPressed: onSubmitted, child: const Text('Cadastrar'), isLoading: isLoading.value),
        TextButton(
          onPressed: isLoading.value ? null : onLogin,
          child: Text(
            isLoading.value ? 'Carregando...' : 'Já possui um cadastro? Faça o login',
            style: TextStyle(fontSize: 12, color: Colors.grey[600]),
          ),
        ),
      ],
    );
  }
}
