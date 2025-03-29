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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Weather App"),centerTitle: true,),
      body: Padding(padding: EdgeInsets.all(10),child: Column(
          children: [
            TextFormField(decoration: InputDecoration(
      ),),
    ElevatedButton(onPressed: (){}, child: Text("Get data"))
        ],
      ),),

    );
  }
}

