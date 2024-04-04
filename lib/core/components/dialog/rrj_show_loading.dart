import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future<dynamic> showRRJLoading(
  BuildContext context, {
  required Widget loadingWidget,
  bool barrierDismissible = false,
  String? barierLabel = 'rrj-loading',
  Color? overlayColor,
  MainAxisAlignment mainAxisAlignment = MainAxisAlignment.center,
}) {
  return showGeneralDialog(
    context: context,
    barrierColor: overlayColor ?? const Color(0x7f3F3F46),
    barrierLabel: barrierDismissible ? barierLabel : null,
    transitionBuilder: (context, a1, a2, widget) {
      final curvedValue = Curves.easeInOut.transform(a1.value) - 1.0;
      return PopScope(
        onPopInvoked: (didPop) {},
        canPop: barrierDismissible,
        child: Transform(
          transform: Matrix4.translationValues(0.0, -(curvedValue * 200), 0.0),
          child: Opacity(
            opacity: a1.value,
            child: Column(
              mainAxisAlignment: mainAxisAlignment,
              children: [
                Material(
                  color: Colors.transparent,
                  child: widget,
                ),
              ],
            ),
          ),
        ),
      );
    },
    transitionDuration: const Duration(milliseconds: 200),
    barrierDismissible: barrierDismissible,
    pageBuilder: (context, animation1, animation2) {
      return loadingWidget;
    },
  );
}

Future<void> hideRRJLoading(BuildContext context) async {
  if (context.mounted && ModalRoute.of(context)?.isActive == true) {
    if (Navigator.of(context).canPop() == true) {
      Navigator.of(context).pop();
    }
  }
}
