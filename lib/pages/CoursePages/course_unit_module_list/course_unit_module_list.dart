import 'dart:async';

import 'package:flutter/material.dart';
import 'package:medlegten/common/colors.dart';
import 'package:medlegten/common/widget_functions.dart';
import 'package:medlegten/components/loading.dart';
import 'package:medlegten/components/wide_button.dart';
import 'package:medlegten/models/Landing/course_unit.dart';
import 'package:medlegten/models/Landing/course_unit_module_list.dart';
import 'package:medlegten/pages/CoursePages/course_unit_module_list/course_unit_module_helper.dart';
import 'package:medlegten/pages/CoursePages/course_unit_module_list/timeline_tile_item.dart';
import 'package:medlegten/pages/CoursePages/course_unit_module_list/unit_module_header.dart';
import 'package:medlegten/repositories/landing_repository.dart';
import 'package:medlegten/utils/app_router.dart';
import 'package:tuple/tuple.dart';
import 'package:auto_route/auto_route.dart';

class CourseUnitModuleListPage extends StatefulWidget {
  const CourseUnitModuleListPage(this.unitInfo, {Key? key}) : super(key: key);

  final CourseUnit unitInfo;

  @override
  _CourseUnitModuleListPageState createState() =>
      _CourseUnitModuleListPageState();
}

class _CourseUnitModuleListPageState extends State<CourseUnitModuleListPage> {
  List<Tuple2<int, CourseUnitModuleList>>? unitList = [];
  var switcher = false;
  Future<List<Tuple2<int, CourseUnitModuleList>>> fetchData() async {
    var result = await LandingRepository()
        .getCourseUnitModuleList(widget.unitInfo.unitId);

    List<Tuple2<int, CourseUnitModuleList>> listTuple = [];

    if (result != null) {
      for (int i = 0; i < result.length; i++) {
        listTuple.add(Tuple2<int, CourseUnitModuleList>(i, result[i]));
      }
    }

    unitList = listTuple;

    return listTuple;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: ValueKey<bool>(switcher),
      appBar: AppBar(
        title: Text('Unit ${widget.unitInfo.unitNumber}'),
      ),
      backgroundColor: ColorTable.color255_255_255,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          UnitModuleHeader(
            unitInfo: widget.unitInfo,
          ),
          gradientButton(
            "Үгсийн сан",
            () {
              AutoRouter.of(context).push(VocabularyListRoute(
                  unitTitle: 'UNIT ${widget.unitInfo.unitNumber}-Vocabulary',
                  unit: widget.unitInfo));
            },
          ),
          const SizedBox(
            height: 15,
          ),
          Expanded(
            child: FutureBuilder<List<Tuple2<int, CourseUnitModuleList>>>(
              future: fetchData(),
              builder: (BuildContext context,
                  AsyncSnapshot<List<Tuple2<int, CourseUnitModuleList>>>
                      snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    padding: const EdgeInsets.all(0),
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      var tuple = snapshot.data![index];
                      return TimeLineTileItemWidget(() {
                        setState(() {
                          switcher = !switcher;
                          print('Hereeeeeeeeeeeeeeeeee $switcher');
                        });
                      },
                          unitInfo: widget.unitInfo,
                          data: tuple.item2,
                          idx: tuple.item1,
                          isLast: tuple.item1 == 0
                              ? 0
                              : tuple.item1 == snapshot.data!.length - 1
                                  ? 1
                                  : -1);
                    },
                  );
                } else if (snapshot.hasError) {
                  return const Loading();
                } else {
                  return const Loading();
                }
              },
            ),
          ),
          WideButton(
            "Эхлэх",
            colorSecondary,
            colorWhite,
            () {
              if (unitList != null) {
                for (var tuple in unitList!) {
                  if (tuple.item2.isUpcoming) {
                    UnitModuleHelper()
                        .showUnitPages(context, tuple.item2, widget.unitInfo);
                    break;
                  }
                }
              }
            },
          ),
          addVerticalSpace(25),
        ],
      ),
    );
  }

  Widget gradientButton(String caption, Function() whenTap) {
    return SizedBox(
      height: 52,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 28),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topLeft,
              colors: [
                const Color(0xff4481EB).withOpacity(1),
                const Color(0xff4481EB).withOpacity(0.56),
                const Color(0xff1AE5EF).withOpacity(1)
              ],
            ),
          ),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.transparent,
              onSurface: Colors.transparent,
              shadowColor: Colors.transparent,
            ),
            onPressed: whenTap,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(
                  Icons.bookmark,
                  color: Color(0xffffffff),
                  size: 20,
                ),
                const SizedBox(
                  width: 20,
                ),
                Text(
                  caption,
                  style: const TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Color(0xffffffff)),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
