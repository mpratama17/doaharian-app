import 'dart:convert';

import 'package:http/http.dart' as http;

import 'model/model.dart';

class Repository {
  final _baseUrl = "https://doa-doa-api-ahmadramadhan.fly.dev/api";

  //create function to get data from that api
  Future getData() async {
    try {
      final response = await http.get(Uri.parse(_baseUrl));

      if (response.statusCode == 200) {
        // print(response.body);
        Iterable it = jsonDecode(response.body);
        List<Doa> doaa = it.map((e) => Doa.fromJson(e)).toList();
        //
        return doaa;
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
