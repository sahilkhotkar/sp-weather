class WeaherModel {
  WeaherModel({
    required this.coord,
    required this.weather,
    required this.base,
    required this.main,
    required this.visibility,
    required this.wind,
    required this.clouds,
    required this.dt,
    required this.sys,
    required this.timezone,
    required this.id,
    required this.name,
    required this.cod,
  });

  final Coord? coord;
  final List<Weather> weather;
  final String? base;
  final Main? main;
  final int? visibility;
  final Wind? wind;
  final Clouds? clouds;
  final int? dt;
  final Sys? sys;
  final int? timezone;
  final int? id;
  final String? name;
  final int? cod;

  WeaherModel copyWith({
    Coord? coord,
    List<Weather>? weather,
    String? base,
    Main? main,
    int? visibility,
    Wind? wind,
    Clouds? clouds,
    int? dt,
    Sys? sys,
    int? timezone,
    int? id,
    String? name,
    int? cod,
  }) {
    return WeaherModel(
      coord: coord ?? this.coord,
      weather: weather ?? this.weather,
      base: base ?? this.base,
      main: main ?? this.main,
      visibility: visibility ?? this.visibility,
      wind: wind ?? this.wind,
      clouds: clouds ?? this.clouds,
      dt: dt ?? this.dt,
      sys: sys ?? this.sys,
      timezone: timezone ?? this.timezone,
      id: id ?? this.id,
      name: name ?? this.name,
      cod: cod ?? this.cod,
    );
  }

  factory WeaherModel.fromJson(Map<String, dynamic> json) {
    return WeaherModel(
      coord: json["coord"] == null ? null : Coord.fromJson(json["coord"]),
      weather: json["weather"] == null
          ? []
          : List<Weather>.from(
              json["weather"]!.map((x) => Weather.fromJson(x))),
      base: json["base"],
      main: json["main"] == null ? null : Main.fromJson(json["main"]),
      visibility: json["visibility"],
      wind: json["wind"] == null ? null : Wind.fromJson(json["wind"]),
      clouds: json["clouds"] == null ? null : Clouds.fromJson(json["clouds"]),
      dt: json["dt"],
      sys: json["sys"] == null ? null : Sys.fromJson(json["sys"]),
      timezone: json["timezone"],
      id: json["id"],
      name: json["name"],
      cod: json["cod"],
    );
  }

  Map<String, dynamic> toJson() => {
        "coord": coord?.toJson(),
        "weather": weather.map((x) => x?.toJson()).toList(),
        "base": base,
        "main": main?.toJson(),
        "visibility": visibility,
        "wind": wind?.toJson(),
        "clouds": clouds?.toJson(),
        "dt": dt,
        "sys": sys?.toJson(),
        "timezone": timezone,
        "id": id,
        "name": name,
        "cod": cod,
      };

  @override
  String toString() {
    return "WeaherModel(coord: $coord, weather: $weather, base: $base, main: $main, visibility: $visibility, wind: $wind, clouds: $clouds, dt: $dt, sys: $sys, timezone: $timezone, id: $id, name: $name, cod: $cod)";
  }
}

class Clouds {
  Clouds({
    required this.all,
  });

  final int? all;

  Clouds copyWith({
    int? all,
  }) {
    return Clouds(
      all: all ?? this.all,
    );
  }

  factory Clouds.fromJson(Map<String, dynamic> json) {
    return Clouds(
      all: json["all"],
    );
  }

  Map<String, dynamic> toJson() => {
        "all": all,
      };

  @override
  String toString() {
    return "Clouds(all: $all)";
  }
}

class Coord {
  Coord({
    required this.lon,
    required this.lat,
  });

  final double? lon;
  final double? lat;

  Coord copyWith({
    double? lon,
    double? lat,
  }) {
    return Coord(
      lon: lon ?? this.lon,
      lat: lat ?? this.lat,
    );
  }

  factory Coord.fromJson(Map<String, dynamic> json) {
    return Coord(
      lon: json["lon"],
      lat: json["lat"],
    );
  }

  Map<String, dynamic> toJson() => {
        "lon": lon,
        "lat": lat,
      };

  @override
  String toString() {
    return "Coord(lon: $lon, lat: $lat)";
  }
}

class Main {
  Main({
    required this.temp,
    required this.feelsLike,
    required this.tempMin,
    required this.tempMax,
    required this.pressure,
    required this.humidity,
    required this.seaLevel,
    required this.grndLevel,
  });

  final double? temp;
  final double? feelsLike;
  final double? tempMin;
  final double? tempMax;
  final int? pressure;
  final int? humidity;
  final int? seaLevel;
  final int? grndLevel;

  Main copyWith({
    double? temp,
    double? feelsLike,
    double? tempMin,
    double? tempMax,
    int? pressure,
    int? humidity,
    int? seaLevel,
    int? grndLevel,
  }) {
    return Main(
      temp: temp ?? this.temp,
      feelsLike: feelsLike ?? this.feelsLike,
      tempMin: tempMin ?? this.tempMin,
      tempMax: tempMax ?? this.tempMax,
      pressure: pressure ?? this.pressure,
      humidity: humidity ?? this.humidity,
      seaLevel: seaLevel ?? this.seaLevel,
      grndLevel: grndLevel ?? this.grndLevel,
    );
  }

  factory Main.fromJson(Map<String, dynamic> json) {
    return Main(
      temp: json["temp"]?.toDouble(),
      feelsLike: json["feels_like"]?.toDouble(),
      tempMin: json["temp_min"]?.toDouble(),
      tempMax: json["temp_max"]?.toDouble(),
      pressure: json["pressure"],
      humidity: json["humidity"],
      seaLevel: json["sea_level"],
      grndLevel: json["grnd_level"],
    );
  }

  Map<String, dynamic> toJson() => {
        "temp": temp,
        "feels_like": feelsLike,
        "temp_min": tempMin,
        "temp_max": tempMax,
        "pressure": pressure,
        "humidity": humidity,
        "sea_level": seaLevel,
        "grnd_level": grndLevel,
      };

  @override
  String toString() {
    return "Main(temp: $temp, feelsLike: $feelsLike, tempMin: $tempMin, tempMax: $tempMax, pressure: $pressure, humidity: $humidity, seaLevel: $seaLevel, grndLevel: $grndLevel)";
  }
}

class Sys {
  Sys({
    required this.type,
    required this.id,
    required this.country,
    required this.sunrise,
    required this.sunset,
  });

  final int? type;
  final int? id;
  final String? country;
  final int? sunrise;
  final int? sunset;

  Sys copyWith({
    int? type,
    int? id,
    String? country,
    int? sunrise,
    int? sunset,
  }) {
    return Sys(
      type: type ?? this.type,
      id: id ?? this.id,
      country: country ?? this.country,
      sunrise: sunrise ?? this.sunrise,
      sunset: sunset ?? this.sunset,
    );
  }

  factory Sys.fromJson(Map<String, dynamic> json) {
    return Sys(
      type: json["type"],
      id: json["id"],
      country: json["country"],
      sunrise: json["sunrise"],
      sunset: json["sunset"],
    );
  }

  Map<String, dynamic> toJson() => {
        "type": type,
        "id": id,
        "country": country,
        "sunrise": sunrise,
        "sunset": sunset,
      };

  @override
  String toString() {
    return "Sys(type: $type, id: $id, country: $country, sunrise: $sunrise, sunset: $sunset)";
  }
}

class Weather {
  Weather({
    required this.id,
    required this.main,
    required this.description,
    required this.icon,
  });

  final int? id;
  final String? main;
  final String? description;
  final String? icon;

  Weather copyWith({
    int? id,
    String? main,
    String? description,
    String? icon,
  }) {
    return Weather(
      id: id ?? this.id,
      main: main ?? this.main,
      description: description ?? this.description,
      icon: icon ?? this.icon,
    );
  }

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      id: json["id"],
      main: json["main"],
      description: json["description"],
      icon: json["icon"],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "main": main,
        "description": description,
        "icon": icon,
      };

  @override
  String toString() {
    return "Weather(id: $id, main: $main, description: $description, icon: $icon)";
  }
}

class Wind {
  Wind({
    required this.speed,
    required this.deg,
  });

  final double? speed; // Changed from int? to double?
  final int? deg;

  Wind copyWith({
    double? speed,
    int? deg,
  }) {
    return Wind(
      speed: speed ?? this.speed,
      deg: deg ?? this.deg,
    );
  }

  factory Wind.fromJson(Map<String, dynamic> json) {
    return Wind(
      speed: (json["speed"] as num?)?.toDouble(), // Convert to double
      deg: json["deg"],
    );
  }

  Map<String, dynamic> toJson() => {
        "speed": speed,
        "deg": deg,
      };

  @override
  String toString() {
    return "Wind(speed: $speed, deg: $deg)";
  }
}
