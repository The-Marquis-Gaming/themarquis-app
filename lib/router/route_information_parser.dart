import 'package:marquis_v2/games/ludo/ludo_main.dart';
import 'package:marquis_v2/router/route_path.dart';
import 'package:marquis_v2/screens/game_screen.dart';
import 'package:marquis_v2/screens/home_screen.dart';
import 'package:marquis_v2/screens/page_not_found_screen.dart';

import 'package:flutter/material.dart';
import 'package:marquis_v2/screens/profile_screen.dart';

class AppRouteInformationParser extends RouteInformationParser<AppRoutePath> {
  @override
  Future<AppRoutePath> parseRouteInformation(
      RouteInformation routeInformation) async {
    final uri = routeInformation.uri;
    if (uri.pathSegments.isEmpty) {
      return HomePath();
    } else {
      final first = uri.pathSegments[0];
      switch (first) {
        // case 'signup':
        //   return SignUpPath();
        case 'profile':
          return ProfilePath();
        case 'game':
          if (uri.pathSegments.length >= 2) {
            if (uri.pathSegments[1] == 'ludo' && uri.pathSegments.length == 3) {
              return LudoGameAppPath(uri.pathSegments[2]);
            }
            return GamePath(uri.pathSegments[1]);
          }
          break;
        default:
      }
    }
    return PageNotFoundPath();
  }

  @override
  RouteInformation restoreRouteInformation(AppRoutePath configuration) {
    return RouteInformation(
        uri: Uri.parse(configuration.getRouteInformation()));
  }
}
