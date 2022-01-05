import 'package:flutter/material.dart';
import 'package:medlegten/common/colors.dart';
import 'package:medlegten/models/Landing/course_info.dart';

class CourseCart extends StatelessWidget {
  const CourseCart(this.courseInfo, {Key? key}) : super(key: key);

  final CourseInfo courseInfo;

  final TextStyle textStyle = const TextStyle(color: Colors.black);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: SizedBox(
          width: double.infinity,
          height: 120,
          child: Card(
            color: ColorTable.color255_255_255,
            shadowColor: Colors.grey.withOpacity(0.5),
            elevation: 10.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                      // Text('data', style: TextStyle(color: Colors.red),),
                      Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/img/Course/course_bg_a1.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: null /* add child content here */,
                      ),
                  ],
                )
              ],
            ),
          ),
        ),
    );
  }
}
