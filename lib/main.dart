import 'dart:io';

import 'package:api/services/weather_services.dart';
import 'package:api/ui/json__screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();
  runApp( const MyApp());

}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

class MyApp extends StatefulWidget {
   const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late bool lightState = false;
    MyHomePage myHomePage = MyHomePage(title: 'Home',);
 

  @override
  void initState() {
    super.initState();
    lightState=  _MyHomePageState().Light;
  }
  final ThemeData _darkTheme = ThemeData(
    appBarTheme: AppBarTheme(color: Colors.white),
    brightness: Brightness.dark,
    primaryColor: Colors.amber,
    backgroundColor: Colors.white,
  );

  final ThemeData _lightTheme = ThemeData(
      visualDensity: VisualDensity.adaptivePlatformDensity,
      brightness: Brightness.light,
      primaryColor: Colors.blue
  );

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme:  _lightTheme ,
      darkTheme: _darkTheme,
      home:   MyHomePage(title: 'Flutter Demo Home Page', ),
    );
  }
}

class MyHomePage extends StatefulWidget {
   const MyHomePage({Key? key, required this.title,}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
   bool Light  = true ;

  @override
  void initState() {
    WeatherAPI().getWeatherReport();
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: CupertinoSwitch(
        value: Light ,onChanged: (light){
          setState(() {
            Light = light;
            print(Light);
          });
      },
      ),),
      body: JsonScreen(),
    );
  }
}
