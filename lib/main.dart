import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WeatherUiScreen(),
    );
  }
}

class WeatherUiScreen extends StatefulWidget {
  const WeatherUiScreen({super.key});

  @override
  State<WeatherUiScreen> createState() => _WeatherUiScreenState();
}

class _WeatherUiScreenState extends State<WeatherUiScreen> {

  String temperature= "Temperature:";
  String city = "City:";
  String feelsLike = "fellsLike:";
  String windSpeed ="WindSpeed:";
  String humidity = "humidity:";
  String visibility = "visibility:";
  String pressure = 'pressure';
  String icon = "icon:";

  TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Weather App"),centerTitle: true,),
      body: Padding(padding: EdgeInsets.all(10),child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: nameController,
              decoration: InputDecoration(
              border: OutlineInputBorder(
              ),
              hintText: "name"
      ),),
      ElevatedButton(onPressed: (){}, child: Text("Get data")),
            SizedBox(height: 10,),
            Text(temperature,style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
            Text(city,style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
            Text(feelsLike,style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
            Text(windSpeed,style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
            Text(humidity,style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
            Text(visibility,style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
            Text(icon,style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
            Text(pressure,style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
        ],
      ),),

    );
  }
}

