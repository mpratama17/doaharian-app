import 'dart:convert';

import 'package:http/http.dart' as http;

import 'model/model_jadwal_sholat.dart';

class RepositorySholat {
  final _baseUrl = "https://api.myquran.com/v1/sholat/jadwal/1634/2023/05/12";

  //create function to get data from that api
  Future getDataSholats() async {
    try {
      final response = await http.get(Uri.parse(_baseUrl));

      if (response.statusCode == 200) {
        // print(response.body);
        Iterable it = jsonDecode(response.body);
        List<Sholat> sholat = it.map((e) => Sholat.fromJson(e)).toList();
        //
        print(response.body);
        return sholat;
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
