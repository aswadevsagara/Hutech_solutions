import 'package:flutter/material.dart';

class SuccesssProvider  extends ChangeNotifier {

  navigationPop( context)async{
   await  Future.delayed(const Duration(seconds: 2));
   Navigator.of(context).pop();
  }
  
}