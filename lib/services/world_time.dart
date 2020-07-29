import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'dart:convert';


class WorldTime{
  String location;
  String time;  // laction time
  String flag; // assetimage location icon
  String url; //location url for api endpoint
  bool isDayTime;
 

//Contructor in flutter much have same name with the class

 WorldTime({this.location, this.flag, this.url});

   
 Future<void> getTime() async{
    
    try {
       Response response = await get('http://worldtimeapi.org/api/timezone/$url');
       Map data = jsonDecode(response.body);
  //  print(data['datetime']);

    //get data
    String datetime = data['datetime'];
    String offset = data['utc_offset'].substring(1,3);

    //print(datetime);
    //print(offset);

    //create a datetime object

    DateTime now = DateTime.parse(datetime);
    now = now.add(Duration(hours:int.parse( offset)));

    isDayTime = now.hour > 6 && now.hour < 18 ? true : false;
    
    // storing now instance to a time variable
     time = DateFormat.jm().format(now);

    }
    catch(errors){
      //print('Sorry wrong  $errors');
      time = 'Could not find data';
      print(time);
    }

   
  }

}

// 
