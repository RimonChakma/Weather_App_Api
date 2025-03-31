import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WeatherUiScreen(),
    );
  }
}

class WeatherUiScreen extends StatefulWidget {
  @override
  State<WeatherUiScreen> createState() => _WeatherUiScreenState();
}

class _WeatherUiScreenState extends State<WeatherUiScreen> {
  String temperature = "Temperature:";
  String city = "City:";
  String feelsLike = "Feels Like:";
  String windSpeed = "Wind Speed:";
  String humidity = "Humidity:";
  String visibility = "Visibility:";
  String pressure = "Pressure:";
  String icon = "Icon:";

  String apiKey = "4e35f9634fc34c03a39153344251102";

  TextEditingController nameController = TextEditingController();

  Future<void> fetchData(String cityName) async {
    final url = Uri.parse("http://api.weatherapi.com/v1/current.json?key=$apiKey&q=$cityName");

    try {
      final response = await http.get(url, headers: {"accept": "application/json"});

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        setState(() {
          city = "City: ${data["location"]["name"]}";
          temperature = "Temperature: ${data["current"]["temp_c"]}°C";
          feelsLike = "Feels Like: ${data["current"]["feelslike_c"]}°C";
          windSpeed = "Wind Speed: ${data["current"]["wind_kph"]} km/h";
          humidity = "Humidity: ${data["current"]["humidity"]}%";
          visibility = "Visibility: ${data["current"]["vis_km"]} km";
          pressure = "Pressure: ${data["current"]["pressure_mb"]} mb";
        });
      } else {
        print("Error: Failed to fetch data, Status Code: ${response.statusCode}");
      }
    } catch (e) {
      print("Error: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Weather App"), centerTitle: true),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: nameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Enter City Name",
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                String cityName = nameController.text;
                if (cityName.isNotEmpty) {
                  fetchData(cityName);
                } else {
                  print("Enter a city name!");
                }
              },
              child: Text("Get Weather"),
            ),
            SizedBox(height: 10),
            Text(temperature, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Text(city, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Text(feelsLike, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Text(windSpeed, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Text(humidity, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Text(visibility, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Text(pressure, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
