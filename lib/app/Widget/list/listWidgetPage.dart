import 'package:flutter/material.dart';
import 'package:flutterapp/app/Widget/list/listWidget.dart';
import 'package:flutterapp/app/Widget/tags/tag.dart';

class ListWidgetPage extends StatefulWidget {
  const ListWidgetPage({Key key}) : super(key: key);


  @override
  createState() => new ListWidgetPageState();

}

class ListWidgetPageState extends State<ListWidgetPage>{
  @override

    Widget build(BuildContext context) {

    return Scaffold(
        backgroundColor: Colors.purple,
        body: ListWidget(), //ListWidget(),
        bottomNavigationBar: BottomAppBar(
          elevation: 5.9,
            child:
            TagsWidget(
          wish: true,
      )
    )




    );
  }

}