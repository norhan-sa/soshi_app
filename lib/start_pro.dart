import 'package:flutter/material.dart';

 class StartPro extends ChangeNotifier{

   int _index = 0;

   get index => _index;

   void change_index(int index){
    _index = index; 
    notifyListeners();
   }
 }
