import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String location;
  String time;
  String flag;
  String url;
  bool isDayTime;

  WorldTime({this.location,this.flag,this.url});
  Future<void> getData() async {
    try {
      Response response = await get(
          'http://worldtimeapi.org/api/timezone/$url');
      Map data = jsonDecode(response.body);
      // print(data);
      String datetime = data['datetime'];
      String offsetHour = data['utc_offset'].substring(1, 3);
      String offsetMinutes = data['utc_offset'].substring(4, 6);
//      print(datetime);
//      print(offsetHour);
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offsetHour)));
      now = now.add(Duration(minutes: int.parse(offsetMinutes)));
//      time = now.toString();
      isDayTime = (now.hour>=6&&now.hour<=18)? true:false;
      time = DateFormat.jm().format(now);
    }
    catch(e){
      print('caught error: $e');
      time = 'Could not get the time data';
      isDayTime = false;
    }
  }
}