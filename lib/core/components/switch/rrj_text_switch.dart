import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RRJTextSwitch extends StatelessWidget {
  const RRJTextSwitch({
    super.key,
    required this.label,
    required this.value,
    required this.onChanged,
    this.padding,
  });

  final String label;
  final bool value;
  final Function(bool) onChanged;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.all(0),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text(label,
            style: Theme.of(context).textTheme.bodyLarge),
        CupertinoSwitch(
            activeColor: Theme.of(context).colorScheme.primary,
            value: value,
            onChanged: onChanged)
      ]),
    );
  }
}
