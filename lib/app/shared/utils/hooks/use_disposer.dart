import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_triple/flutter_triple.dart';

void useDisposer(BuildContext context, Disposer disposer) {
  return use(_TimeAlive(disposer));
}

class _TimeAlive extends Hook<void> {
  final Disposer disposer;
  const _TimeAlive(this.disposer);

  @override
  _TimeAliveState createState() => _TimeAliveState(disposer);
}

class _TimeAliveState extends HookState<void, _TimeAlive> {
  final Disposer disposer;

  _TimeAliveState(this.disposer);

  @override
  void initHook() {
    super.initHook();
  }

  @override
  void build(BuildContext context) {}

  @override
  void dispose() {
    disposer();
    super.dispose();
  }
}
