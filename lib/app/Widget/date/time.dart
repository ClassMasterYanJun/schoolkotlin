import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';


class TimeWidget extends StatefulWidget {
  TimeWidget({Key key, this.title, this.wish, this.day}) : super(key: key);
  final bool wish;
  final String title;
  final String day;

  @override
  _TimeWidgetState createState() => _TimeWidgetState();
}
class _TimeWidgetState extends State<TimeWidget>
    with SingleTickerProviderStateMixin {

  final List<String> _timeList = [
    "12:00",
    "12:30",
    "13:00",
    "13:30"
  ];

  refresh(){
    setState(() { });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

      return new ListView.builder(
          itemCount: _timeList.length,
          itemBuilder: (context, index) {
                    return Card(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9.0)),
                      color: Colors.purple,
                      elevation: 4.0,
                      child: Container(
                        margin: EdgeInsets.only(
                            top: 5,
                          ),
                        height: 150,
                        width: 250,
                        child:Column(children: <Widget>[
                          Row(
                            children: <Widget>[
                              Text(
                                _timeList[index].toString(),
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20),
                                textAlign: TextAlign.center,),
                              MaterialButton(
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                child: Icon(Icons.create,color: Colors.white, size: 19,),
                                height: 20,
                                minWidth: 10,
                                onPressed:() {
                                  DatePicker.showTimePicker(
                                    context,
                                    locale: LocaleType.ru,
                                    showSecondsColumn: false,
                                    onConfirm: (time) {

                                      var newTime = time.hour.toString() + ":" + time.minute.toString();
                                      _timeList.removeAt(index);
                                      _timeList.insert(index, newTime);
                                      refresh();
                                    },
                                  );
                                }),
                              MaterialButton(
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                child: Icon(Icons.delete,color: Colors.white, size: 19,),
                                height: 20,
                                minWidth: 10,
                                onPressed:(){ 
                                  _timeList.removeAt(index) ;
                                  refresh();
                                 },
                              ),
                            ],
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          ),
                          Row(
                            children: <Widget>[],
                          ),
                        ],)

                      ),
                    );},
      );

  }

}
