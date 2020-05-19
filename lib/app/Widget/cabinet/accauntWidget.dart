
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutterapp/app/Widget/tags/tag.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutterapp/app/Widget/controllers.dart';



class AccauntWidget extends StatefulWidget {
  const AccauntWidget({Key key}) : super(key: key);


  @override
  _AccauntWidget createState() => _AccauntWidget();

}

class _AccauntWidget extends State<AccauntWidget> with SingleTickerProviderStateMixin {

  String date;
  String workTimeHour;
  String workTimeMinutes;
  String workTime;
  String time;
  String street;
  String nameMaters;
  String examples;
  String nameService;
  dynamic _avatar;
  List item;



  Future<Image> showSelectedImage() async {

   var avatar = await ImagePicker.pickImage(source: ImageSource.gallery);

    this.setState(() {

           _avatar = Image.file(avatar);

     });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
              padding: EdgeInsets.symmetric(vertical: 90.0,horizontal: 20.0 ) ,
              children: <Widget>[
                Row(mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    FlatButton(
                          onPressed: (){
                            showSelectedImage();
                          },
                          child:
                                CircleAvatar(
                                  backgroundImage: _avatar,
                                  child:Icon(Icons.add_a_photo, size: 45, color: Colors.deepPurpleAccent,) ,
                                  backgroundColor: Colors.blueGrey[10],
                                  radius: 60,
                                )
                      ,)
                    ,]
                  ,),

              Text("Профиль:"),
              Container(
                height: 60,
                width: 200,
                child: TextField (
                  onChanged: (text) {
                  nameMaters = text;
                },
                    decoration: InputDecoration(
                      hintText: "Введите свое имя",
                    ),
                ),
              ),
              Text("Вид вашей услуги:"),
              TagsWidget(wish: false,item: item,) ,
              Container(
                child: Row(
                  children: <Widget>[
                  Text("Время выполнения услуги:",maxLines: 2,),
                  Column(children: <Widget>[
                    Container(
                      width: 50,
                      child: TextField(
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.numberWithOptions(decimal: false,signed: false ),
                        onChanged: (text) {
                          workTimeHour = text;
                      },
                      decoration: InputDecoration(
                        hintText: "01",
                      ),
                    ),)
                  ],),
                  Text(":"),
                  Column(children: <Widget>[
                    Container(
                      width: 50,
                      child: TextField(
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.numberWithOptions(decimal: false,signed: false ),
                        onChanged: (text) {
                          workTimeMinutes = text;
                        },
                        decoration: InputDecoration(
                          hintText: "30",
                        ),
                      ),)

                  ],),
                ],)

              ),
             Container(
                  height: 60,
                  width: 200,
                  child: TextField(
                    onChanged: (text) {
                      text =  "ул. "+ text.toString();
                      street = text ;
                    },
                    decoration: InputDecoration(
                      hintText: "Введите адрес",
                    ),
                  ),
                ),
                Container(
                  height: 60,
                  width: 200,
                  child:  TextField(
                    onChanged: (text) {

                      date = text.toString();

                    },
                    decoration: InputDecoration(
                      hintText: "Даты",
                    ),
                  ),
                ),
          FlatButton(
              hoverColor: Colors.lightBlue,
              child: Text("Сохранить"),
              onPressed: () {

                this.workTime = this.workTimeHour.toString() + " : " + this.workTimeMinutes.toString();
                saveInData(nameMaters, date, workTime, time, street, examples, nameService, _avatar, 0);

                   }
          ),

              ],
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed:(){
            Navigator.pushNamed(context, '/workCalendar');
            },
      ),
    );
  }




}

































/*return Container(
child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
children:<Widget>[

Column( crossAxisAlignment: CrossAxisAlignment.start,
children: <Widget>[
Container(
child: Row(children: <Widget>[
Icon(Icons.calendar_today),
Text("$date"),

],),),
Container(
child: Row(children: <Widget>[
Icon(Icons.timer),
Text("$workTime"),],),),

],),
Column( crossAxisAlignment: CrossAxisAlignment.start,
children: <Widget>[
Container(
child: Row(children: <Widget>[
Icon(Icons.access_time),
Text("$time"),],),),
Container(
child: Row(children: <Widget>[
Icon(Icons.location_on),
Text("$street"),],),),
FlatButton(
hoverColor: Colors.lightBlue,
onPressed: () {
print("Push");
},
child: Text("Подробно"),
),
],),
Column(crossAxisAlignment: CrossAxisAlignment.start,
children: <Widget>[
Container(
child: Row(children: <Widget>[
Icon(Icons.assignment_ind),
Text("$nameMaters"),],),),
Container(
child: Row(children: <Widget>[
Icon(Icons.image),
Text("$examples"),
],),),
FlatButton(
hoverColor: Colors.lightBlue,
onPressed: () {
print("Push");
},
child: Text("Записаться"),
),


],),
_button],
),
);*/