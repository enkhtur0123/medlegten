import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:medlegten/pages/StartPages/initialization.dart';
import 'package:medlegten/utils/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await Firebase.initializeApp();
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  MyApp({Key? key}) : super(key: key);

  final _appRouter = AppRouter();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FutureBuilder(
      future: Init.instance.initialize(ref),
      builder: (context, AsyncSnapshot snapshot) {
        // Show splash screen while waiting for app resources to load:
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const MaterialApp(home: InitializationPage());
        } else {
          return MaterialApp.router(
            routerDelegate: _appRouter.delegate(),
            routeInformationParser: _appRouter.defaultRouteParser(),
            routeInformationProvider: PlatformRouteInformationProvider(
              initialRouteInformation: const RouteInformation(
                location: '/',
              ),
            ),
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(
              appBarTheme: AppBarTheme(
                  backgroundColor: ThemeData.dark().scaffoldBackgroundColor,
                  foregroundColor: Colors.white),
              colorScheme: const ColorScheme.dark(
                secondary: Color(0xFF9054E7),
                secondaryVariant: Color(0xFFF88E77),
              ),
              hintColor: Colors.white,
              dividerColor: Colors.white54,
            ),
          );
        }
      },
    );
  }
}
