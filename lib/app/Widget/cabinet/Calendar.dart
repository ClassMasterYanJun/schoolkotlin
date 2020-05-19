import 'package:firebase_database/firebase_database.dart';

class Calendar{

  String masterCode;
  String date;
  Map time;


  Calendar(this.masterCode, this.time, this.date );

  Calendar.fromSnapshot(DataSnapshot snapshot):

        masterCode = snapshot.value["masterCode"].toString(),
        date = snapshot.value["date"].toString(),
        time = snapshot.value["time"];


    toJson(){
      return {


        "masterCode" : masterCode.toString(),
          "date" : date.toString(),
          "time" : time

      };
    }

    decode(workDate){

      List time;
      workDate.values.forEach((v){
        time = v;
      });

      return time;
    }


}

