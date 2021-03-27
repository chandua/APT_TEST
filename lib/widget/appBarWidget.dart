import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget appBarWidget(context) {
  return AppBar(
    elevation: 0.0,
    centerTitle: true,
    title: Text("AST Products",style: TextStyle(color: Color(0xFF364760),fontSize:17,fontFamily: 'SourceSansProBold')),
    leading: GestureDetector(

      child: Icon(
        Icons.arrow_back_ios, size: 20,
      ),
    ),
  );
}