import 'package:flutter/material.dart';

class ChooseWidget extends StatefulWidget {
  const ChooseWidget({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ChooseWidgetState();

}

class _ChooseWidgetState extends State<ChooseWidget> {

  static const menuItems = <String>[
    'хочу',
    'могу'
  ];

  final List<DropdownMenuItem<String>> _dropdownMenuItem = menuItems
      .map((String value) =>
      DropdownMenuItem<String>(
        value: value,
        child: Text(value,
          style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white,
          fontSize: 25,)),
      ),
  ).toList();

  String _btnSelected;

  @override
  Widget build(BuildContext context) {
    return  ListTile(
          title: Text("Я",
            style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 25,),
            ),
          trailing: DropdownButton(
              dropdownColor: Colors.red,
              items: _dropdownMenuItem,
              value: _btnSelected,
              hint: Text("выбери", style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 25,)),
              onChanged: (String newValue) {
                setState(() {

                  _btnSelected = newValue;

                  if( _btnSelected  ==  menuItems[1] ){

                    Navigator.pushNamed(context, '/cab');

                  } if (_btnSelected == menuItems[0] )  {

                    Navigator.pushNamed(context, '/tag');

                  }

                });

              }),
    );
  }
}