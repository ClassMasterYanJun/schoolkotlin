import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class TimeWidget extends StatefulWidget {
  TimeWidget({Key key, this.timeList}) : super(key: key);
  List<dynamic> timeList;


  @override
  _TimeWidgetState createState() => _TimeWidgetState();
}
class _TimeWidgetState extends State<TimeWidget>
    with SingleTickerProviderStateMixin {

  List<dynamic> _timeList;

  refresh(){

    setState(() {

    });
  }

  @override
  void initState() {
    super.initState();
    super.setState(() {
      _timeList = widget.timeList;
    });
  }

  @override
  Widget build(BuildContext context) {

      getTime(index){

          Map map = _timeList[index];
          List list = map.keys.toList();;
          var time = list.last;

        return time.toString();
      }

      return new ListView.builder(
          itemCount: _timeList.length == null ? 0 : _timeList.length,
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
                                getTime(index),
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
                                      Map timeMap = {newTime : true};
                                      _timeList.insert(index, timeMap);
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
