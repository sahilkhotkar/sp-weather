import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';
import 'package:provider/provider.dart';
import 'package:spiderweb/helpers/kelvin_converter.dart';
import 'package:spiderweb/view-model/weather_vm.dart';
import 'package:spiderweb/widgets/SmallInfo.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  bool _isSearching = false;
  final TextEditingController _controller = TextEditingController();
  @override
  void initState() {
    Provider.of<WeatherViewModel>(context, listen: false)
        .getWeatherResponse("Thane");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    WeatherViewModel weather = Provider.of<WeatherViewModel>(context);

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromRGBO(0, 92, 151, 1), // White color
              Color.fromRGBO(54, 55, 149, 1), // Orange color
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
            child: weather.isLoading
                ? const CircularProgressIndicator()
                : weather.weatherModel.isNotEmpty
                    ? SingleChildScrollView(
                        child: Container(
                          height: MediaQuery.of(context).size.height,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                children: [
                                  const Padding(
                                    padding:
                                        EdgeInsets.only(bottom: 8.0, top: 16),
                                    child: Icon(
                                      Ionicons.location,
                                      size: 30,
                                      color: Color.fromRGBO(255, 178, 0, 1),
                                    ),
                                  ),
                                  Text(
                                    weather.weatherModel[0].name.toString(),
                                    style: GoogleFonts.cabin(
                                        fontSize: 37,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "${KelvinConverter().kelvinToCelcius(weather.weatherModel[0].main?.temp).toString().substring(0, 2)}",
                                        style: GoogleFonts.cabin(
                                            fontSize: 161,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      ),
                                      Text(
                                        "\u00B0C",
                                        style: GoogleFonts.cabin(
                                            fontSize: 45,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      ),
                                    ],
                                  ),
                                  CachedNetworkImage(
                                    fadeInDuration:
                                        const Duration(microseconds: 1),
                                    fadeOutDuration:
                                        const Duration(microseconds: 1),
                                    color: Colors.white,
                                    imageUrl:
                                        "https://openweathermap.org/img/wn/${weather.weatherModel[0].weather[0].icon}.png",
                                    fit: BoxFit.cover,
                                    placeholder: (context, url) => const Center(
                                      child: Padding(
                                        padding: EdgeInsets.only(bottom: 8.0),
                                        child: FittedBox(
                                          child: CircularProgressIndicator(
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                    errorWidget: (context, url, error) =>
                                        new Icon(Icons.error),
                                  ),
                                  Text(
                                    weather.weatherModel[0].weather[0].main
                                        .toString(),
                                    style: GoogleFonts.cabin(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                ],
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 32),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    SmallInfo(
                                      celcius: false,
                                      infoName: "Wind",
                                      value:
                                          "${weather.weatherModel[0].wind?.speed?.toStringAsFixed(1)} m/s, ${weather.weatherModel[0].wind?.deg}°",
                                    ),
                                    SmallInfo(
                                      infoName: "Feels like",
                                      value:
                                          "${KelvinConverter().kelvinToCelcius(weather.weatherModel[0].main?.feelsLike).toString().substring(0, 4)}",
                                      celcius: true,
                                    ),
                                    SmallInfo(
                                      infoName: "Min",
                                      value:
                                          "${KelvinConverter().kelvinToCelcius(weather.weatherModel[0].main?.tempMin).toString().substring(0, 4)}",
                                      celcius: true,
                                    ),
                                    SmallInfo(
                                      infoName: "Max",
                                      value:
                                          "${KelvinConverter().kelvinToCelcius(weather.weatherModel[0].main?.tempMax).toString().substring(0, 4)}",
                                      celcius: true,
                                    )
                                  ],
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    'assets/wind.png',
                                    color: Colors.white,
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                      "${weather.weatherModel[0].wind?.speed?.toStringAsFixed(1)} m/s}, ${weather.weatherModel[0].wind?.deg}°",
                                      style: GoogleFonts.cabin(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white))
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  right: 16.0,
                                  bottom: 8,
                                  top: 32,
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    AnimatedContainer(
                                      alignment: Alignment.centerRight,
                                      duration: Duration(milliseconds: 300),
                                      width: _isSearching
                                          ? MediaQuery.of(context).size.width *
                                              0.8
                                          : 48.0,
                                      // height: 48.0,
                                      decoration: BoxDecoration(
                                        color: Colors.grey[200],
                                        borderRadius:
                                            BorderRadius.circular(24.0),
                                      ),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: _isSearching
                                                ? TextField(
                                                    cursorColor: Colors.black,
                                                    controller: _controller,
                                                    decoration: InputDecoration(
                                                      hintText: 'Search...',
                                                      hintStyle:
                                                          GoogleFonts.cabin(
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color:
                                                                  Colors.black),
                                                      border: InputBorder.none,
                                                      contentPadding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 16.0),
                                                    ),
                                                    onSubmitted: (value) async {
                                                      setState(() {
                                                        _isSearching = false;
                                                      });
                                                      await weather
                                                          .getWeatherResponse(
                                                              value.toString());
                                                    },
                                                  )
                                                : Container(),
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                _isSearching = !_isSearching;
                                                if (!_isSearching) {
                                                  _controller.clear();
                                                }
                                              });
                                            },
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Icon(
                                                _isSearching
                                                    ? Icons.close
                                                    : Icons.search,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    : const CircularProgressIndicator()),
      ),
    );
  }
}
