import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CoursePayment extends StatefulWidget {
  static var name;

  @override
  State<StatefulWidget> createState() {
    return CoursePaymentState();
  }
}

class CoursePaymentState extends State<CoursePayment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:Column(
      children: [
        Text("Төлбөрийн төрлөө сонгоно уу!",style: TextStyle(fontStyle: FontStyle.normal,fontWeight: FontWeight.bold,fontSize: 16),),
        
      ],));
  }
}
