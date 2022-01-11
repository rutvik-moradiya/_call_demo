import 'dart:convert';

import 'package:api/model/states_model.dart';

import 'model/jsondata.dart';
import 'package:http/http.dart' as http;

import 'model/pincode_model.dart';

class MultiJson {
  List<JsonData> multiJson  = [];

  Future <void> getData()async{
    String url ='https://tools.learningcontainer.com/sample-json.json';

    var responce = await http.get(Uri.parse(url));
    var jsonData = jsonDecode(responce.body);

    JsonData jsondata = JsonData(
      firstName: jsonData['firstName'],
      lastName: jsonData['lastName'],
      gender: jsonData['gender'],
      age:  jsonData['age'] as int,
       address: Address.fromJson(jsonData['address']) ,
       phoneNumbers: jsonData['phoneNumbers'],

    );
    multiJson.add(jsondata);
  }
}

class StatesApi {
  List<StatesNames> stateList = [];
  
  Future<void> getStates()async{
    String urlState = 'https://cdn-api.co-vin.in/api/v2/admin/location/states';
    var resp = await http.get(Uri.parse(urlState));
    var stateJsonData = jsonDecode(resp.body);
    stateList = stateJsonData.map((model) => StatesNames.fromJson(model)).toList();
    // StatesName statesObject= StatesName(
    //   states : stateJsonData['states'],
    //   ttl : stateJsonData['ttl'] as int,
    //
    // );
    // stateList.add(statesObject);
  }
}
class PinApi{
  List<PincodeArea> areaList = [];

  Future<void> getArea()async{
    String urlState = 'https://api.postalpincode.in/pincode/380061';
    var resp = await http.get(Uri.parse(urlState));
    var stateJsonData = jsonDecode(resp.body);
    areaList = stateJsonData.map((model) => StatesNames.fromJson(model)).toList();
    // StatesName statesObject= StatesName(
    //   states : stateJsonData['states'],
    //   ttl : stateJsonData['ttl'] as int,
    //
    // );
    // stateList.add(statesObject);
  }
}
class API_Manager {
  Future<PincodeArea> getDetails() async {

    var PincodeArea;
    String url =
        'http://api.postalpincode.in/pincode/395001';

      var response = await http.get(Uri.parse(url));
      print(response.statusCode);

        var jsonString = response.body;
        var jsonMap = json.decode(jsonString);
        PincodeArea = PincodeArea.fromJson(jsonMap);



    return PincodeArea;
  }
}
