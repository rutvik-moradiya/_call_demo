import 'dart:convert';

import 'package:api/model/weather_model.dart';
import 'package:http/http.dart' as http;
class WeatherAPI{
  String apikey ='f62aab7f0bbdee4bf9525cec7595f4e2';

  Future<Weather> getWeatherReport()async{
    String url = 'https://api.openweathermap.org/data/2.5/forecast?id=524901&appid=${apikey}';
    var responce = await http.get(Uri.parse(url));

 var data =  Weather.fromJson(json.decode(responce.body));
    return data;
  }
}