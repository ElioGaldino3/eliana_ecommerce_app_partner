import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:fusca_branco/widgets/form/text_form_field.dart';

import '../../../../utils/validations.dart';


class LoginForm extends HookWidget {
  final Function(String, String) onSave;
  final Function onSubmitted;
  final GlobalKey<FormState> formKey;

  const LoginForm({Key? key, required this.onSave, required this.formKey, required this.onSubmitted}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String email = '';
    final double width = MediaQuery.of(context).size.width;
    return SizedBox(
      width: width * .7,
      child: Form(
        key: formKey,
        child: Column(
          children: [
            FuscaTextFormField(
              initialValue: kDebugMode ? 'eliogaldino79@outlook.com' : '',
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
              onSaved: (value) => {if (value != null) onSave(email, value)},
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
