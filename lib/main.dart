import 'package:flutter/material.dart';
import 'package:soshi_app/start.dart';
import 'package:provider/provider.dart';
import 'package:soshi_app/start_pro.dart';
import 'package:soshi_app/home.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/start': (context) => ChangeNotifierProvider<StartPro>(
        create: (context)=> StartPro(),
        child: Start(),
      ),
      '/': (context) => Home(),
    },
   ),
  );
}
