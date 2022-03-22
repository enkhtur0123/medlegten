import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:medlegten/pages/LandingPages/landing_page.dart';
import 'package:medlegten/pages/StartPages/age.dart';
import 'package:medlegten/pages/StartPages/initialization.dart';
import 'package:medlegten/providers/auth_provider.dart';
import 'StartPages/start.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  Widget getChild(BuildContext context, AuthState _authState) {
    Widget home;
    switch (_authState) {
      case AuthState.Authorized:
        home = const LandingPage();
        AutoRouter.of(context).pop();
        break;
      case AuthState.AuthorizedAge:
        home = const AgePage();
        AutoRouter.of(context).pop();
        break;
      case AuthState.Authorizing:
      case AuthState.UnAuthorized:
        //GetStorage().write(
        //    'token',
        //    'MRIhZxgkrNGKdtbFlErUTPLtdGHzKGcnphpbMDqqpXdQUIBzlcvaAXIpXQhjEIXhuvlqxRvabVkoYNtOiDZKdldMxWLQMOXjSOHRZxaMygOYkBEGTHuhuBusSwHKfTKukrFyKTahjnjNnhTReFyHPS');
        //    'gbwtXkaooXkjByptFaPyBUFcOtfTcXOebTPpISCytwEZMkmXKlyLjAguUcNzHpTQqAYJRrrzXUXNEszZedfMXvZwvcoPIVPkwdidceWiFWZosfUzFsLflsMmcNZZNGkUxGrhWWHjAFAQatvBVAutOc');
        //home = const LandingPage();
        home = const StartPage();
        break;
      case AuthState.Initial:
        home = const InitializationPage();
        break;
      default:
        home = const Scaffold(body: Text('Empty page'));
    }
    return home;
  }

  @override
  // ignore: dead_code
  Widget build(BuildContext context, WidgetRef ref) {
    final _authState = ref.watch(authProvider);

    return Material(color: Colors.white, child: getChild(context, _authState));
  }
}
