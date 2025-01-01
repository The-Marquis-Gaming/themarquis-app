import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:marquis_v2/providers/app_state.dart';
import 'package:marquis_v2/router/router_delegate.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AppShell extends ConsumerStatefulWidget {
  const AppShell({
    super.key,
  });

  @override
  ConsumerState<AppShell> createState() => _AppShellState();
}

class _AppShellState extends ConsumerState<AppShell> {
  late InnerRouterDelegate _routerDelegate;
  late ChildBackButtonDispatcher _backButtonDispatcher;

  @override
  void initState() {
    super.initState();
    _routerDelegate = ref.read(innerRouterDelegateProvider);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Defer back button dispatching to the child router
    _backButtonDispatcher = Router.of(context).backButtonDispatcher!.createChildBackButtonDispatcher();
  }

  @override
  Widget build(BuildContext context) {
    // Claim priority, If there are parallel sub router, you will need
    // to pick which one should take priority;
    _backButtonDispatcher.takePriority();
    final appState = ref.watch(appStateProvider);
    return Scaffold(
      body: Router(
        routerDelegate: _routerDelegate,
        backButtonDispatcher: _backButtonDispatcher,
      ),
      bottomNavigationBar: appState.selectedGame != null
          ? null
          : BottomNavigationBar(
              elevation: 0.0,
              selectedItemColor: Theme.of(context).colorScheme.primary,
              unselectedItemColor: Theme.of(context).colorScheme.secondary,
              items: const [
                BottomNavigationBarItem(
                  // key: ValueKey("HomeBottomNavigationBarItem"),
                  icon: FaIcon(FontAwesomeIcons.compass),
                  label: 'Discover',
                ),
                // BottomNavigationBarItem(
                //   // key: ValueKey("FeedsBottomNavigationBarItem"),
                //   icon: FaIcon(FontAwesomeIcons.rss),
                //   label: 'Achievements',
                // ),
                BottomNavigationBarItem(
                  // key: ValueKey("AccountBottomNavigationBarItem"),
                  icon: FaIcon(FontAwesomeIcons.solidUser),
                  label: 'Profile',
                ),
              ],
              currentIndex: appState.navigatorIndex,
              onTap: (newIndex) {
                ref.read(appStateProvider.notifier).changeNavigatorIndex(newIndex);
              },
            ),
    );
  }
}
