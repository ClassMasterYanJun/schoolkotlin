import 'package:flutterapp/app/Widget/databaseConnector.dart';
import 'package:flutterapp/app/Widget/cards/cardData.dart';



void saveInData(var nameMaters, var date, var workTime, var time, var street, var examples, var nameService, var avatar, var tag){


    var cardData = CardData(
      date.toString(),
      workTime.toString(),
      time.toString(),
      street.toString(),
      nameMaters.toString(),
      examples.toString(),
      nameService.toString(),
      avatar, tag
    ) ;

    if(nameMaters != null){

      DatabaseConnector().saveCard(cardData);

    }

}