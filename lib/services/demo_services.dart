import 'dart:convert';

import 'package:api/model/demo_model.dart';
import 'package:api/model/job_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SwaggerDemo {
  Future<List<DemoPost>> getDetails() async {
    // List<DemoPost> details = [];
    String url =
        'https://virtserver.swaggerhub.com/bhai/details/1.0.0/inventory';
    var res = await http.get(Uri.parse(url));
    final details = demoPostFromJson(res.body).toList();

    return details;
  }

  Future<http.Response> makePost() async {
    String url =
        'https://virtserver.swaggerhub.com/bhai/details/1.0.0/inventory';
    Map<String, String> header = {
      'Content-Type': 'application/json; charset=UTF-8'
    };
    String postBody = json.encode({
      'id': '21',
      'name': 'Rutvik',
      "manufacturer": "BMC Corporation",
      "releaseDate": "2016-08-29T09:12:33.001+0000",
    });

    http.Response response =
        await http.post(Uri.parse(url), headers: header, body: postBody);
    print(response.toString());
    return response;
  }

  Future<DemoPost> getData() async {
    var dio = Dio();
    var responce = await dio
        .get('https://virtserver.swaggerhub.com/bhai/details/1.0.0/inventory');
    var data = DemoPost.fromJson(responce.data[0]);
    print(data.toString());
    return data;
  }

  Future<NameJob> addJob(String name, job) async {
    String url = 'https://reqres.in/api/users';

    var resp =
        await http.post(Uri.parse(url), body: {"name": name, "job": job});

      print(resp.body);
      return NameJob.fromJson(json.decode(resp.body));


  }

  Future<NameJob> getDataJob() async {
    String url = 'https://reqres.in/api/users';

    var res = await http.get(Uri.parse(url));
    final details = NameJob.fromJson(json.decode(res.body));
    print(details);
    return details;
  }

}
