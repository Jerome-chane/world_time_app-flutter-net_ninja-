import 'package:http/http.dart';
import 'dart:convert'; // used to convert data to json
import 'package:intl/intl.dart';

class WorldTime {
  String location;
  String time;
  String flag; // url to flag asset
  String url; // location url for api endpoint
  bool isDaytime;

  WorldTime({this.location, this.flag, this.url});


  Future<void> getTime() async { // important to use Future in front of the async function

    try {
    // make request
    Response response = await get('http://worldtimeapi.org/api/timezone/$url');
    Map data = jsonDecode(response.body);


    String dateTime = data['datetime'];
    String offset = data['utc_offset'].substring(1,3);
    // print(dateTime);

    // create DateTime Object
    DateTime now = DateTime.parse(dateTime); // convert date string to Data
    now =  now.add(Duration(hours: int.parse(offset)));
    
    // set the time property
    isDaytime = now.hour > 6 && now.hour < 20 ? true : false; // determine if it's day or night time
    time = DateFormat.jm().format(now);

    }
    catch(error){
      print(error);
      time = 'Could not get time data';
    }


  }


}

