import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/app/Widget/date/time.dart';

class DateWidget extends StatefulWidget {
  DateWidget({Key key, this.title, this.wish, this.dateList}) : super(key: key);
  final bool wish;
  final String title;
  final List<String> dateList;


  @override
  _DateWidgetState createState() => _DateWidgetState();
}
class _DateWidgetState extends State<DateWidget>
    with SingleTickerProviderStateMixin {

  List<String>dateList = [];


  @override
  void initState() {
    super.initState();
    super.setState(() {
     if(widget.dateList != null){
        dateList = widget.dateList;
     }
    });
  }

  @override
  Widget build(BuildContext context) {

      return new ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount:  dateList == null ? 0 : dateList.length,
          itemBuilder: (context, index) {
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
                        dateList[index].toString(),
                        style: TextStyle(
                            fontSize: 23),
                        textAlign: TextAlign.center,),
                        MaterialButton(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                          child: Icon(Icons.delete, size: 23,),
                          height: 23,
                          onPressed:(){
                            dateList.removeAt(index) ;
                            setState(() {
                            });;
                          },
                        ),

                      ],
                    mainAxisAlignment: MainAxisAlignment.center,),
                    Row(mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          height: 540,
                          width: 285,
                          child: TimeWidget(),
                        ),
                      ],)

                  ],),

                ),
              );
          },);

  }
}
