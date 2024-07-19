import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spiderweb/view-model/weather_vm.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  @override
  Widget build(BuildContext context) {
    WeatherViewModel weather = Provider.of<WeatherViewModel>(context);
    return Scaffold(
      body: Center(
        child: weather.isLoading
            ? const CircularProgressIndicator()
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: () async {
                        await weather.getWeatherResponse("thane");
                      },
                      child: Text("Press")),
                  weather.weatherModel.isNotEmpty
                      ? Text(weather.weatherModel[0].weather[0].main ?? "")
                      : Text("No data available"),
                ],
              ),
      ),
    );
  }
}
