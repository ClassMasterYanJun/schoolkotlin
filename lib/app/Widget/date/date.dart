import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/app/Widget/date/time.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutterapp/app/Widget/cabinet/Calendar.dart';
import 'package:flutterapp/app/Widget/databaseConnector.dart';


class DateWidget extends StatefulWidget {
  DateWidget({Key key, this.title, this.wish, this.dateList}) : super(key: key);
  final bool wish;
  final String title;
  final List<dynamic> dateList;


  @override
  _DateWidgetState createState() => _DateWidgetState();
}
class _DateWidgetState extends State<DateWidget>
    with SingleTickerProviderStateMixin {

  List<dynamic> dateList;


  @override
  void initState() {
    super.initState();
    super.setState(() {
     if(widget.dateList != null){
       print(widget.dateList);
        dateList = widget.dateList;
     }
    });
  }

  @override
  Widget build(BuildContext context) {
      var text;

      return new ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount:  dateList == null ? 0 : dateList.length,
          itemBuilder: (context, index) {
            Calendar newCalendar =  dateList[index];
            Map timeMap = newCalendar.time;
            List<dynamic> timeList =[];
            return
              Container(
                width: 300,
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  elevation: 4.0,
                  child: Column(children: <Widget>[
                    Row(
                      children: <Widget>[
                      Text(
                        newCalendar.date.toString(),
                        style: TextStyle(
                            fontSize: 23),
                        textAlign: TextAlign.center,),
                        MaterialButton(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                          child: Icon(Icons.clear, size: 20, color: Colors.red,),
                          height: 20,
                          minWidth: 5,
                          onPressed:(){

                            dateList.removeAt(index) ;

                            setState(() {
                            });
                          },
                        ),
                      ],
                    mainAxisAlignment: MainAxisAlignment.center,),
                    Row(mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          height: 495,
                          width: 285,
                          child: TimeWidget(timeList: timeList,),
                        ),
                      ],),
                    Row(
                      children: <Widget>[
                            MaterialButton(
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                              child: Icon(Icons.add, size: 23,),
                              minWidth: 5,
                              height: 23,
                              onPressed:(){
                                DatePicker.showTimePicker(
                                  context,
                                  locale: LocaleType.ru,
                                  showSecondsColumn: false,
                                  onConfirm: (time) {
                                    var newTime = time.hour.toString() + ":" + time.minute.toString();
                                    timeMap = {newTime : true};
                                    timeList.add(timeMap);
                                    TimeWidget(timeList: timeList,);
                                    setState(() {

                                     //DatabaseConnector().saveCalendar(newCalendar);
                                    });
                                  },
                                );
                                setState(() {
                                });
                              },
                            ),
                      ],
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center
                      ,),

                  ],),

                ),
              );
          },);

  }
}
