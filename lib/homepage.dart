import 'package:flutter/material.dart';
import 'ApiSurvices.dart';
import 'weatherModel.dart';
import 'ApiCollections.dart';
import 'hourly_weather_listitem.dart';


class HomePage extends StatefulWidget {

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ApiSurvices apiService = ApiSurvices();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("Flutter Weather App"),
      ),

      body: SafeArea(
        child: FutureBuilder(
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              WeatherModel? weatherModel = snapshot.data;
              return Column(
                  children: [
                    //TodaysWeather(weatherModel: weatherModel),

                    SizedBox(height: 10,),
                    const Text(
                      "Weather By Hours",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 150,
                      child: ListView.builder(

                        itemBuilder: (context, index) {
                          Hour? hour = weatherModel
                              ?.forecast?.forecastday?[0].hour?[index];

                          return HourlyWeatherListItem(
                            hour: hour,
                          );
                         },
                        itemCount: weatherModel
                            ?.forecast?.forecastday?[0].hour?.length ??
                            0,
                        scrollDirection: Axis.horizontal,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "The provided base on your ip",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                      ),
                    ),

                  ],
              );
            }

            if (snapshot.hasError) {
              return const Center(
                child: Text("Error Has occcured"),
              );
            }

            return const Center(
              child: CircularProgressIndicator(),
            );
          },
          future: apiService.getWeatherData("$basr_url&q=auto:ip&days=7"),
        ),
      ),
    );
  }
}


