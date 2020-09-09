import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';
class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime> locations = [
    WorldTime(url:'Asia/Kolkata',location:'India',flag: 'India.png'),
    WorldTime(url:'Europe/London',location:'London',flag: 'India.png'),
    WorldTime(url:'Europe/Berlin',location:'Athens',flag: 'India.png'),
    WorldTime(url:'Africa/Cairo',location:'Cairo',flag: 'India.png'),
    WorldTime(url:'Africa/Nairobi',location:'Nairobi',flag: 'India.png'),
    WorldTime(url:'America/Chicago',location:'Chicago',flag: 'India.png'),
    WorldTime(url:'America/New_York',location:'New York',flag: 'India.png'),
    WorldTime(url:'Asia/Jakarta',location:'Jakarta',flag: 'India.png'),
  ];
  void updateTime(index) async{
    WorldTime instance = locations[index];
    await instance.getData();
    Navigator.pop(context,{
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDaytime': instance.isDayTime,
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Choose a Location'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context,index){
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 0.5,horizontal: 4.0),
            child: Card(
              child: ListTile(
                onTap: (){
                  updateTime(index);
                },
                title: Text(locations[index].location),
              ),
            ),
          );
        },
      ),
    );
  }
}
