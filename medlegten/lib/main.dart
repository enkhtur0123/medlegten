import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:medlegten/pages/StartPages/initialization.dart';
import 'package:medlegten/providers/app_provider.dart';
import 'package:medlegten/utils/route_generator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await GetStorage.init();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Init.instance.initialize(),
      builder: (context, AsyncSnapshot snapshot) {
        // Show splash screen while waiting for app resources to load:
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const MaterialApp(home: InitializationPage());
        } else {
          return MaterialApp(
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
            onGenerateRoute: RouteGenerator.generateRoute,
            navigatorKey: appProvider.key,
            //initialRoute: '/Home',
          );
        }
      },
    );
  }
}
