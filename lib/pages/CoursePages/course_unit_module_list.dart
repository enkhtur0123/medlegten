import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:medlegten/common/colors.dart';
import 'package:medlegten/common/widget_functions.dart';
import 'package:medlegten/components/icon_text.dart';
import 'package:medlegten/components/landing_header.dart';
import 'package:medlegten/components/loading.dart';
import 'package:medlegten/components/wide_button.dart';
import 'package:medlegten/models/Landing/course_unit.dart';
import 'package:medlegten/models/Landing/course_unit_module_list.dart';
import 'package:medlegten/repositories/landing_repository.dart';
import 'package:medlegten/repositories/unit_repository.dart';
import 'package:medlegten/utils/app_router.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:timeline_tile/timeline_tile.dart';
import 'package:tuple/tuple.dart';
import 'package:auto_route/auto_route.dart';

class CourseUnitModuleListPage extends HookWidget {
  const CourseUnitModuleListPage(this.unitInfo, {Key? key}) : super(key: key);

  final CourseUnit unitInfo;
  final double timeLineHeight = 70;
  final double timeLineWidth = 300;
  final double indicatorHeight = 25;
  final double indicatorWidth = 25;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorTable.color255_255_255,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          LandingHeader(100),
          addVerticalSpace(20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'UNIT ${unitInfo.unitNumber}: ${unitInfo.unitName.toUpperCase()}',
                    style: const TextStyle(
                        color: colorPrimary,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w700,
                        fontSize: 16),
                  ),
                  addVerticalSpace(8),
                 Row(
                    children: [
                      const IconText(Icons.person_outline_outlined, 'Beginner'),
                      addHorizontalSpace(20),
                      const IconText(Icons.timer, '16 min'),
                    ],
                  ),
                ],
              ),
              addHorizontalSpace(20),
              CircularPercentIndicator(
                  radius: 40.0,
                  lineWidth: 3.0,
                  percent: 0.6,
                  center: const Text(
                    "60%",
                    style: TextStyle(color: colorPrimary),
                  ),
                  progressColor: colorPrimary)
            ],
          ),
          addVerticalSpace(10),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Divider(
              color: Color.fromRGBO(199, 201, 217, .2),
              thickness: 1,
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  FutureBuilder<List<CourseUnitModuleList>?>(
                      future: LandingRepository()
                          .getCourseUnitModuleList(unitInfo.unitId),
                      builder: (BuildContext context,
                          AsyncSnapshot<List<CourseUnitModuleList>?> snapshot) {
                        if (snapshot.hasData) {
                          List<Tuple2<int, CourseUnitModuleList>> listTuple =
                              <Tuple2<int, CourseUnitModuleList>>[];
                          for (int i = 0; i < snapshot.data!.length; i++) {
                            listTuple.add(Tuple2<int, CourseUnitModuleList>(
                                i, snapshot.data![i]));
                          }
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: listTuple
                                .map(
                                  (tuple) => buildTimeline(
                                      tuple.item2,
                                      tuple.item1,
                                      tuple.item1 == 0
                                          ? 0
                                          : tuple.item1 == listTuple.length - 1
                                              ? 1
                                              : -1,
                                      context),
                                )
                                .toList()
                              ..add(addVerticalSpace(10))
                              ..add(WideButton(
                                "Let's Start",
                                colorSecondary,
                                colorWhite,
                                () {},
                              )),
                          );
                        } else if (snapshot.hasError) {
                          return const Loading();
                        } else {
                          return const Loading();
                        }
                      }),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget buildTimeline(
    CourseUnitModuleList data, int idx, int isLast, BuildContext context) {
  return Padding(
    padding: const EdgeInsets.only(left: 40),
    child: SizedBox(
      width: double.infinity,
      height: 70,
      child: TimelineTile(
        axis: TimelineAxis.vertical,
        hasIndicator: true,
        isFirst: isLast == 0,
        isLast: isLast == 1,
        indicatorStyle: IndicatorStyle(
          indicator: Container(
            decoration: const BoxDecoration(
              border: Border.fromBorderSide(
                BorderSide(
                  color: colorPrimary,
                ),
              ),
              color: colorPrimary,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                '${idx + 1}',
                style: TextStyle(
                    color: ColorTable.color255_255_255,
                    fontWeight: FontWeight.w400),
              ),
            ),
          ),
          color: colorPrimary,
          width: 25,
          height: 25,
        ),
        endChild: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: GestureDetector(
            onTap: () {
              switch (data.moduleTypeId) {
                case "1":
                  {
                    UnitRepository().getUnitIntroVideo(data.moduleId).then(
                        (value) => AutoRouter.of(context).push(
                            CourseUnitIntroVideoRoute(unitIntroVideo: value!)));
                  }
                  break;
                case "2":
                  {
                    // Grammar table
                    AutoRouter.of(context)
                        .push(const ModuleGrammarTableRoute());
                  }
                  break;

                case "3":
                  {
                    // Mixed video
                    AutoRouter.of(context).push(const ModuleMixedVideoRoute());
                  }
                  break;

                case "4":
                  {
                    // Reading
                    AutoRouter.of(context).push(const ModuleReadingRoute());
                  }
                  break;

                case "5":
                  {
                    // Listening
                    AutoRouter.of(context).push(const ModuleListenRoute());
                  }
                  break;

                case "6":
                  {
                    // Writing
                    AutoRouter.of(context).push(const ModuleWritingRoute());
                  }
                  break;

                case "7":
                  {
                    // Conversation video
                    AutoRouter.of(context)
                        .push(const ModuleConversationVideoRoute());
                  }
                  break;

                case "8":
                  {
                    // progress exam
                    AutoRouter.of(context)
                        .push(const ModuleProgressExamRoute());
                  }
                  break;

                default:
                  {
                    print('no module');
                  }
              }
            },
            child: Text(
              data.moduleTypeName,
              style: const TextStyle(
                  color: colorPrimary,
                  fontWeight: FontWeight.w700,
                  fontSize: 16),
            ),
          ),
        ),
      ),
    ),
  );
}
