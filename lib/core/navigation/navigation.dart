import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:reservasi_rawat_jalan_mobile/core/gen/assets.gen.dart';
import 'package:reservasi_rawat_jalan_mobile/core/gen/locale_keys.g.dart';

class Navigation extends StatefulWidget {
  const Navigation({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  void _goBranch(int index) {
    widget.navigationShell.goBranch(
      index,
      initialLocation: index == widget.navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.navigationShell,
      bottomNavigationBar: BottomAppBar(
        color: Theme.of(context).colorScheme.surface,
        elevation: 0,
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width / 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    _goBranch(0);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border(
                        top: widget.navigationShell.currentIndex == 0
                            ? BorderSide(
                                color: Theme.of(context).colorScheme.primary,
                                width: 1,
                              )
                            : const BorderSide(
                                color: Colors.transparent,
                                width: 1,
                              ),
                      ),
                    ),
                    child: SizedBox(
                      width: 82,
                      height: 58,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Assets.icons.iconHome.svg(
                              height: 20.0,
                              width: 20.0,
                              colorFilter:
                                  widget.navigationShell.currentIndex == 0
                                      ? ColorFilter.mode(
                                          Theme.of(context).colorScheme.primary,
                                          BlendMode.srcIn)
                                      : ColorFilter.mode(
                                          Theme.of(context)
                                              .colorScheme
                                              .onSurface
                                              .withOpacity(0.6),
                                          BlendMode.srcIn),
                            ),
                            const SizedBox(height: 8.0),
                            Text(
                              LocaleKeys.appbar_home.tr(),
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                      color:
                                          widget.navigationShell.currentIndex ==
                                                  0
                                              ? Theme.of(context)
                                                  .colorScheme
                                                  .primary
                                              : Theme.of(context)
                                                  .colorScheme
                                                  .onSurface
                                                  .withOpacity(0.6),
                                      fontWeight: FontWeight.w400),
                            ),
                          ]),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    _goBranch(1);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border(
                        top: widget.navigationShell.currentIndex == 1
                            ? BorderSide(
                                color: Theme.of(context).colorScheme.primary,
                                width: 1,
                              )
                            : const BorderSide(
                                color: Colors.transparent,
                                width: 1,
                              ),
                      ),
                    ),
                    child: SizedBox(
                      width: 82,
                      height: 58,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Assets.icons.iconHistory.svg(
                              height: 20.0,
                              width: 20.0,
                              colorFilter:
                                  widget.navigationShell.currentIndex == 1
                                      ? ColorFilter.mode(
                                          Theme.of(context).colorScheme.primary,
                                          BlendMode.srcIn)
                                      : ColorFilter.mode(
                                          Theme.of(context)
                                              .colorScheme
                                              .onSurface
                                              .withOpacity(0.6),
                                          BlendMode.srcIn),
                            ),
                            const SizedBox(height: 8.0),
                            Text(
                              LocaleKeys.appbar_history.tr(),
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                      color:
                                          widget.navigationShell.currentIndex ==
                                                  1
                                              ? Theme.of(context)
                                                  .colorScheme
                                                  .primary
                                              : Theme.of(context)
                                                  .colorScheme
                                                  .onSurface
                                                  .withOpacity(0.4),
                                      fontWeight: FontWeight.w400),
                            ),
                          ]),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    _goBranch(2);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border(
                        top: widget.navigationShell.currentIndex == 2
                            ? BorderSide(
                                color: Theme.of(context).colorScheme.primary,
                                width: 1,
                              )
                            : const BorderSide(
                                color: Colors.transparent,
                                width: 1,
                              ),
                      ),
                    ),
                    child: SizedBox(
                      width: 82,
                      height: 58,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Assets.icons.iconActivity.svg(
                              height: 20.0,
                              width: 20.0,
                              colorFilter:
                                  widget.navigationShell.currentIndex == 2
                                      ? ColorFilter.mode(
                                          Theme.of(context).colorScheme.primary,
                                          BlendMode.srcIn)
                                      : ColorFilter.mode(
                                          Theme.of(context)
                                              .colorScheme
                                              .onSurface
                                              .withOpacity(0.4),
                                          BlendMode.srcIn),
                            ),
                            const SizedBox(height: 8.0),
                            Text(
                              LocaleKeys.appbar_activity.tr(),
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                      color:
                                          widget.navigationShell.currentIndex ==
                                                  2
                                              ? Theme.of(context)
                                                  .colorScheme
                                                  .primary
                                              : Theme.of(context)
                                                  .colorScheme
                                                  .onSurface
                                                  .withOpacity(0.4),
                                      fontWeight: FontWeight.w400),
                            ),
                          ]),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    _goBranch(3);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border(
                        top: widget.navigationShell.currentIndex == 3
                            ? BorderSide(
                                color: Theme.of(context).colorScheme.primary,
                                width: 1,
                              )
                            : const BorderSide(
                                color: Colors.transparent,
                                width: 1,
                              ),
                      ),
                    ),
                    child: SizedBox(
                      width: 82,
                      height: 58,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Assets.icons.iconPerson2.svg(
                              height: 20.0,
                              width: 20.0,
                              colorFilter:
                                  widget.navigationShell.currentIndex == 3
                                      ? ColorFilter.mode(
                                          Theme.of(context).colorScheme.primary,
                                          BlendMode.srcIn)
                                      : ColorFilter.mode(
                                          Theme.of(context)
                                              .colorScheme
                                              .onSurface
                                              .withOpacity(0.4),
                                          BlendMode.srcIn),
                            ),
                            const SizedBox(height: 8.0),
                            Text(
                              LocaleKeys.appbar_account.tr(),
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                      color:
                                          widget.navigationShell.currentIndex ==
                                                  3
                                              ? Theme.of(context)
                                                  .colorScheme
                                                  .primary
                                              : Theme.of(context)
                                                  .colorScheme
                                                  .onSurface
                                                  .withOpacity(0.4),
                                      fontWeight: FontWeight.w400),
                            ),
                          ]),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
