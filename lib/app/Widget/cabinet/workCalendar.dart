import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/app/Widget/cards/cardData.dart';
import 'package:flutterapp/app/Widget/date/date.dart';
import 'dart:async';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class WorkCalendar extends StatefulWidget {

  @override
  createState() => new WorkCalendarState();

}

class WorkCalendarState extends State<WorkCalendar> {

  List<String> dateList = [];
  List<dynamic> data = [];



  Future _getData() async {

      final cardRef =  FirebaseDatabase.instance.reference() ;

      Map<dynamic, dynamic> values;

      await cardRef.once().then(
              (DataSnapshot snapshot){

            values = snapshot.value;
            values.forEach((key,values) {

              var cardData = CardData(

                 values["date"].toString(),
                 values["workTime"].toString(),
                 values["time"].toString(),
                 values["street"].toString(),
                 values["nameMasters"].toString(),
                 values["examples"].toString(),
                 values["tag"],
                 values[""],
                 values[""]) ;

              this.data.add(cardData);

              this.setState(() {

            //data =  cardData;
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
            DatePicker.showDatePicker(
              context,
              minTime: DateTime.now(),
              maxTime: DateTime(2030, 12 , 30),
              onConfirm: (date) {
                dateList.add(formater(date).toString());
                DateWidget(dateList: dateList,);
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

    formater(date){

      var day = date.day.toString();
      var month = date.month.toString();

      if(day.length < 2){
        day = "0" + date.day.toString();
      }
      if(month.length < 2){
        month = "0" + date.month.toString();
      }
      var newDate = day+"."+ month +"."+date.year.toString();

      return newDate;

    }

  }

