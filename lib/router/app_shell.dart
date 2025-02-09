import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:marquis_v2/providers/app_state.dart';
import 'package:marquis_v2/router/router_delegate.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:marquis_v2/services/snackbar_service.dart';
import 'package:upgrader/upgrader.dart';

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
    _backButtonDispatcher = Router.of(context)
        .backButtonDispatcher!
        .createChildBackButtonDispatcher();
  }

  @override
  Widget build(BuildContext context) {
    // Claim priority, If there are parallel sub router, you will need
    // to pick which one should take priority;
    _backButtonDispatcher.takePriority();
    final appState = ref.watch(appStateProvider);
    final snackbarService = SnackbarService();
    return Scaffold(
      body: UpgradeAlert(
        dialogStyle: kIsWeb || Platform.isAndroid
            ? UpgradeDialogStyle.material
            : UpgradeDialogStyle.cupertino,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Router(
              routerDelegate: _routerDelegate,
              backButtonDispatcher: _backButtonDispatcher,
            ),
            if (snackbarService.snackbars.isNotEmpty)
              Positioned(
                bottom: 0,
                child: Directionality(
                  textDirection: TextDirection.ltr,
                  child: ListenableBuilder(
                    listenable: snackbarService,
                    builder: (context, child) {
                      return ListView.builder(
                        itemBuilder: (context, index) =>
                            snackbarService.snackbars[index],
                        itemCount: snackbarService.snackbars.length,
                        shrinkWrap: true,
                        reverse: true,
                      );
                    },
                  ),
                ),
              ),
          ],
        ),
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
                ref
                    .read(appStateProvider.notifier)
                    .changeNavigatorIndex(newIndex);
              },
            ),
    );
  }
}
