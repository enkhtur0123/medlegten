import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:medlegten/components/loading.dart';
import 'package:medlegten/models/Landing/course_info.dart';
import 'package:medlegten/repositories/repository.dart';

// ignore: must_be_immutable
class QpayPage extends HookWidget {
  QpayPage({Key? key, this.courseInfo}) : super(key: key);

  CourseInfo? courseInfo;

  @override
  Widget build(BuildContext context) {
    var data;
    // useEffect(() {}, const []);
    return Scaffold(
        appBar: AppBar(),
        body: FutureBuilder(
          future: getQpayBanK(),
          builder: (context, snapshot) {
            if(snapshot.hasData){
               return GridView.count(
              crossAxisCount: 3,
              shrinkWrap: true,
              childAspectRatio: 2 / 3,
              children: [Text("")],
            );
           }
           else if(snapshot.hasError){
             return const Loading();
           }
           else {
             return const Loading();
          }
        },
      )
    );
  }

  Future<dynamic> getQpayBanK() async {
    dioRepository.instance.get('Payments').then((value) {
      print(value);
    });
  }
}
