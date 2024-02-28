import 'package:flutter/material.dart';

class ThemePageDemo extends StatelessWidget {
  const ThemePageDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Container(
            color: Colors.transparent,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text("Core"),
                  const SizedBox(height: 20.0),
                  GridView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4),
                    children: [
                      Container(
                        height: 100,
                        width: 100,
                        color: Theme.of(context).colorScheme.background,
                      ),
                      Container(
                        height: 100,
                        width: 100,
                        color: Theme.of(context).colorScheme.onBackground,
                      ),
                      Container(
                        height: 100,
                        width: 100,
                        color: Theme.of(context).colorScheme.scrim,
                      ),
                      Container(
                        height: 100,
                        width: 100,
                        color: Theme.of(context).colorScheme.shadow,
                      ),
                    ],
                  ),
                  const SizedBox(height: 20.0),
                  const Text("Surface"),
                  const SizedBox(height: 12.0),
                  GridView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4),
                    children: [
                      Container(
                        height: 100,
                        width: 100,
                        color: Theme.of(context).colorScheme.surface,
                      ),
                      Container(
                        height: 100,
                        width: 100,
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                      Container(
                        height: 100,
                        width: 100,
                        color: Theme.of(context).colorScheme.surfaceTint,
                      ),
                      Container(
                        height: 100,
                        width: 100,
                        color: Theme.of(context).colorScheme.surfaceVariant,
                      ),
                      Container(
                        height: 100,
                        width: 100,
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                      Container(
                        height: 100,
                        width: 100,
                        color: Theme.of(context).colorScheme.inverseSurface,
                      ),
                      Container(
                        height: 100,
                        width: 100,
                        color: Theme.of(context).colorScheme.onInverseSurface,
                      ),
                    ],
                  ),
                  const SizedBox(height: 20.0),
                  const Text("Primary"),
                  const SizedBox(height: 12.0),
                  GridView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4),
                    children: [
                      Container(
                        height: 100,
                        width: 100,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      Container(
                        height: 100,
                        width: 100,
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                      Container(
                        height: 100,
                        width: 100,
                        color: Theme.of(context).colorScheme.primaryContainer,
                      ),
                      Container(
                        height: 100,
                        width: 100,
                        color: Theme.of(context).colorScheme.onPrimaryContainer,
                      ),
                      Container(
                        height: 100,
                        width: 100,
                        color: Theme.of(context).colorScheme.inversePrimary,
                      ),
                    ],
                  ),
                  const SizedBox(height: 20.0),
                  const Text("Secondary"),
                  const SizedBox(height: 12.0),
                  GridView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4),
                    children: [
                      Container(
                        height: 100,
                        width: 100,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                      Container(
                        height: 100,
                        width: 100,
                        color: Theme.of(context).colorScheme.onSecondary,
                      ),
                      Container(
                        height: 100,
                        width: 100,
                        color: Theme.of(context).colorScheme.secondaryContainer,
                      ),
                      Container(
                        height: 100,
                        width: 100,
                        color: Theme.of(context).colorScheme.onSecondaryContainer,
                      ),
                    ],
                  ),
                  const SizedBox(height: 20.0),
                  const Text("Tertiary"),
                  const SizedBox(height: 12.0),
                  GridView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4),
                    children: [
                      Container(
                        height: 100,
                        width: 100,
                        color: Theme.of(context).colorScheme.tertiary,
                      ),
                      Container(
                        height: 100,
                        width: 100,
                        color: Theme.of(context).colorScheme.onTertiary,
                      ),
                      Container(
                        height: 100,
                        width: 100,
                        color: Theme.of(context).colorScheme.tertiaryContainer,
                      ),
                      Container(
                        height: 100,
                        width: 100,
                        color: Theme.of(context).colorScheme.onTertiaryContainer,
                      ),
                    ],
                  ),
                  const SizedBox(height: 20.0),
                  const Text("Error"),
                  const SizedBox(height: 12.0),
                  GridView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4),
                    children: [
                      Container(
                        height: 100,
                        width: 100,
                        color: Theme.of(context).colorScheme.error,
                      ),
                      Container(
                        height: 100,
                        width: 100,
                        color: Theme.of(context).colorScheme.onError,
                      ),
                      Container(
                        height: 100,
                        width: 100,
                        color: Theme.of(context).colorScheme.errorContainer,
                      ),
                      Container(
                        height: 100,
                        width: 100,
                        color: Theme.of(context).colorScheme.onErrorContainer,
                      ),
                    ],
                  ),
                  const SizedBox(height: 20.0),
                  const Text("Outline"),
                  const SizedBox(height: 12.0),
                  GridView(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4),
                      children: [
                        Container(
                          height: 100,
                          width: 100,
                          color: Theme.of(context).colorScheme.outline,
                        ),
                        Container(
                          height: 100,
                          width: 100,
                          color: Theme.of(context).colorScheme.outlineVariant,
                        ),
                      ])
                ],
              ),
            ),
          ),
        ));
  }
}
