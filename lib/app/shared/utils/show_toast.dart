import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart' as okt;

showToast(String message, [bool? isErr, Duration? duration]) {
  okt.showToastWidget(
      LayoutBuilder(
        builder: (context, constraints) => Container(
          padding: const EdgeInsets.all(14),
          width: constraints.maxWidth * .8,
          height: 80,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: isErr != null && isErr ? Colors.red[600] : Colors.green[700],
          ),
          child: Center(
            child: Text(message),
          ),
        ),
      ),
      position: const okt.ToastPosition(align: Alignment.topCenter, offset: 28),
      duration: duration);
}
