import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:medlegten/common/colors.dart';
import 'package:medlegten/models/Landing/course_unit.dart';
import 'package:medlegten/models/Landing/course_unit_module_list.dart';
import 'package:medlegten/pages/CoursePages/course_unit_module_list/course_unit_module_helper.dart';
import 'package:medlegten/utils/app_router.dart';
import 'package:timeline_tile/timeline_tile.dart';

// ignore: must_be_immutable
class TimeLineTileItemWidget extends StatefulWidget {
  TimeLineTileItemWidget(this.callBack,
      {Key? key, this.data, this.idx, this.isLast, this.unitInfo})
      : super(key: key);

  CourseUnitModuleList? data;
  int? idx;
  int? isLast;
  CourseUnit? unitInfo;
  Function callBack;
  @override
  _TimeLineTileItemWidgetState createState() => _TimeLineTileItemWidgetState();
}

class _TimeLineTileItemWidgetState extends State<TimeLineTileItemWidget>
    with AutoRouteAware {
  AutoRouteObserver? _observer;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // RouterScope exposes the list of provided observers
    // including inherited observers
    _observer =
        RouterScope.of(context).firstObserverOfType<AutoRouteObserver>();

    if (_observer != null) {
      // we subscribe to the observer by passing our
      // AutoRouteAware state and the scoped routeData
      _observer!.subscribe(this, context.routeData);
    }
  }

  @override
  void didPopNext() {
    widget.callBack.call();
  }

  @override
  void dispose() {
    _observer!.unsubscribe(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 40),
      child: SizedBox(
        width: double.infinity,
        height: 70,
        child: TimelineTile(
          beforeLineStyle: LineStyle(
              color: widget.data!.isCompleted
                  ? colorPrimary
                  : const Color(0xffA8AFE5),
              thickness: 3),
          afterLineStyle: LineStyle(
              thickness: 3,
              color: widget.data!.isCompleted
                  ? colorPrimary
                  : const Color(0xffA8AFE5)),
          axis: TimelineAxis.vertical,
          hasIndicator: true,
          isFirst: widget.isLast == 0,
          isLast: widget.isLast == 1,
          indicatorStyle: IndicatorStyle(
            indicator: Container(
              decoration: BoxDecoration(
                border: Border.fromBorderSide(
                  BorderSide(
                    color: widget.data!.isCompleted
                        ? colorPrimary
                        : Colors.transparent,
                  ),
                ),
                color: widget.data!.isCompleted
                    ? colorPrimary
                    : const Color(0xffA8AFE5),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: widget.data!.isCompleted
                    ? const SizedBox(
                        child: Center(
                          child: Icon(
                            Icons.check,
                            size: 20,
                          ),
                        ),
                      )
                    : Text(
                        '${widget.idx! + 1}',
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
                switch (widget.data!.moduleTypeId) {
                  case "8":
                  case "9":
                    {
                      if (widget.data!.isUpcoming &&
                          !widget.data!.isCompleted) {
                        AutoRouter.of(context).push(
                          UnitTestRoute(
                              isOnlyShowResult: false,
                              unitTitle: widget.data!.moduleTypeName,
                              moduleTypeId: widget.data!.moduleTypeId,
                              moduleId: widget.data!.moduleId),
                        );
                      } else if (!widget.data!.isUpcoming &&
                          widget.data!.isCompleted) {
                        AutoRouter.of(context).push(
                          UnitTestRoute(
                              isOnlyShowResult: true,
                              unitTitle: widget.data!.moduleTypeName,
                              moduleTypeId: widget.data!.moduleTypeId,
                              moduleId: widget.data!.moduleId),
                        );
                      }
                      break;
                    }
                  default:
                    if (widget.data!.isUpcoming || widget.data!.isCompleted) {
                      UnitModuleHelper()
                          .showUnitPages(context, widget.data, widget.unitInfo);
                    }
                }
              },
              child: Text(
                widget.data!.moduleTypeName,
                style: TextStyle(
                    color: widget.data!.isCompleted
                        ? colorPrimary
                        : const Color(0xff6573DB),
                    fontStyle: FontStyle.normal,
                    fontWeight: widget.data!.isCompleted
                        ? FontWeight.bold
                        : FontWeight.normal,
                    fontSize: 16),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
