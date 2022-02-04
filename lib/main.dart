import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:medlegten/navigator/navigator_key.dart';
import 'package:medlegten/pages/StartPages/initialization.dart';
import 'package:medlegten/utils/app_router.dart';

import 'themes/style.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await GetStorage.init();
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  MyApp({Key? key}) : super(key: key);

  final _appRouter = AppRouter();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
    //    overlays: [SystemUiOverlay.bottom]);
    return FutureBuilder(
      future: Init.instance.initialize(ref),
      builder: (context, AsyncSnapshot snapshot) {
        // Show splash screen while waiting for app resources to load:
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const MaterialApp(
              debugShowCheckedModeBanner: false, home: InitializationPage());
        } else {
          return MaterialApp.router(
            color: Colors.white,
            key: GlobalKeys.navigatorKey,
            routerDelegate: _appRouter.delegate(),
            routeInformationParser: _appRouter.defaultRouteParser(),
            routeInformationProvider: PlatformRouteInformationProvider(
              initialRouteInformation: const RouteInformation(
                location: '/',
              ),
            ),
            debugShowCheckedModeBanner: false,
            title: 'Мэдлэгтэн',
            theme: appTheme,
          );
        }
      },
    );
  }
}
