import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:medlegten/pages/StartPages/age.dart';
import 'package:medlegten/providers/auth_provider.dart';

import 'StartPages/login.dart';
import 'StartPages/start.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  // ignore: dead_code
  Widget build(BuildContext context, WidgetRef ref) {
    final _authState = ref.watch(authProvider);

    return Material(child: getChild(_authState));
  }
  //      AnimatedSwitcher(
  //       duration: const Duration(milliseconds: 200),
  //       transitionBuilder: (child, animation) => SlideTransition(
  //         position: Tween<Offset>(
  //           begin: const Offset(1, 0),
  //           end: const Offset(0, 0),
  //         ).animate(animation),
  //         child: FadeTransition(
  //           opacity: Tween(begin: 0.0, end: 1.0).animate(animation),
  //           child: ,
  //         ),
  //       ),
  //     ),
  //   );
  // }

  Widget getChild(AuthState _authState) {
    Widget home;
    switch (_authState) {
      case AuthState.Authorized:
        home = const AgePage();
        break;
      case AuthState.Authorizing:
        home = const LoginPage();
        break;
      case AuthState.Unauthorized:
        home = const StartPage();
        break;
      default:
        home = const Scaffold(body: Text('FFFFF'));
    }
    return home;
  }
}

// class HomePageInner extends ConsumerWidget {
//   const HomePageInner({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final _authState = ref.watch(authProvider);
//     Widget home;
//     switch (_authState) {
//       case AuthState.Authorized:
//         home = const AgePage();
//         break;
//       case AuthState.Authorizing:
//         home = const LoginPage();
//         break;
//       case AuthState.Unauthorized:
//         home = const StartPage();
//         break;
//       default:
//         home = const NotFoundWidget();
//     }
//     return home;
//   }
// }
