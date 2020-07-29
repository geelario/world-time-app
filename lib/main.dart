import 'package:flutter/material.dart';
import 'package:myfirstapp/pages/choose_location.dart';
import 'package:myfirstapp/pages/home.dart';
import 'package:myfirstapp/pages/loading.dart';




// MaterialApp help us to use google material design inside our widget
void main() => runApp(MaterialApp(
// scaffold widget us to implement a basic layout for our app
     // home: Home(),
      initialRoute: '/',
       routes: {
        '/' : (context) => Loading(),
         '/home': (context) => Home(),
          '/location': (context) => ChooseLocation(),
      },
    ));

