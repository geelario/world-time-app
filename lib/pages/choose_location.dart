import 'package:flutter/material.dart';
import 'package:myfirstapp/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

void updateTime(index) async {
    WorldTime instance = locations[index];
    await instance.getTime();
    Navigator.pop(context, {
      'location': instance.location,
      'time': instance.time,
      'flag': instance.flag,
      'isDayTime': instance.isDayTime,
    });
  }

  @override
  void initState() {
    super.initState();
  }


  List<WorldTime> locations = [
     WorldTime(url: 'Africa/Nigeria', location:'Lagos', flag: 'nigeria.png', ),
     WorldTime( url: 'Africa/Accra', location:'Accra', flag: 'ghana.png',),
     WorldTime(url: 'Africa/Cairo', location:'Cairo', flag: 'egypt.png', ),
     WorldTime(url: 'Africa/Johannesburg',location:'Johannesburg', flag: 'southafrica.png', ),
     WorldTime(url: 'America/New_York',location:'New York', flag: 'usa.png', ),
     WorldTime( url: 'Asia/Dubai',location:'Dubai', flag: 'dubia.png',),
     WorldTime(url: 'Asia/Qatar',location:'Qatar', flag: 'qatar.png', ),
     WorldTime(url: 'Asia/Tokyo',location:'Tokyo', flag: 'japan.png', ),
     WorldTime(url: 'Australia/Sydney',location:'Sydney', flag: 'australia.png', ),
     WorldTime(url: 'Europe/Amsterdam', location:'Amsterdam', flag: 'holland.png', ),
     WorldTime(url: 'Europe/London',location:'London', flag: 'uk.png', ),
     WorldTime(url: 'Europe/Paris',location:'Paris', flag: 'france.png', ),
     WorldTime(url: 'Europe/Moscow',location:'Moscow', flag: 'russia.png', ),
     WorldTime( url: 'Europe/Madrid',location:'Madrid', flag: 'spain.png',),
    WorldTime( url:'Europe/Rome',location:'Rome', flag: 'italy.png', ),

  ];

  


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Choose Location'),
        centerTitle: true,
        backgroundColor: Colors.blue[900],
        elevation: 0,
      ),
       body: ListView.builder(
         itemCount: locations.length,
         itemBuilder: (context, index){
           return Padding(
             padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
             child: Card(
               child: ListTile(
                 onTap: (){
                   updateTime(index);
                 },
                 title: Text(locations[index].location, style: TextStyle(fontWeight: FontWeight.w600),
                 ),
                 leading: CircleAvatar(
                   backgroundImage: AssetImage('assets/images/${locations[index].flag}'),
                 ),
                 )
             ),
           );
         },
         )
    );
  }
}