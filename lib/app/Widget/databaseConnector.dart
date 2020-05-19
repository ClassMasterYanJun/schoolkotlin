
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutterapp/app/Widget/cabinet/Calendar.dart';


import 'dart:async';
import 'dart:io';

import 'package:flutterapp/app/Widget/cards/cardData.dart';


class DatabaseConnector {

  final cardRef =  FirebaseDatabase.instance.reference() ;
  final db = FirebaseDatabase.instance;

  CardData cardData;
  Calendar calendar;

  Future databaseConnector() async {

    db.setPersistenceEnabled(true);
    db.setPersistenceCacheSizeBytes(10000000);

    final FirebaseApp app = await FirebaseApp.configure(
      name: 'flutter-11e85',
      options: Platform.isIOS
          ? const FirebaseOptions(
        googleAppID: '1:297855924061:ios:c6de2b69b03a5be8',
        gcmSenderID: '297855924061',
        databaseURL: 'https://flutterfire-cd2f7.firebaseio.com',
      )
          : const FirebaseOptions(
        googleAppID: '1:516317428989:android:3e719080362997f61a5294',
        apiKey: 'hBdlCXkIy4gdsVF9cmhlxzTxd1Q2',
        databaseURL: 'https://flutter-11e85.firebaseio.com/',
      ),
    );
    return app;
  }

  void saveCard(cardData){

    this.cardRef.reference().child("Cards").set(cardData.toJson());

  }
  void saveCalendar(calendar){

    this.cardRef.reference().child("Calendars").set(calendar.toJson());

  }

  readCard() async{

   Map<dynamic, dynamic> values;
   List<dynamic> data = [];

   this.cardRef.once().then(
            (DataSnapshot snapshot){

          values = snapshot.value;
          values.forEach((key,values) {



            data.add(values);
           }
        );

          return data;

            }

   );



   }

}