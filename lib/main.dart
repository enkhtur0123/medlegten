import 'package:auto_route/auto_route.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
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

  ///Алдаа гарах үед дуудагдана
  ErrorWidget.builder = (FlutterErrorDetails details) {
    if (kDebugMode) {
      return ErrorWidget(details.exception);
    }
    return Container(
      alignment: Alignment.center,
      child: Text(
        'Error!\n${details.exception}',
        style: const TextStyle(color: Colors.yellow),
        textAlign: TextAlign.center,
        textDirection: TextDirection.ltr,
      ),
    );
  };

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends ConsumerState<MyApp> with WidgetsBindingObserver {
  final _appRouter = AppRouter();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addObserver(this);
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.black,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Init.instance.initialize(ref),
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const MaterialApp(
              debugShowCheckedModeBanner: false, home: InitializationPage());
        } else {
          var app = MaterialApp.router(
           
            color: Colors.white,
            key: GlobalKeys.navigatorKey,
            routerDelegate: _appRouter.delegate(
                navigatorObservers: () => [AutoRouteObserver()]),
            routeInformationParser: _appRouter.defaultRouteParser(),
            
            routeInformationProvider: PlatformRouteInformationProvider(
              initialRouteInformation: const RouteInformation(
                location: '/',
              ),
            ),
            debugShowCheckedModeBanner: false,
            title: 'Lingos',
            theme: appTheme,
            builder: FlutterSmartDialog.init(),
          );
          return app;
        }
      },
    );
  }
}
