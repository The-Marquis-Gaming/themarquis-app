// import 'package:magic_sdk/magic_sdk.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:marquis_v2/games/ludo/models/ludo_session.dart';
import 'package:marquis_v2/models/app_state.dart';
import 'package:marquis_v2/models/user.dart';
import 'package:marquis_v2/providers/app_state.dart';
import 'package:marquis_v2/providers/user.dart';
import 'package:marquis_v2/router/route_information_parser.dart';
import 'package:marquis_v2/router/router_delegate.dart';

import 'services/snackbar_service.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(AppStateDataImplAdapter());
  Hive.registerAdapter(UserDataImplAdapter());
  Hive.registerAdapter(LudoSessionDataImplAdapter());
  Hive.registerAdapter(LudoSessionUserStatusImplAdapter());
  await Future.wait([_loadAppStateBox(), Hive.openBox<UserData>("user"), Hive.openBox<LudoSessionData>("ludoSession")]);
  runApp(const ProviderScope(child: MyApp()));
  // Magic.instance = Magic("pk_live_D38AAC9114F908B0");
}

Future<void> _loadAppStateBox() async {
  try {
    await Hive.openBox<AppStateData>("appState");
  } catch (e) {
    await Hive.deleteBoxFromDisk("appState");
    await Hive.openBox<AppStateData>("appState");
  }
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final snackbarService = SnackbarService();
    ref.watch(appStateProvider);
    // ref.watch(natsServiceProvider);
    ref.watch(userProvider);
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: 'Marquis V2',
          scrollBehavior: MyCustomScrollBehavior(),
          theme: ThemeData(
            useMaterial3: true,
            colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.cyan,
              surface: const Color(0xff0f1118),
              brightness: Brightness.dark,
            ),
            textTheme: GoogleFonts.orbitronTextTheme(Theme.of(context).textTheme).apply(bodyColor: Colors.white),
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          routeInformationParser: AppRouteInformationParser(),
          routerDelegate: ref.read(routerDelegateProvider),
        ),
        Directionality(
          textDirection: TextDirection.ltr,
          child: ListenableBuilder(
            listenable: snackbarService,
            builder: (context, child) {
              return ListView.builder(
                itemBuilder: (context, index) => snackbarService.snackbars[index],
                itemCount: snackbarService.snackbars.length,
                shrinkWrap: true,
                reverse: true,
              );
            },
          ),
        ),
      ],
    );
  }
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}
