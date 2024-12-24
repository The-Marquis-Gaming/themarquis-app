import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:marquis_v2/games/checkers/checkers_main.dart';
import 'package:marquis_v2/games/ludo/ludo_main.dart';
import 'package:marquis_v2/models/app_state.dart';
import 'package:marquis_v2/providers/app_state.dart';
import 'package:marquis_v2/router/app_shell.dart';
import 'package:marquis_v2/router/fade_animation.dart';
import 'package:marquis_v2/router/route_path.dart';
import 'package:marquis_v2/screens/game_screen.dart';
import 'package:marquis_v2/screens/home_screen.dart';
import 'package:marquis_v2/screens/page_not_found_screen.dart';
import 'package:marquis_v2/screens/profile_screen.dart';
import 'package:marquis_v2/screens/splash_screen.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

final routerDelegateProvider = Provider<AppRouterDelegate>((ref) => AppRouterDelegate(ref));

final innerRouterDelegateProvider = Provider<InnerRouterDelegate>((ref) => InnerRouterDelegate(ref));

class AppRouterDelegate extends RouterDelegate<AppRoutePath> with ChangeNotifier, PopNavigatorRouterDelegateMixin<AppRoutePath> {
  @override
  final GlobalKey<NavigatorState> navigatorKey;
  bool? _showPageNotFound;
  bool _isSignUp = false;
  final ProviderRef ref;
  late AppStateData _appState;

  AppRouterDelegate(this.ref) : navigatorKey = GlobalKey<NavigatorState>() {
    _appState = ref.read(appStateProvider);

    // Listen to state changes and force rebuild
    ref.listen<AppStateData>(appStateProvider, (previous, next) {
      _appState = next;
      notifyListeners(); // Ensure navigation state is updated
    });
  }

  // Add method to force rebuild
  void forceRebuild() {
    notifyListeners();
  }

  @override
  AppRoutePath? get currentConfiguration {
    if (_showPageNotFound == true) {
      return PageNotFoundPath();
    }
    if (_appState.selectedGame != null) {
      if (_appState.selectedGame == 'ludo') {
        return LudoGameAppPath(_appState.selectedGameSessionId);
      }
      if (_appState.selectedGame == 'checkers') {
        return CheckersGameAppPath(_appState.selectedGameSessionId);
      }
      return GamePath(_appState.selectedGame!);
    }
    switch (_appState.navigatorIndex) {
      case 0:
        return HomePath();
      case 1:
        return ProfilePath();
      // case 1:
      //   return AchievementsPath();
      // case 2:
      //   return ProfilePath();
      default:
        break;
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    List<Page> stack;
    if (_showPageNotFound == true) {
      stack = [
        const FadeAnimationPage(
          key: ValueKey('PageNotFoundPage'),
          child: PageNotFoundScreen(),
        )
      ];
    } else if (_appState.autoLoginResult == null) {
      stack = [
        const FadeAnimationPage(
          key: ValueKey('SplashPage'),
          child: SplashScreen(
              // goToCreateBusiness: () {
              //   _isSignUp = true;
              //   notifyListeners();
              // },
              ),
        ),
        // if (_isSignUp)
        //   const FadeAnimationPage(
        //     child: CreateBusinessScreen(),
        //     key: ValueKey('CreateBusinessPage'),
        //   ),
      ];
    } else {
      stack = [
        const FadeAnimationPage(
          child: AppShell(),
          key: ValueKey('AppShell'),
        ),
      ];
    }

    return Navigator(
      key: navigatorKey,
      pages: stack,
      onDidRemovePage: (page) {
        if (_isSignUp) {
          _isSignUp = false;
        }
      },
    );
  }

  @override
  Future<void> setNewRoutePath(AppRoutePath configuration) async {
    if (configuration is PageNotFoundPath) {
      _showPageNotFound = true;
      return;
    } else {
      _showPageNotFound = false;
    }

    if (configuration is HomePath) {
      ref.read(appStateProvider.notifier).changeNavigatorIndex(0);
    }

    if (configuration is ProfilePath) {
      ref.read(appStateProvider.notifier).changeNavigatorIndex(1);
    }

    if (configuration is LudoGameAppPath) {
      ref.read(appStateProvider.notifier).selectGameSessionId("ludo", configuration.id);
    }

    if (configuration is CheckersGameAppPath) {
      ref.read(appStateProvider.notifier).selectGameSessionId("checkers", configuration.id);
    }

    // if (configuration is AchievementsPath) {
    //   ref.read(appStateProvider.notifier).changeNavigatorIndex(1);
    // }

    // if (configuration is ProfilePath) {
    //   ref.read(appStateProvider.notifier).changeNavigatorIndex(2);
    // }

    if (configuration is GamePath) {
      ref.read(appStateProvider.notifier).selectGame(configuration.id);
    }
  }
}

class InnerRouterDelegate extends RouterDelegate<AppRoutePath> with ChangeNotifier, PopNavigatorRouterDelegateMixin<AppRoutePath> {
  @override
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  final ProviderRef ref;
  late AppStateData _appState;

  InnerRouterDelegate(this.ref) {
    _appState = ref.read(appStateProvider);
    ref.listen(appStateProvider, (previous, next) {
      _appState = next;
      notifyListeners();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      pages: [
        ...switch (_appState.navigatorIndex) {
          0 => [
              const FadeAnimationPage(
                key: ValueKey('HomePage'),
                child: HomeScreen(),
              ),
            ],
          1 => [
              const FadeAnimationPage(
                key: ValueKey('ProfilePage'),
                child: ProfileScreen(),
              ),
            ],
          // 1 => [
          //     const FadeAnimationPage(
          //       key: ValueKey('AchievementsPage'),
          //       child: AchievementsScreen(),
          //     ),
          //   ],
          // 2 => [
          //     const FadeAnimationPage(
          //       key: ValueKey('ProfilePage'),
          //       child: ProfileScreen(),
          //     ),
          //   ],
          _ => [],
        },
        if (_appState.selectedGame != null)
          switch (_appState.selectedGame) {
            "ludo" => FadeAnimationPage(
                key: ValueKey('LudoGame${_appState.selectedGame}Page'),
                child: const LudoGameApp(),
              ),
            "checkers" => FadeAnimationPage(
                key: ValueKey('CheckersGame${_appState.selectedGame}Page'),
                child: const CheckersGameApp(),
              ),
            _ => FadeAnimationPage(
                key: ValueKey('Game${_appState.selectedGame}Page'),
                child: GameScreen(
                  id: _appState.selectedGame!,
                ),
              ),
          }
      ],
      onDidRemovePage: (page) {
        if (_appState.selectedGame != null) {
          ref.read(appStateProvider.notifier).selectGame(null);
        }
      },
    );
  }

  @override
  Future<void> setNewRoutePath(AppRoutePath configuration) async {
    // This is not required for inner router delegate because it does not
    // parse route
    assert(false);
  }
}
