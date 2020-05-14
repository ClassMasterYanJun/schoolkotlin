import 'package:flutter/material.dart';
import 'package:flutter_tags/flutter_tags.dart';


class TagsWidget extends StatefulWidget {
  TagsWidget({Key key, this.title, this.wish, this.item}) : super(key: key);
  final bool wish;
  final String title;
  final List item;


  @override
  _TagsWidgetState createState() => _TagsWidgetState();
}

class _TagsWidgetState extends State<TagsWidget>
    with SingleTickerProviderStateMixin {



    final List<String> _listWish = [
    'Новую прическу',
    'Новый маникюр',
    'Новый педикюр',
    'Новый мэйкап',
  ];

    final List<String> _listDo = [
      'Делаю прическу',
      'Делаю маникюр',
      'Делаю педикюр',
      'Делаю мэйкап',
    ];



  bool _singleItem = false;

  @override
  void initState() {
    super.initState();
        if(this.widget.wish == true) {

        _items = _listWish.toList();

        }else{
          _items = _listDo.toList();
       }
  }

  List _items;



  @override
  Widget build(BuildContext context) {

    return Container(
           height: 90,
           width: 300,
           child: _tags,
    );
  }

  Widget get _tags {
  final GlobalKey<TagsState> _tagStateKey = GlobalKey<TagsState>();

    return new Tags(
            horizontalScroll: true,
            key: _tagStateKey,
            itemCount: _items.length,
            itemBuilder: (index) {

              final item = _items[index];

            return ItemTags(
              key: Key(index.toString()),
              index: index,
              title: item,
              pressEnabled: true,
              activeColor: Colors.purple,
              singleItem: _singleItem,
              splashColor: Colors.amber,
              combine: ItemTagsCombine.withTextBefore,
              onPressed:(item){

              }

            );
            },
        );




  }









/*  List<DropdownMenuItem> _buildItems2() {
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

    bottomNavigationBar: BottomAppBar(
          color: Colors.deepOrangeAccent,
          elevation: 5.9,
          child:



  }*/
}