// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'app_router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const HomePage());
    },
    OnboardingRoute.name: (routeData) {
      final args = routeData.argsAs<OnboardingRouteArgs>();
      return MaterialPageX<dynamic>(
          routeData: routeData,
          child: OnboardingPage(
              onboardingList: args.onboardingList, key: args.key));
    },
    LoginRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const LoginPage());
    },
    AgeRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const AgePage());
    },
    StartRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const StartPage());
    },
    LandingRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const LandingPage());
    },
    CourseSelfTestRoute.name: (routeData) {
      final args = routeData.argsAs<CourseSelfTestRouteArgs>(
          orElse: () => const CourseSelfTestRouteArgs());
      return MaterialPageX<dynamic>(
          routeData: routeData, child: CourseSelfTestPage(key: args.key));
    },
    CourseDetailRoute.name: (routeData) {
      final args = routeData.argsAs<CourseDetailRouteArgs>();
      return MaterialPageX<dynamic>(
          routeData: routeData,
          child: CourseDetailPage(args.courseInfo, key: args.key));
    },
    CourseUnitModuleListRoute.name: (routeData) {
      final args = routeData.argsAs<CourseUnitModuleListRouteArgs>();
      return MaterialPageX<dynamic>(
          routeData: routeData,
          child: CourseUnitModuleListPage(args.unitInfo, key: args.key));
    },
    ModuleGrammarTableRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const ModuleGrammarTablePage());
    },
    CourseUnitIntroVideoRoute.name: (routeData) {
      final args = routeData.argsAs<CourseUnitIntroVideoRouteArgs>();
      return MaterialPageX<dynamic>(
          routeData: routeData,
          child: CourseUnitIntroVideoPage(args.unitIntroVideo, key: args.key));
    },
    ModuleMixedVideoRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const ModuleMixedVideoPage());
    },
    ModuleReadingRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const ModuleReadingPage());
    },
    ModuleListenRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const ModuleListenPage());
    },
    ModuleWritingRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const ModuleWritingPage());
    },
    ModuleConversationVideoRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const ModuleConversationVideoPage());
    },
    ModuleProgressExamRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const ModuleProgressExamPage());
    },
    CoursePaymentRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: CoursePayment());
    }
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig('/#redirect',
            path: '/', redirectTo: '/home', fullMatch: true),
        RouteConfig(HomeRoute.name, path: '/home'),
        RouteConfig(OnboardingRoute.name, path: '/onboarding'),
        RouteConfig(LoginRoute.name, path: '/login'),
        RouteConfig(AgeRoute.name, path: '/age'),
        RouteConfig(StartRoute.name, path: '/start'),
        RouteConfig(LandingRoute.name, path: '/landing'),
        RouteConfig(CourseSelfTestRoute.name, path: '/course_self_test'),
        RouteConfig(CourseDetailRoute.name, path: '/course_detail'),
        RouteConfig(CourseUnitModuleListRoute.name,
            path: '/course_unit_module_list'),
        RouteConfig(ModuleGrammarTableRoute.name,
            path: '/unit_module_grammartable'),
        RouteConfig(CourseUnitIntroVideoRoute.name, path: '/video_page'),
        RouteConfig(ModuleMixedVideoRoute.name,
            path: '/unit_module_mixedvideo'),
        RouteConfig(ModuleReadingRoute.name, path: '/unit_module_reading'),
        RouteConfig(ModuleListenRoute.name, path: '/unit_module_listening'),
        RouteConfig(ModuleWritingRoute.name, path: '/unit_module_writing'),
        RouteConfig(ModuleConversationVideoRoute.name,
            path: '/unit_module_conversationvideo'),
        RouteConfig(ModuleProgressExamRoute.name,
            path: '/unit_module_progressexam'),
        RouteConfig(CoursePaymentRoute.name, path: '/payment')
      ];
}

/// generated route for
/// [HomePage]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute() : super(HomeRoute.name, path: '/home');

  static const String name = 'HomeRoute';
}

/// generated route for
/// [OnboardingPage]
class OnboardingRoute extends PageRouteInfo<OnboardingRouteArgs> {
  OnboardingRoute({required List<Onboarding> onboardingList, Key? key})
      : super(OnboardingRoute.name,
            path: '/onboarding',
            args:
                OnboardingRouteArgs(onboardingList: onboardingList, key: key));

  static const String name = 'OnboardingRoute';
}

class OnboardingRouteArgs {
  const OnboardingRouteArgs({required this.onboardingList, this.key});

  final List<Onboarding> onboardingList;

  final Key? key;

  @override
  String toString() {
    return 'OnboardingRouteArgs{onboardingList: $onboardingList, key: $key}';
  }
}

/// generated route for
/// [LoginPage]
class LoginRoute extends PageRouteInfo<void> {
  const LoginRoute() : super(LoginRoute.name, path: '/login');

  static const String name = 'LoginRoute';
}

/// generated route for
/// [AgePage]
class AgeRoute extends PageRouteInfo<void> {
  const AgeRoute() : super(AgeRoute.name, path: '/age');

  static const String name = 'AgeRoute';
}

/// generated route for
/// [StartPage]
class StartRoute extends PageRouteInfo<void> {
  const StartRoute() : super(StartRoute.name, path: '/start');

  static const String name = 'StartRoute';
}

/// generated route for
/// [LandingPage]
class LandingRoute extends PageRouteInfo<void> {
  const LandingRoute() : super(LandingRoute.name, path: '/landing');

  static const String name = 'LandingRoute';
}

/// generated route for
/// [CourseSelfTestPage]
class CourseSelfTestRoute extends PageRouteInfo<CourseSelfTestRouteArgs> {
  CourseSelfTestRoute({Key? key})
      : super(CourseSelfTestRoute.name,
            path: '/course_self_test', args: CourseSelfTestRouteArgs(key: key));

  static const String name = 'CourseSelfTestRoute';
}

class CourseSelfTestRouteArgs {
  const CourseSelfTestRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'CourseSelfTestRouteArgs{key: $key}';
  }
}

/// generated route for
/// [CourseDetailPage]
class CourseDetailRoute extends PageRouteInfo<CourseDetailRouteArgs> {
  CourseDetailRoute({required CourseInfo courseInfo, Key? key})
      : super(CourseDetailRoute.name,
            path: '/course_detail',
            args: CourseDetailRouteArgs(courseInfo: courseInfo, key: key));

  static const String name = 'CourseDetailRoute';
}

class CourseDetailRouteArgs {
  const CourseDetailRouteArgs({required this.courseInfo, this.key});

  final CourseInfo courseInfo;

  final Key? key;

  @override
  String toString() {
    return 'CourseDetailRouteArgs{courseInfo: $courseInfo, key: $key}';
  }
}

/// generated route for
/// [CourseUnitModuleListPage]
class CourseUnitModuleListRoute
    extends PageRouteInfo<CourseUnitModuleListRouteArgs> {
  CourseUnitModuleListRoute({required CourseUnit unitInfo, Key? key})
      : super(CourseUnitModuleListRoute.name,
            path: '/course_unit_module_list',
            args: CourseUnitModuleListRouteArgs(unitInfo: unitInfo, key: key));

  static const String name = 'CourseUnitModuleListRoute';
}

class CourseUnitModuleListRouteArgs {
  const CourseUnitModuleListRouteArgs({required this.unitInfo, this.key});

  final CourseUnit unitInfo;

  final Key? key;

  @override
  String toString() {
    return 'CourseUnitModuleListRouteArgs{unitInfo: $unitInfo, key: $key}';
  }
}

/// generated route for
/// [ModuleGrammarTablePage]
class ModuleGrammarTableRoute extends PageRouteInfo<void> {
  const ModuleGrammarTableRoute()
      : super(ModuleGrammarTableRoute.name, path: '/unit_module_grammartable');

  static const String name = 'ModuleGrammarTableRoute';
}

/// generated route for
/// [CourseUnitIntroVideoPage]
class CourseUnitIntroVideoRoute
    extends PageRouteInfo<CourseUnitIntroVideoRouteArgs> {
  CourseUnitIntroVideoRoute({required UnitIntroVideo unitIntroVideo, Key? key})
      : super(CourseUnitIntroVideoRoute.name,
            path: '/video_page',
            args: CourseUnitIntroVideoRouteArgs(
                unitIntroVideo: unitIntroVideo, key: key));

  static const String name = 'CourseUnitIntroVideoRoute';
}

class CourseUnitIntroVideoRouteArgs {
  const CourseUnitIntroVideoRouteArgs({required this.unitIntroVideo, this.key});

  final UnitIntroVideo unitIntroVideo;

  final Key? key;

  @override
  String toString() {
    return 'CourseUnitIntroVideoRouteArgs{unitIntroVideo: $unitIntroVideo, key: $key}';
  }
}

/// generated route for
/// [ModuleMixedVideoPage]
class ModuleMixedVideoRoute extends PageRouteInfo<void> {
  const ModuleMixedVideoRoute()
      : super(ModuleMixedVideoRoute.name, path: '/unit_module_mixedvideo');

  static const String name = 'ModuleMixedVideoRoute';
}

/// generated route for
/// [ModuleReadingPage]
class ModuleReadingRoute extends PageRouteInfo<void> {
  const ModuleReadingRoute()
      : super(ModuleReadingRoute.name, path: '/unit_module_reading');

  static const String name = 'ModuleReadingRoute';
}

/// generated route for
/// [ModuleListenPage]
class ModuleListenRoute extends PageRouteInfo<void> {
  const ModuleListenRoute()
      : super(ModuleListenRoute.name, path: '/unit_module_listening');

  static const String name = 'ModuleListenRoute';
}

/// generated route for
/// [ModuleWritingPage]
class ModuleWritingRoute extends PageRouteInfo<void> {
  const ModuleWritingRoute()
      : super(ModuleWritingRoute.name, path: '/unit_module_writing');

  static const String name = 'ModuleWritingRoute';
}

/// generated route for
/// [ModuleConversationVideoPage]
class ModuleConversationVideoRoute extends PageRouteInfo<void> {
  const ModuleConversationVideoRoute()
      : super(ModuleConversationVideoRoute.name,
            path: '/unit_module_conversationvideo');

  static const String name = 'ModuleConversationVideoRoute';
}

/// generated route for
/// [ModuleProgressExamPage]
class ModuleProgressExamRoute extends PageRouteInfo<void> {
  const ModuleProgressExamRoute()
      : super(ModuleProgressExamRoute.name, path: '/unit_module_progressexam');

  static const String name = 'ModuleProgressExamRoute';
}

/// generated route for
/// [CoursePayment]
class CoursePaymentRoute extends PageRouteInfo<void> {
  const CoursePaymentRoute() : super(CoursePaymentRoute.name, path: '/payment');

  static const String name = 'CoursePayment';
}
