import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'package:soshi_app/home.dart';
import 'package:soshi_app/new_home.dart';
import 'package:soshi_app/start.dart';
import 'package:soshi_app/start_pro.dart';

void main() {
  runApp(
    MaterialApp(
      initialRoute: '/',
      routes: {
        '/start': (context) => ChangeNotifierProvider<StartPro>(
              create: (context) => StartPro(),
              child: Start(),
            ),
        '/': (context) => Home(),
      },
    ),
  );
}
