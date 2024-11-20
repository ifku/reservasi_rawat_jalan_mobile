import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future<T?> showRRJDialog<T>(
  BuildContext context, {
  required Widget child,
  bool useSafeArea = true,
  bool barrierDismissible = true,
}) {
  return showAdaptiveDialog<T>(
    context: context,
    useSafeArea: useSafeArea,
    barrierDismissible: barrierDismissible,
    builder: (context) {
      return Center(
        child: Wrap(
          children: [
            child,
          ],
        ),
      );
    },
  );
}
