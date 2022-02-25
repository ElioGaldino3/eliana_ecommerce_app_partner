import 'package:eliana_partner/app/shared/utils/hooks/use_disposer.dart';
import 'package:eliana_partner/app/shared/utils/show_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../domain/erros/erros.dart';
import 'login_controller.dart';
import 'widgets/login_buttons.dart';
import 'widgets/login_form.dart';

class LoginPage extends HookWidget {
  final controller = Modular.get<LoginController>();
  final _formKey = GlobalKey<FormState>();

  LoginPage({Key? key}) : super(key: key);

  void onSubmitted() {
    if (_formKey.currentState!.validate()) _formKey.currentState!.save();
  }

  void onRegister() async {
    final bool? result = await Modular.to.pushNamed('/auth/register');

    if (result != null && result) showToast('Cadastro feito com sucesso');
  }

  @override
  Widget build(BuildContext context) {
    useDisposer(
      context,
      controller.observer(
        onState: (user) {
          if (user.id != null) {
            Modular.to.pushReplacementNamed('/home/');
          }
        },
        onError: (err) {
          if (err is InvalidCredencialsFailure) {
            showToast('Email ou senha inválidos', true);
          } else if (err is ConectionFailure) {
            showToast('Falha na conexão', true);
          } else {
            showToast('Erro desconhecido, por favor contate um administrador', true, const Duration(seconds: 3));
          }
        },
      ),
    );
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: double.infinity,
          height: 670,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              KeyboardVisibilityBuilder(builder: (context, isKeyboardVisible) {
                return Visibility(visible: !isKeyboardVisible, child: Image.asset('assets/images/logo.png', scale: 1.2));
              }),
              LoginForm(
                formKey: _formKey,
                onSave: controller.login,
                onSubmitted: onSubmitted,
              ),
              LoginButtons(
                onSubmitted: onSubmitted,
                onLogin: onRegister,
              )
            ],
          ),
        ),
      ),
    );
  }
}
