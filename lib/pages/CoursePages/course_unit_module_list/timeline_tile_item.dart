import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:medlegten/common/colors.dart';
import 'package:medlegten/models/Landing/course_unit.dart';
import 'package:medlegten/models/Landing/course_unit_module_list.dart';
import 'package:medlegten/repositories/unit_repository.dart';
import 'package:medlegten/utils/app_router.dart';
import 'package:timeline_tile/timeline_tile.dart';

// ignore: must_be_immutable
class TimeLineTileItemWidget extends HookWidget {
  TimeLineTileItemWidget(
      {Key? key, this.data, this.idx, this.isLast, this.unitInfo})
      : super(key: key);

  CourseUnitModuleList? data;
  int? idx;
  int? isLast;
  CourseUnit? unitInfo;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 40),
      child: SizedBox(
        width: double.infinity,
        height: 70,
        child: TimelineTile(
          beforeLineStyle: LineStyle(
              color: data!.isCompleted ? colorPrimary : const Color(0xffA8AFE5),
              thickness: 3),
          afterLineStyle: LineStyle(
              thickness: 3,
              color:
                  data!.isCompleted ? colorPrimary : const Color(0xffA8AFE5)),
          axis: TimelineAxis.vertical,
          hasIndicator: true,
          isFirst: isLast == 0,
          isLast: isLast == 1,
          indicatorStyle: IndicatorStyle(
            indicator: Container(
              decoration: BoxDecoration(
                border: Border.fromBorderSide(
                  BorderSide(
                    color:
                        data!.isCompleted ? colorPrimary : Colors.transparent,
                  ),
                ),
                color:
                    data!.isCompleted ? colorPrimary : const Color(0xffA8AFE5),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: data!.isCompleted
                    ? const SizedBox(
                        child: Center(
                          child: Icon(
                            Icons.check,
                            size: 20,
                          ),
                        ),
                      )
                    : Text(
                        '${idx! + 1}',
                        style: TextStyle(
                            fontFamily: 'Roboto',
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
                switch (data!.moduleTypeId) {
                  case "8":
                  case "9":
                    {
                      if (!data!.isUpcoming && !data!.isCompleted) {
                        AutoRouter.of(context).push(
                          UnitTestRoute(
                              unitTitle: data!.moduleTypeName,
                              moduleTypeId: data!.moduleTypeId,
                              moduleId: data!.moduleId),
                        );
                      }
                      break;
                    }
                  default:
                    if (data!.isUpcoming || data!.isCompleted) {
                      switch (data!.moduleTypeId) {
                        case "1":
                          {
                            UnitRepository()
                                .getUnitIntroVideo(data!.moduleId)
                                .then((value) => AutoRouter.of(context)
                                        .push(CourseUnitIntroVideoRoute(
                                      unitTitle: data!.moduleTypeName,
                                      unitIntroVideo: value!,
                                      url: value.url,
                                      moduleId: data!.moduleId,
                                      isCompleted: data!.isCompleted,
                                    )));
                          }
                          break;
                        case "2":
                          {
                            UnitRepository()
                                .getUnitGrammar(data!.moduleId)
                                .then(
                                  (value) => AutoRouter.of(context).push(
                                    GrammarTableRoute(
                                        isCompleted: data!.isCompleted,
                                        unitTitle: data!.moduleTypeName,
                                        unitGrammar: value!,
                                        moduleId: data!.moduleId),
                                  ),
                                );
                          }
                          break;

                        case "3":
                          {
                            UnitRepository().getMixedVideo(data!.moduleId).then(
                                  (value) => AutoRouter.of(context).push(
                                    MixedVideoRoute(
                                        isCompleted: data!.isCompleted,
                                        unitTitle: data!.moduleTypeName,
                                        unitMixedVideo: value!,
                                        url: value.url,
                                        moduleId: data!.moduleId),
                                  ),
                                );
                          }
                          break;
                        case "4":
                          {
                            UnitRepository().getReading(data!.moduleId).then(
                                  (value) => AutoRouter.of(context).push(
                                    ReadingRoute(
                                        isCompleted: data!.isCompleted,
                                        unitTitle: data!.moduleTypeName,
                                        reading: value!,
                                        moduleId: data!.moduleId),
                                  ),
                                );
                          }
                          break;

                        case "5":
                          {
                            UnitRepository()
                                .getUnitListening(
                                    moduleId: data!.moduleId,
                                    moduleTypeid: data!.moduleTypeId)
                                .then((value) {
                              AutoRouter.of(context).push(
                                ModuleListenRoute(
                                    isCompleted: data!.isCompleted,
                                    unitInfo: unitInfo,
                                    listeningQuiz: value,
                                    moduleId: data!.moduleId),
                              );
                            });
                          }
                          break;
                        case "6":
                          {
                            // Writing
                            UnitRepository().getWriting(data!.moduleId).then(
                                  (value) => AutoRouter.of(context).push(
                                    WritingVideoRoute(
                                        isCompleted: data!.isCompleted,
                                        unitWriting: value!,
                                        unitTitle: data!.moduleTypeName,
                                        moduleId: data!.moduleId),
                                  ),
                                );
                          }
                          break;

                        case "7":
                          {
                            // Conversation video
                            UnitRepository()
                                .getConversationVideo(data!.moduleId)
                                .then((value) {
                              if (value != null) {
                                AutoRouter.of(context).push(
                                  ConversationVideoRoute(
                                      isCompleted: data!.isCompleted,
                                      unitTitle: data!.moduleTypeName,
                                      unitConversationVideo: value,
                                      url: value.url,
                                      moduleId: data!.moduleId),
                                );
                              }
                            });
                          }
                          break;
                        default:
                          {
                            print('no module');
                          }
                      }
                    }
                }
              },
              child: Text(
                data!.moduleTypeName,
                style: TextStyle(
                    color: data!.isCompleted
                        ? colorPrimary
                        : const Color(0xff6573DB),
                    fontStyle: FontStyle.normal,
                    fontWeight:
                        data!.isCompleted ? FontWeight.bold : FontWeight.normal,
                    fontSize: 16),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
