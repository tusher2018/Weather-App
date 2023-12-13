import 'dart:convert';

import 'package:http/http.dart';
import 'package:weather_app/ApiCollections.dart';
import 'weatherModel.dart';

class ApiSurvices{

  Future<WeatherModel> getWeatherData(String searchText) async{
    String url="$basr_url&q=$searchText&days=7";

    Response response = await get(Uri.parse(url));

    try{
    if(response.statusCode == 200){
      Map<String, dynamic> json = jsonDecode(response.body);
      WeatherModel weatherModel = WeatherModel.fromJson(json);
      return weatherModel;
    }else {
      throw ("No data found");
    }
  } catch (e) {
  throw e.toString();
  }

  }

}