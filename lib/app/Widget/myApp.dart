import 'package:flutter/material.dart';
import 'enter/helloWidget.dart';
import 'package:flutterapp/app/Widget/cabinet/accauntWidget.dart';
import 'package:flutterapp/app/Widget/list/listWidgetPage.dart';
import 'package:flutterapp/app/Widget/databaseConnector.dart';
import 'package:flutterapp/app/Widget/cabinet/workCalendar.dart';



class MyApp extends StatelessWidget {

  final numItems = [];

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: DatabaseConnector().databaseConnector(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
      return MaterialApp(
        title: 'I am do',
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/tag': (context) => ListWidgetPage(),
          '/cab': (context) => AccauntWidget(),
          '/workCalendar': (context) => WorkCalendar(),
        },
        theme: ThemeData(
          primaryColor: Colors.pink[200],
          //visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: HelloWidget(),
       );
      },
    );
  }
}

