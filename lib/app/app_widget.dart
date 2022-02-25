import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:oktoast/oktoast.dart';
import 'package:fusca_branco/fusca_branco.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OKToast(
        child: MaterialApp(
      title: 'Eliana Personalizações',
      theme: lightTheme,
    ).modular()); //added by extension
  }
}
