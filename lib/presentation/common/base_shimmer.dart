import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class BaseShimmer extends StatelessWidget {
  const BaseShimmer({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Theme.of(context).colorScheme.surfaceVariant,
      highlightColor: Theme.of(context).colorScheme.onSurface.withOpacity(0.1),
      child: child,
    );
  }
}
