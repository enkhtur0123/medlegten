import 'package:flutter/material.dart';
///Toast show
class MySnackBar extends SnackBar{
   String? text;
   
   MySnackBar({this.text}) : super(content:Text(text??"",style: TextStyle(color: Colors.white),),backgroundColor: Colors.black,padding: EdgeInsets.all(15));
  
}