import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:fusca_branco/widgets/form/text_form_field.dart';

import '../../../../utils/validations.dart';

class RegisterForm extends HookWidget {
  final Function(String, String, String) onSave;
  final Function onSubmitted;
  final GlobalKey<FormState> formKey;

  const RegisterForm({Key? key, required this.onSave, required this.formKey, required this.onSubmitted}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String email = '';
    String name = '';
    final double width = MediaQuery.of(context).size.width;
    return SizedBox(
      width: width * .7,
      child: Form(
        key: formKey,
        child: Column(
          children: [
            FuscaTextFormField(
              initialValue: kDebugMode ? 'Elio Galdino' : '',
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if (value != null && value.isEmpty) return 'Coloque um nome';
                return null;
              },
              autovalidateMode: AutovalidateMode.onUserInteraction,
              textInputAction: TextInputAction.next,
              labelText: 'Nome',
              onSaved: (value) => {if (value != null) name = value},
            ),
            const SizedBox(height: 8),
            FuscaTextFormField(
              initialValue: kDebugMode ? 'eliogaldino792@outlook.com' : '',
              keyboardType: TextInputType.emailAddress,
              validator: validateEmailField,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              textInputAction: TextInputAction.next,
              labelText: 'Email',
              onSaved: (value) => {if (value != null) email = value},
            ),
            const SizedBox(height: 8),
            FuscaTextFormField(
              initialValue: kDebugMode ? 'elio1234' : '',
              validator: validatePassword,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              textInputAction: TextInputAction.done,
              onFieldSubmitted: (_) => onSubmitted(),
              onSaved: (value) => {if (value != null) onSave(name, email, value)},
              labelText: 'Senha',
              obscureText: true,
              showPasswordButton: true,
            )
          ],
        ),
      ),
    );
  }
}
