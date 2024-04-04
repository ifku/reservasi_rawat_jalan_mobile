import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

Future<void> showRRJBottomSheet(
  BuildContext context, {
  required Widget child,
  bool isScrollControlled = true,
  bool showDragHandle = true,
  bool useRouteNavigator = false,
  bool isDismissible = true,
  EdgeInsetsGeometry? padding,
  Color? backgroundColor,
}) {
  return showModalBottomSheet(
    isScrollControlled: isScrollControlled,
    showDragHandle: showDragHandle,
    useRootNavigator: useRouteNavigator,
    elevation: 0,
    context: context,
    backgroundColor: backgroundColor ?? Theme.of(context).colorScheme.surface,
    isDismissible: isDismissible,
    useSafeArea: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(12.0),
        topRight: Radius.circular(12.0),
      ),
    ),
    builder: (context) {
      return Wrap(
        children: [
          Padding(
              padding: padding ??
                  EdgeInsets.fromLTRB(16, 0, 16,
                      MediaQuery.of(context).viewInsets.bottom + 20)),
          child,
        ],
      );
    },
  );
}
