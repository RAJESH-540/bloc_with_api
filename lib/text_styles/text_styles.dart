import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget appBarTitle(){
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment:CrossAxisAlignment.center,
    children:const  [
      Text("News ",style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),),
      Text("HUB",style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w600),),
    ],
  );
}