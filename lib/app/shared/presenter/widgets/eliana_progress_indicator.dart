import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

class ElianaProgressIndicator extends StatelessWidget {
  const ElianaProgressIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SizedBox(
        height: 110,
        child: FlareActor(
          "assets/animations/ElianaLoading.flr",
          animation: "Loading",
        ),
      ),
    );
  }
}
