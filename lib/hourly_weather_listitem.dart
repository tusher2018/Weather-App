import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/weatherModel.dart';

class HourlyWeatherListItem extends StatelessWidget {
  final Hour? hour;

  const HourlyWeatherListItem({Key? key, this.hour})
      : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8,vertical: 8),//EdgeInsets.all(8),
      padding: EdgeInsets.symmetric(horizontal: 8,vertical: 8),//EdgeInsets.all(8),
      width: 85,
      decoration: BoxDecoration(
          color: Colors.white24, borderRadius: BorderRadius.circular(20)
      ),
      child: Column(
         mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
                //Text(hour?.tempC?.round().toString() ??"",
                 Text('${hour?.tempC?.round()}\u00B0' ?? "",
                 style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18)),

              // Text("o", style: TextStyle(color: Colors.white)),
            ],
          ),
          Container(
            height: 50,
            child: Image.network("https:${hour?.condition?.icon.toString()}"),
            decoration:BoxDecoration(shape: BoxShape.circle, color: Colors.teal),
          ),
            Text(
                DateFormat.j().format(DateTime.parse(hour?.time?.toString() ?? "")),
                style: TextStyle(color: Colors.white)
            ),
        ],
      ),
    );
  }
}