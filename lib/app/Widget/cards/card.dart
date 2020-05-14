import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';


class CardsWidget extends StatefulWidget {
  CardsWidget({Key key, this.val}) : super(key: key);
  final val;

  @override
  _CardsWidget createState() => _CardsWidget();

}

class _CardsWidget extends State<CardsWidget>
    with SingleTickerProviderStateMixin {


  //CardData(date, workTime, time, street,nameMaters, examples, nameService);

  @override
  Widget build(BuildContext context) {

    var cardData = this.widget.val;
    var date = cardData.date ;
    var workTime = cardData.workTime;
    var time = cardData.time;
    var street =  cardData.street;
    var nameMasters = cardData.nameMasters;
    var examples = cardData.examples;


    return Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        elevation: 4.0,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,

        children: <Widget>[
          Column(

            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(
                    right: 5,
                    left: 10),
                child: CircleAvatar(
                  radius: 40,
                  backgroundImage: NetworkImage("https://i.imgur.com/BoN9kdC.png"),
                ),),

          ],),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
            Row(
              children: <Widget>[
              Text("$date"),
            ],),
            Row(children: <Widget>[
              Text("$nameMasters"),
            ],),
            Row(children: <Widget>[
              Text("$street"),
            ],),

          ],),
          Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
            Row(children: <Widget>[
              Text("$time"),
            ],),
            Row(children: <Widget>[
              Text("$workTime"),
            ],),
            Row(children: <Widget>[
              Text("$examples"),
            ],),

          ],),

          Column(crossAxisAlignment: CrossAxisAlignment.end,

            children: <Widget>[

              Row(
                children: <Widget>[
                FlatButton(
                  hoverColor: Colors.lightBlue,
                  onPressed: () {
                    print("Push");
                  },
                  child: Text("Подробно"),
                ),
              ],),
              Row(children: <Widget>[
                FlatButton(
                  onPressed: () {

                    print("Push");
                  },
                  child: Text("Записаться"),
                ),
              ],),

          ],),

      ],),



      /*Container(
        child: Padding(
          padding: EdgeInsets.only(top: 10, right: 0, bottom: 0),
          child: Container(
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children:<Widget>[

                Column( crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    new Container(
                        width: 90.0,
                        height: 90.0,
                        decoration: new BoxDecoration(
                            shape: BoxShape.circle,
                            image: new DecorationImage(
                                fit: BoxFit.fill,
                                image: new NetworkImage(
                                    "https://i.imgur.com/BoN9kdC.png")
                            )
                        )),
                    Text("$nameMasters"),


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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      child: Row(children: <Widget>[
                        Icon(Icons.image),
                        Text("$examples"),
                      ],),),
                    FlatButton(
                      onPressed: () {
                        if(_pushed == true){
                          _textButton = "Отменить запись";
                        }else{
                          _textButton = "Записаться";
                        }
                        print("Push");
                      },
                      child: Text(_textButton.toString()),
                    ),
                  ],),
                ],
            ),
          )
        ),
      )*/
    );
    }



}


/* Widget get _tags {
    return Tags(
      key: _tagStateKey,
      itemCount: _items.length,
      itemBuilder: (index) {
        final item = _items[index];

        return ItemTags(
          key: Key(index.toString()),
          index: index,
          title: item,
          pressEnabled: true,
          activeColor: Colors.deepOrangeAccent[200],
          singleItem: _singleItem,
          splashColor: Colors.amber,
          combine: ItemTagsCombine.withTextBefore,
          onPressed: (item) =>(){ if(item.active == false)
          {

          }}
        );
      },
    );
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
  }*/



