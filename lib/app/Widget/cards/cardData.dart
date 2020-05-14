

import 'package:firebase_database/firebase_database.dart';

class CardData{

    String date;
    String workTime;
    String time;
    String street;
    String nameMasters;
    String nameService;
    String examples;
    String tag;
    dynamic avatar;

    CardData( this.date, this.workTime, this.time,
    this.street,    this.nameMasters,   this.nameService, this.examples, this.avatar, this.tag);

    CardData.fromSnapshot(DataSnapshot snapshot):
            date = snapshot.value["date"],
            workTime = snapshot.value["workTime"],
            time = snapshot.value["time"],
            street = snapshot.value["street"],
            nameMasters = snapshot.value["nameMasters"],
            nameService = snapshot.value["nameService"],
            examples = snapshot.value["examples"],
            avatar = snapshot.value["avatar"],
            tag = snapshot.value["tag"];
        toJson(){
            return {

            "date": date,
            "workTime": workTime ,
            "time": time,
            "street": street,
            "nameMasters": nameMasters,
            "nameService": nameService,
            "examples": examples,
            "avatar": avatar,
            "tag": tag,


            };
        }


}
