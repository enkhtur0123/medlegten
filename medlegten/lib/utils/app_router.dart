import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:medlegten/models/Starting/onboarding.dart';
import 'package:medlegten/pages/CoursePages/course_self_test.dart';
import 'package:medlegten/pages/LandingPages/landing_page.dart';
import 'package:medlegten/pages/StartPages/age.dart';
import 'package:medlegten/pages/StartPages/login.dart';
import 'package:medlegten/pages/StartPages/onboarding_page.dart';
import 'package:medlegten/pages/StartPages/start.dart';
import 'package:medlegten/pages/home.dart';

part 'app_router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(path: '/home', page: HomePage, initial: true),
    AutoRoute(path: '/onboarding', page: OnboardingPage),
    AutoRoute(path: '/login', page: LoginPage),
    AutoRoute(path: '/age', page: AgePage),
    AutoRoute(path: '/start', page: StartPage),
    AutoRoute(path: '/landing', page: LandingPage),
    AutoRoute(path: '/course_self_test', page: CourseSelfTestPage),
  ],
)

// extend the generated private router
class AppRouter extends _$AppRouter {}
