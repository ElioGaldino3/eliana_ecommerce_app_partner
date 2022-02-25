import 'package:eliana_partner/app/shared/utils/hooks/use_disposer.dart';
import 'package:eliana_partner/app/shared/utils/show_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../domain/erros/erros.dart';
import 'register_controller.dart';
import 'widgets/register_buttons.dart';
import 'widgets/register_form.dart';

class RegisterPage extends HookWidget {
  final controller = Modular.get<RegisterController>();
  final _formKey = GlobalKey<FormState>();

  RegisterPage({Key? key}) : super(key: key);

  void onSubmitted() {
    if (_formKey.currentState!.validate()) _formKey.currentState!.save();
  }

  void onLogin() async {
    Modular.to.pushNamed('/auth/login');
  }

  @override
  Widget build(BuildContext context) {
    useDisposer(
      context,
      controller.observer(
        onState: (state) {
          if (state) {
            Modular.to.pop(true);
          }
        },
        onError: (err) {
          if (err is SystemFailure) {
            showToast('Erro no sistema, tente novamente mais tarde', true);
          } else if (err is ConflictFailure) {
            showToast('Este email já está em uso', true);
          } else if (err is ConectionFailure) {
            showToast('Falha na conexão com o servidor', true);
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
              RegisterForm(
                formKey: _formKey,
                onSave: controller.register,
                onSubmitted: onSubmitted,
              ),
              RegisterButtons(
                onSubmitted: onSubmitted,
                onLogin: onLogin,
              )
            ],
          ),
        ),
      ),
    );
  }
}
