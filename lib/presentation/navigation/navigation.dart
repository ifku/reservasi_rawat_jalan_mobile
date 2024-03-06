import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Navigation extends StatefulWidget {
  const Navigation({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;
  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
