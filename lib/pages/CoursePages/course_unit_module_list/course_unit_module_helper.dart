import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:medlegten/models/Landing/course_unit.dart';
import 'package:medlegten/models/Landing/course_unit_module_list.dart';
import 'package:medlegten/repositories/unit_repository.dart';
import 'package:medlegten/utils/app_router.dart';
import 'package:medlegten/widgets/loader.dart';

class UnitModuleHelper {
  showUnitPages(
      BuildContext context, CourseUnitModuleList? data, CourseUnit? unitInfo) {
    switch (data!.moduleTypeId) {
      case "1":
        {
          showLoading(context: context, isLoad: true);
          UnitRepository().getUnitIntroVideo(data.moduleId).then((value) {
            showLoading(context: context, isLoad: false);
            AutoRouter.of(context).push(
              CourseUnitIntroVideoRoute(
                unitTitle: data.moduleTypeName,
                unitIntroVideo: value!,
                url: value.url,
                moduleId: data.moduleId,
                isCompleted: data.isCompleted,
              ),
            );
          }).catchError((onError) {
            showLoading(context: context, isLoad: false);
          });
        }
        break;
      case "2":
        {
          showLoading(context: context, isLoad: true);
          UnitRepository().getUnitGrammar(data.moduleId).then(
            (value) {
              showLoading(context: context, isLoad: false);
              AutoRouter.of(context).push(
                GrammarTableRoute(
                    isCompleted: data.isCompleted,
                    unitTitle: data.moduleTypeName,
                    unitGrammar: value!,
                    moduleId: data.moduleId),
              );
            },
          ).catchError((onError) {
            showLoading(context: context, isLoad: false);
          });
        }
        break;

      case "3":
        {
          showLoading(context: context, isLoad: true);
          UnitRepository().getMixedVideo(data.moduleId).then((value) {
            showLoading(context: context, isLoad: false);
            AutoRouter.of(context).push(MixedVideoRoute(
                isCompleted: data.isCompleted,
                unitTitle: data.moduleTypeName,
                unitMixedVideo: value!,
                url: value.url,
                moduleId: data.moduleId));
          }).catchError((onError) {
            showLoading(context: context, isLoad: false);
          });
        }
        break;
      case "4":
        {
          showLoading(context: context, isLoad: true);
          UnitRepository().getReading(data.moduleId).then(
            (value) {
              showLoading(context: context, isLoad: false);
              AutoRouter.of(context).push(
                ReadingRoute(
                    isCompleted: data.isCompleted,
                    unitTitle: data.moduleTypeName,
                    reading: value!,
                    moduleId: data.moduleId),
              );
            },
          ).catchError((onError) {
            showLoading(context: context, isLoad: false);
          });
        }
        break;

      case "5":
        {
          // print(data.moduleId);
          //  print(data.moduleTypeId);
          showLoading(context: context, isLoad: true);
          UnitRepository()
              .getUnitListening(
                  moduleId: data.moduleId, moduleTypeid: data.moduleTypeId)
              .then((value) {
            showLoading(context: context, isLoad: false);
            AutoRouter.of(context).push(
              ModuleListenRoute(
                  unitTitle: data.moduleTypeName,
                  isCompleted: data.isCompleted,
                  unitInfo: unitInfo,
                  listeningQuiz: value,
                  moduleId: data.moduleId),
            );
          }).catchError((onError) {
            showLoading(context: context, isLoad: false);
          });
        }
        break;
      case "6":
        {
          showLoading(context: context, isLoad: true);
          // Writing
          UnitRepository().getWriting(data.moduleId).then(
            (value) {
              showLoading(context: context, isLoad: false);
              AutoRouter.of(context).push(WritingVideoRoute(
                  isCompleted: data.isCompleted,
                  unitWriting: value!,
                  unitTitle: data.moduleTypeName,
                  moduleId: data.moduleId));
            },
          ).catchError((onError) {
            showLoading(context: context, isLoad: false);
          });
        }
        break;

      case "7":
        {
          showLoading(context: context, isLoad: true);
          // Conversation video
          UnitRepository().getConversationVideo(data.moduleId).then((value) {
            showLoading(context: context, isLoad: false);
            if (value != null) {
              AutoRouter.of(context).push(
                ConversationVideoRoute(
                    isCompleted: data.isCompleted,
                    unitTitle: data.moduleTypeName,
                    unitConversationVideo: value,
                    url: value.url,
                    moduleId: data.moduleId),
              );
            }
          }).catchError((onError) {
            showLoading(context: context, isLoad: false);
          });
        }
        break;
      default:
        {
        }
    }
  }

  showLoading({bool? isLoad, BuildContext? context}) {
    if (isLoad!) {
      LoadingIndicator(context: context).showLoadingIndicator();
    } else {
      LoadingIndicator(context: context).hideLoadingIndicator();
    }
  }
}
