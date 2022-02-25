import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class FuscaTextField extends HookWidget {
  final Widget? prefix;
  final String? hintText;
  const FuscaTextField({
    Key? key,
    this.prefix,
    this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(width: 16),
          prefix ?? const SizedBox(),
          const SizedBox(width: 8),
           Expanded(
            child: TextField(
              decoration: InputDecoration(border: InputBorder.none, fillColor: Colors.white, hintText: hintText),
            ),
          )
        ],
      ),
    );
  }
}
