import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/app/Widget/cards/cardData.dart';
import 'package:flutterapp/app/Widget/date/date.dart';
import 'dart:async';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutterapp/app/Widget/cabinet/Calendar.dart';


class WorkCalendar extends StatefulWidget {

  @override
  createState() => new WorkCalendarState();

}

class WorkCalendarState extends State<WorkCalendar> {

  List<dynamic> dateList = [];
  String masterCode;
  Map workDate;

  var day;
  var lastDay;

  Future _getData() async {

      final cardRef =  FirebaseDatabase.instance.reference();

      Map<dynamic, dynamic> values;

      await cardRef.once().then(
              (DataSnapshot snapshot){

            values = snapshot.value;
            values.forEach((key,values){
                Calendar c = Calendar(
                    values[key]['masterCode'],
                    values[key]["time"],
                    values[key]['date']);

              dateList.add(c);

              this.setState(() {

              });
            });
           });
        }

    @override
    Widget build(BuildContext context) {

      return Scaffold(
        appBar: AppBar(
          leading: Icon(
            Icons.event,
            color: Colors.white,
          ),
          title: Text("Календарь",
            style: TextStyle(color: Colors.white),),
          backgroundColor: Colors.purple,
        ),
        body: DateWidget(dateList: dateList),
        floatingActionButton: FloatingActionButton(
          onPressed: (){

            setNext(lastDay);

            DatePicker.showDatePicker(
              context,
              minTime: lastDay,
              maxTime: DateTime(2030, 12 , 30),
              onConfirm: (date) {
                day = date;
                var value = formater(date).toString();
                Map timeList = {};
                masterCode = "121";
                var newCalendar = Calendar(masterCode, timeList ,value,);
                dateList.add(newCalendar);
                DateWidget(dateList: dateList,);

                lastDay = date.add(new Duration(days: 1));

                setState(() {});
                },
              showTitleActions: true,
              currentTime: DateTime(2008, 12, 31, 23, 12, 34),
              locale: LocaleType.ru
            );},
          child: Icon(Icons.add),
        ),
      );
    }

    @override
    void initState(){
      super.initState();
      //_getData();
    }

    formater(date) {
      var day = date.day.toString();
      var month = date.month.toString();

      if (day.length < 2) {
        day = "0" + date.day.toString();
      }
      if (month.length < 2) {
        month = "0" + date.month.toString();
      }
      var newDate = day + "_" + month + "_" + date.year.toString();

      return newDate;
      }

      setNext(day){

        if(day == null){

          day = DateTime.now();

        }

        lastDay = day;

      }


  }

