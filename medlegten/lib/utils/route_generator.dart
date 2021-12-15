import 'package:flutter/material.dart';
import 'package:medlegten/components/not_found_widget.dart';
import 'package:medlegten/pages/StartPages/login.dart';
import 'package:medlegten/pages/StartPages/onboarding1.dart';
import 'package:medlegten/pages/home.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    final args = settings.arguments;

    switch (settings.name) {
      case '/Home':
      case '/':
        return MaterialPageRoute(builder: (_) => const HomePage());
      case '/Onboarding':
        return MaterialPageRoute(builder: (_) => const OnboardingPage());
      case '/Login':
        return MaterialPageRoute(builder: (_) => const LoginPage());
      default:
        return MaterialPageRoute(
            builder: (_) =>
                const Scaffold(body: SafeArea(child: NotFoundWidget())));
    }
  }
}
