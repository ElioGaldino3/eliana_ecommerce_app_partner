import 'package:flutter/material.dart';

class FuscaElevatedButton extends StatelessWidget {
  final bool isLoading;
  final Widget child;
  final VoidCallback onPressed;

  const FuscaElevatedButton({
    Key? key,
    this.isLoading = false,
    required this.child,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: isLoading
          ? Container(
              padding: const EdgeInsets.all(6),
              width: 32,
              height: 32,
              child: const Center(child: CircularProgressIndicator()),
            )
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: child),
      onPressed: isLoading ? null : onPressed,
    );
  }
}
