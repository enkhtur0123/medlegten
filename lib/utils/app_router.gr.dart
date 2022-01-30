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
    GrammarTableRoute.name: (routeData) {
      final args = routeData.argsAs<GrammarTableRouteArgs>();
      return MaterialPageX<dynamic>(
          routeData: routeData,
          child: GrammarTablePage(args.unitGrammar, key: args.key));
    },
    CourseUnitIntroVideoRoute.name: (routeData) {
      final args = routeData.argsAs<CourseUnitIntroVideoRouteArgs>();
      return MaterialPageX<dynamic>(
          routeData: routeData,
          child: CourseUnitIntroVideoPage(args.unitIntroVideo, args.url,
              key: args.key));
    },
    MixedVideoRoute.name: (routeData) {
      final args = routeData.argsAs<MixedVideoRouteArgs>();
      return MaterialPageX<dynamic>(
          routeData: routeData,
          child: MixedVideoPage(args.unitIntroVideo, args.url, key: args.key));
    },
    ReadingRoute.name: (routeData) {
      final args = routeData.argsAs<ReadingRouteArgs>();
      return MaterialPageX<dynamic>(
          routeData: routeData,
          child: ReadingPage(args.reading, key: args.key));
    },
    ModuleListenRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const ModuleListenPage());
    },
    ModuleWritingRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const ModuleWritingPage());
    },
    ConversationVideoRoute.name: (routeData) {
      final args = routeData.argsAs<ConversationVideoRouteArgs>();
      return MaterialPageX<dynamic>(
          routeData: routeData,
          child: ConversationVideoPage(args.unitIntroVideo, args.url,
              key: args.key));
    },
    ModuleProgressExamRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const ModuleProgressExamPage());
    },
    CoursePaymentRoute.name: (routeData) {
      final args = routeData.argsAs<CoursePaymentRouteArgs>(
          orElse: () => const CoursePaymentRouteArgs());
      return MaterialPageX<dynamic>(
          routeData: routeData,
          child: CoursePaymentPage(key: args.key, courseInfo: args.courseInfo));
    },
    QpayRoute.name: (routeData) {
      final args =
          routeData.argsAs<QpayRouteArgs>(orElse: () => const QpayRouteArgs());
      return MaterialPageX<dynamic>(
          routeData: routeData,
          child: QpayPage(key: args.key, courseInfo: args.courseInfo));
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
        RouteConfig(GrammarTableRoute.name, path: '/grammar_page'),
        RouteConfig(CourseUnitIntroVideoRoute.name, path: '/intro_video_page'),
        RouteConfig(MixedVideoRoute.name, path: '/mixed_video_page'),
        RouteConfig(ReadingRoute.name, path: '/reading_page'),
        RouteConfig(ModuleListenRoute.name, path: '/unit_module_listening'),
        RouteConfig(ModuleWritingRoute.name, path: '/unit_module_writing'),
        RouteConfig(ConversationVideoRoute.name,
            path: '/conversation_video_page'),
        RouteConfig(ModuleProgressExamRoute.name,
            path: '/unit_module_progressexam'),
        RouteConfig(CoursePaymentRoute.name, path: '/payment'),
        RouteConfig(QpayRoute.name, path: '/qpay')
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
/// [GrammarTablePage]
class GrammarTableRoute extends PageRouteInfo<GrammarTableRouteArgs> {
  GrammarTableRoute({required UnitGrammar unitGrammar, Key? key})
      : super(GrammarTableRoute.name,
            path: '/grammar_page',
            args: GrammarTableRouteArgs(unitGrammar: unitGrammar, key: key));

  static const String name = 'GrammarTableRoute';
}

class GrammarTableRouteArgs {
  const GrammarTableRouteArgs({required this.unitGrammar, this.key});

  final UnitGrammar unitGrammar;

  final Key? key;

  @override
  String toString() {
    return 'GrammarTableRouteArgs{unitGrammar: $unitGrammar, key: $key}';
  }
}

/// generated route for
/// [CourseUnitIntroVideoPage]
class CourseUnitIntroVideoRoute
    extends PageRouteInfo<CourseUnitIntroVideoRouteArgs> {
  CourseUnitIntroVideoRoute(
      {required UnitIntroVideo unitIntroVideo, required String url, Key? key})
      : super(CourseUnitIntroVideoRoute.name,
            path: '/intro_video_page',
            args: CourseUnitIntroVideoRouteArgs(
                unitIntroVideo: unitIntroVideo, url: url, key: key));

  static const String name = 'CourseUnitIntroVideoRoute';
}

class CourseUnitIntroVideoRouteArgs {
  const CourseUnitIntroVideoRouteArgs(
      {required this.unitIntroVideo, required this.url, this.key});

  final UnitIntroVideo unitIntroVideo;

  final String url;

  final Key? key;

  @override
  String toString() {
    return 'CourseUnitIntroVideoRouteArgs{unitIntroVideo: $unitIntroVideo, url: $url, key: $key}';
  }
}

/// generated route for
/// [MixedVideoPage]
class MixedVideoRoute extends PageRouteInfo<MixedVideoRouteArgs> {
  MixedVideoRoute(
      {required UnitIntroVideo unitIntroVideo, required String url, Key? key})
      : super(MixedVideoRoute.name,
            path: '/mixed_video_page',
            args: MixedVideoRouteArgs(
                unitIntroVideo: unitIntroVideo, url: url, key: key));

  static const String name = 'MixedVideoRoute';
}

class MixedVideoRouteArgs {
  const MixedVideoRouteArgs(
      {required this.unitIntroVideo, required this.url, this.key});

  final UnitIntroVideo unitIntroVideo;

  final String url;

  final Key? key;

  @override
  String toString() {
    return 'MixedVideoRouteArgs{unitIntroVideo: $unitIntroVideo, url: $url, key: $key}';
  }
}

/// generated route for
/// [ReadingPage]
class ReadingRoute extends PageRouteInfo<ReadingRouteArgs> {
  ReadingRoute({required Reading reading, Key? key})
      : super(ReadingRoute.name,
            path: '/reading_page',
            args: ReadingRouteArgs(reading: reading, key: key));

  static const String name = 'ReadingRoute';
}

class ReadingRouteArgs {
  const ReadingRouteArgs({required this.reading, this.key});

  final Reading reading;

  final Key? key;

  @override
  String toString() {
    return 'ReadingRouteArgs{reading: $reading, key: $key}';
  }
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
/// [ConversationVideoPage]
class ConversationVideoRoute extends PageRouteInfo<ConversationVideoRouteArgs> {
  ConversationVideoRoute(
      {required UnitIntroVideo unitIntroVideo, required String url, Key? key})
      : super(ConversationVideoRoute.name,
            path: '/conversation_video_page',
            args: ConversationVideoRouteArgs(
                unitIntroVideo: unitIntroVideo, url: url, key: key));

  static const String name = 'ConversationVideoRoute';
}

class ConversationVideoRouteArgs {
  const ConversationVideoRouteArgs(
      {required this.unitIntroVideo, required this.url, this.key});

  final UnitIntroVideo unitIntroVideo;

  final String url;

  final Key? key;

  @override
  String toString() {
    return 'ConversationVideoRouteArgs{unitIntroVideo: $unitIntroVideo, url: $url, key: $key}';
  }
}

/// generated route for
/// [ModuleProgressExamPage]
class ModuleProgressExamRoute extends PageRouteInfo<void> {
  const ModuleProgressExamRoute()
      : super(ModuleProgressExamRoute.name, path: '/unit_module_progressexam');

  static const String name = 'ModuleProgressExamRoute';
}

/// generated route for
/// [CoursePaymentPage]
class CoursePaymentRoute extends PageRouteInfo<CoursePaymentRouteArgs> {
  CoursePaymentRoute({Key? key, CourseInfo? courseInfo})
      : super(CoursePaymentRoute.name,
            path: '/payment',
            args: CoursePaymentRouteArgs(key: key, courseInfo: courseInfo));

  static const String name = 'CoursePaymentRoute';
}

class CoursePaymentRouteArgs {
  const CoursePaymentRouteArgs({this.key, this.courseInfo});

  final Key? key;

  final CourseInfo? courseInfo;

  @override
  String toString() {
    return 'CoursePaymentRouteArgs{key: $key, courseInfo: $courseInfo}';
  }
}

/// generated route for
/// [QpayPage]
class QpayRoute extends PageRouteInfo<QpayRouteArgs> {
  QpayRoute({Key? key, CourseInfo? courseInfo})
      : super(QpayRoute.name,
            path: '/qpay',
            args: QpayRouteArgs(key: key, courseInfo: courseInfo));

  static const String name = 'QpayRoute';
}

class QpayRouteArgs {
  const QpayRouteArgs({this.key, this.courseInfo});

  final Key? key;

  final CourseInfo? courseInfo;

  @override
  String toString() {
    return 'QpayRouteArgs{key: $key, courseInfo: $courseInfo}';
  }
}
