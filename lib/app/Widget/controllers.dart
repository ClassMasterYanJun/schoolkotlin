import 'package:flutterapp/app/Widget/databaseConnector.dart';
import 'package:flutterapp/app/Widget/cards/cardData.dart';



void saveInData(String nameMaters, String date, String workTime, String time, String street,String examples, String nameService, String avatar, var tag){


    var cardData = CardData(
      date.toString(),
      workTime.toString(),
      time.toString(),
      street.toString(),
      nameMaters.toString(),
      examples.toString(),
      nameService.toString(),
      avatar, tag.toString()
    ) ;

    if(nameMaters != null){

      DatabaseConnector().saveCard(cardData);

    }

}