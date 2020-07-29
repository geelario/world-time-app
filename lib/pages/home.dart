import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
 // @override
 // void initState() {
 //   super.initState();
//  }

  Map data = {};

  @override
  Widget build(BuildContext context) {
     if (data.isNotEmpty) {
       data = data;
     } else {
       data = ModalRoute.of(context).settings.arguments;
     }
     print(data);
 
    String bgImg = data['isDayTime'] ? 'day.jpg' : 'night2.jpeg';
    Color bgColor = data['isDayTime'] ?  Colors.blue : Colors.indigo[900];

    return Scaffold(
     backgroundColor: bgColor,
      body: SafeArea(
         
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/$bgImg'),
                fit: BoxFit.cover,
                )
            ),
            child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
        child: Column(
            children: <Widget>[
              FlatButton.icon(
                 onPressed: () async {
                    dynamic result = await Navigator.pushNamed(context, '/location');
                    if(result != null){
                      setState(() {
                        data = {
                          'time': result['time'],
                          'location': result['location'],
                          'isDaytime': result['isDaytime'],
                          'flag': result['flag']
                        };
                      });
                    }
                  },
                icon: Icon(Icons.edit_location, color: Colors.white,),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: BorderSide(color: Colors.white)),
                label: Text('Choose Timezone',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    )),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    data['location'],
                    style: TextStyle(
                      fontSize: 26.0,
                      letterSpacing: 2,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Text(data['time'],
                  style: TextStyle(
                    fontSize: 50.0,
                    letterSpacing: 2,
                    color: Colors.white, 
                  ))
            ],
        ),
      ),
          )),
    );
  }
}
