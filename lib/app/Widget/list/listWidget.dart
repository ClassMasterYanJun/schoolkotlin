
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/app/Widget/cards/card.dart';
import 'package:flutterapp/app/Widget/cards/cardData.dart';
import 'dart:async';


class ListWidget extends StatefulWidget {


  @override
  createState() => new ListWidgetState();

}

class ListWidgetState extends State<ListWidget> {


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
          });
        }
      );
    });
  }

  @override
  Widget build(BuildContext context) {

    return new ListView.builder(
      itemCount: data == null ? 0 : data.length,
      itemBuilder: (context, int index){
        return new CardsWidget( val: data[index],) ;//data.map((CardData card) => CardsWidget());
    });
  }

  @override
 void initState(){
    super.initState();
    _getData();
  }

}






/*class ListWidget extends StatefulWidget{
  const ListWidget({Key key}) : super(key: key);

  @override
  _ListWidgetState createState() => _ListWidgetState();

}


  class _ListWidgetState extends State<ListWidget>{

    DatabaseReference cardRef;

  var numItems = [];

    @override
  Widget build(BuildContext context) {
      Widget _buildRow(int idx) {
        return Scaffold(
          body: Padding(
              padding: EdgeInsets.only(top: 0, right: 0, bottom: 0),
              child: CardsWidget(),

          ),
        );
      }
    }

    return ListView.builder(
      itemBuilder: (BuildContext context, int i) {
      if (i.isOdd) return Divider();
      final index = i ~/ 2 + 1;
      return _buildRow(index);
      });
  }

    @override
    void initState() {
      super.initState();
      setState(() {

        DatabaseConnector().readCard(numItems);

      });
    }
  }









*textSet(int i){

    var text ="";

    if(i != 1){

      text="могу";

    } else{

      text="хочу";

    }

    return Text("$text",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white,
          fontSize: 25,)
    );


  }
}


List<DropdownMenuItem> _buildItems2() {
  List<DropdownMenuItem> list = [];

  list.add(DropdownMenuItem(
    child: Text("onlyText",  style: TextStyle(
      fontWeight: FontWeight.bold,
      color: Colors.white,
      fontSize: 25,)),
    value: 'onlyText',
  ));

  list.add(DropdownMenuItem(
    child: Text("onlyIcon"),
    value: 'onlyIcon',
  ));
  list.add(DropdownMenuItem(
    child: Text("onlyImage"),
    value: 'onlyImage',
  ));
  list.add(DropdownMenuItem(
    child: Text("imageOrIconOrText"),
    value: 'imageOrIconOrText',
  ));
  list.add(DropdownMenuItem(
    child: Text("withTextBefore"),
    value: 'withTextBefore',
  ));
  list.add(DropdownMenuItem(
    child: Text("withTextAfter"),
    value: 'withTextAfter',
  ));

  return list;
*/