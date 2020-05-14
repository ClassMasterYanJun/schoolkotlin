import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/app/Widget/myApp.dart';



 class  HelloWidget extends MyApp {

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple,
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
            Text("Мастер", style: TextStyle(fontSize: 60, color: Colors.white,)),
          ],),
          Row(mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
            Column(
              children: <Widget>[

              FlatButton(
                  child: Text("Я мастер",  style: TextStyle(fontSize: 20, color: Colors.white,)),
                  onPressed: ()
                  {
                    Navigator.pushNamed(context, '/cab');
                  }
              ),

            ],),
            Column(children: <Widget>[

              FlatButton(
                  child: Text("Хочу записаться",  style: TextStyle(fontSize: 20, color: Colors.white,)),
                  onPressed: ()
                  {
                    Navigator.pushNamed(context, '/tag');
                  }
              )

            ],),
          ],),
        ],
      ),
            ),
          );
        }
    }
