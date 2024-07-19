import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spiderweb/view-model/weather_vm.dart';
import 'package:spiderweb/views/WeatherScreen.dart';

void main() {
  runApp(MultiProvider(
    providers: [ChangeNotifierProvider(create: (_) => WeatherViewModel())],
    child: const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WeatherScreen(),
    ),
  ));
}
