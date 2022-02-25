import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class FuscaTextFormField extends HookWidget {
  final String? Function(String?)? validator;
  final AutovalidateMode? autovalidateMode;
  final TextInputAction? textInputAction;
  final void Function(String)? onFieldSubmitted;
  final void Function(String?)? onSaved;
  final String? labelText;
  final bool obscureText;
  final bool showPasswordButton;
  final String? initialValue;
  final TextInputType? keyboardType;

  const FuscaTextFormField({
    Key? key,
    this.validator,
    this.autovalidateMode,
    this.textInputAction,
    this.onFieldSubmitted,
    this.onSaved,
    this.labelText,
    this.obscureText = false,
    this.showPasswordButton = false,
    this.initialValue,
    this.keyboardType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _obscureText = useState(obscureText);
    return TextFormField(
      initialValue: initialValue,
      keyboardType: keyboardType,
      validator: validator,
      autovalidateMode: autovalidateMode ?? AutovalidateMode.onUserInteraction,
      textInputAction: TextInputAction.done,
      onFieldSubmitted: onFieldSubmitted,
      onSaved: onSaved,
      decoration: InputDecoration(
          labelText: labelText,
          suffix: showPasswordButton
              ? GestureDetector(
                  onTap: () => _obscureText.value = !_obscureText.value,
                  child: Icon(_obscureText.value ? MdiIcons.eyeOutline : MdiIcons.eyeOffOutline),
                )
              : null,
          border: const OutlineInputBorder()),
      obscureText: _obscureText.value,
    );
  }
}
