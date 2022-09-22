import 'package:http/http.dart';
import 'package:shopify/class/model/models.dart';
import 'dart:convert';

class APICalls {
  final baseUrl = "https://nazzy-shopify-api.herokuapp.com/";

  Future<String> login(var apiUrl) async {
    try {
      Response response = await get(Uri.parse(baseUrl + apiUrl));
      return response.body;
    } catch (e) {
      print(e.toString());
      return e.toString();
    }
  }

  Future<List<dynamic>> getData(var apiUrl) async {
    try {
      final response = await get(Uri.parse(baseUrl + apiUrl));
      if (response.statusCode == 200) {
        // print(response.body);
        return json.decode(response.body);
      } else {
        print("error");
        return [];
      }
    } catch (e) {
      print(e.toString());
      return [];
    }
  }

  postData(var apiUrl, var body) async {
    var data;
    try {
      Response response = await post(Uri.parse(baseUrl + apiUrl), body: body);
      if (response.statusCode == 201) {
        data = response.body;
        print(data);
      }
      return data;
    } catch (e) {
      print(e.toString());
      return;
    }
  }

  updateData(var apiUrl, var body) async {
    var data;
    try {
      Response response = await put(Uri.parse(baseUrl + apiUrl), body: body);
      if (response.statusCode == 200) {
        data = response.body;
        print(data);
      }
      return data;
    } catch (e) {
      print(e.toString());
      return;
    }
  }

  deleteData(var apiUrl) async {
    var data;
    try {
      Response response = await delete(Uri.parse(baseUrl + apiUrl));
      if (response.statusCode == 204) {
        data = response.body;
        print(data);
      }
      return data;
    } catch (e) {
      print(e.toString());
      return;
    }
  }
}
