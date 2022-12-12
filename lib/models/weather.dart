import 'dart:convert';

import 'package:weather/constants/icon_weather.dart';
import 'package:weather/extensions/num_extension.dart';

Weather weatherFromJson(String str) => Weather.fromJson(json.decode(str));

String weatherToJson(Weather data) => json.encode(data.toJson());

class Weather {
  Weather({
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

  Coord coord;
  List<WeatherElement> weather;
  String base;
  Main main;
  int visibility;
  Wind wind;
  Clouds clouds;
  int dt;
  Sys sys;
  int timezone;
  int id;
  String name;
  int cod;

  factory Weather.fromJson(Map<String, dynamic> json) => Weather(
        coord: Coord.fromJson(json["coord"]),
        weather: List<WeatherElement>.from(
            json["weather"].map((x) => WeatherElement.fromJson(x))),
        base: json["base"],
        main: Main.fromJson(json["main"]),
        visibility: json["visibility"],
        wind: Wind.fromJson(json["wind"]),
        clouds: Clouds.fromJson(json["clouds"]),
        dt: json["dt"],
        sys: Sys.fromJson(json["sys"]),
        timezone: json["timezone"],
        id: json["id"],
        name: json["name"],
        cod: json["cod"],
      );

  Map<String, dynamic> toJson() => {
        "coord": coord.toJson(),
        "weather": List<dynamic>.from(weather.map((x) => x.toJson())),
        "base": base,
        "main": main.toJson(),
        "visibility": visibility,
        "wind": wind.toJson(),
        "clouds": clouds.toJson(),
        "dt": dt,
        "sys": sys.toJson(),
        "timezone": timezone,
        "id": id,
        "name": name,
        "cod": cod,
      };
}

class Clouds {
  Clouds({
    required this.all,
  });

  int all;

  factory Clouds.fromJson(Map<String, dynamic> json) => Clouds(
        all: json["all"],
      );

  Map<String, dynamic> toJson() => {
        "all": all,
      };
}

class Coord {
  Coord({
    required this.lon,
    required this.lat,
  });

  double lon;
  double lat;

  factory Coord.fromJson(Map<String, dynamic> json) => Coord(
        lon: json["lon"].toDouble(),
        lat: json["lat"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "lon": lon,
        "lat": lat,
      };
}

class Main {
  Main({
    required this.temp,
    required this.feelsLike,
    required this.tempMin,
    required this.tempMax,
    required this.pressure,
    required this.humidity,
  });

  double temp;
  double feelsLike;
  double tempMin;
  double tempMax;
  int pressure;
  int humidity;

  factory Main.fromJson(Map<String, dynamic> json) => Main(
        temp: json["temp"].toDouble(),
        feelsLike: json["feels_like"].toDouble(),
        tempMin: json["temp_min"].toDouble(),
        tempMax: json["temp_max"].toDouble(),
        pressure: json["pressure"],
        humidity: json["humidity"],
      );

  Map<String, dynamic> toJson() => {
        "temp": temp,
        "feels_like": feelsLike,
        "temp_min": tempMin,
        "temp_max": tempMax,
        "pressure": pressure,
        "humidity": humidity,
      };
}

class Sys {
  Sys({
    required this.country,
    required this.sunrise,
    required this.sunset,
  });

  String country;
  int sunrise;
  int sunset;

  factory Sys.fromJson(Map<String, dynamic> json) => Sys(
        country: json["country"],
        sunrise: json["sunrise"],
        sunset: json["sunset"],
      );

  Map<String, dynamic> toJson() => {
        "country": country,
        "sunrise": sunrise,
        "sunset": sunset,
      };
}

class WeatherElement {
  WeatherElement({
    required this.id,
    required this.main,
    required this.description,
    required this.icon,
  });

  int id;
  String main;
  String description;
  String icon;

  factory WeatherElement.fromJson(Map<String, dynamic> json) => WeatherElement(
        id: json["id"],
        main: json["main"],
        description: json["description"],
        icon: json["icon"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "main": main,
        "description": description,
        "icon": icon,
      };

  String getIcon() {
    switch (this.icon) {
      case '01d':
        return IconWeather.daySunny;
      case '01n':
        return IconWeather.nightClear;
      case '02d':
        return IconWeather.dayCloudy;
      case '02n':
        return IconWeather.nightCloudy;
      case '03d':
      case '03n':
        return IconWeather.cloud;
      case '04d':
      case '04n':
        return IconWeather.cloudy;
      case '09d':
        return IconWeather.dayShowers;
      case '09n':
        return IconWeather.nightAltShowers;
      case '10d':
        return IconWeather.dayRain;
      case '10n':
        return IconWeather.nightAltRain;
      case '11d':
        return IconWeather.dayLightning;
      case '11n':
        return IconWeather.nightLightning;
      case '13d':
      case '13n':
        return IconWeather.snowflakeCold;
      case '50d':
      case '50n':
        return IconWeather.windy;
      default:
        return IconWeather.na;
    }
  }
}

class Wind {
  Wind({
    required this.speed,
    required this.deg,
    required this.gust,
  });

  double speed;
  int deg;
  double gust;

  factory Wind.fromJson(Map<String, dynamic> json) => Wind(
        speed: json["speed"].toDouble(),
        deg: json["deg"],
        gust: json["gust"] != null ? json["gust"].toDouble() : 0,
      );

  Map<String, dynamic> toJson() => {
        "speed": speed,
        "deg": deg,
        "gust": gust,
      };

  String getIcon() {
    if (this.speed.isBetween(0.5, 1.5)) {
      return IconWeather.windBeaufort1;
    }

    if (this.speed.isBetween(1.6, 3.3)) {
      return IconWeather.windBeaufort2;
    }

    if (this.speed.isBetween(3.4, 5.5)) {
      return IconWeather.windBeaufort3;
    }

    if (this.speed.isBetween(5.5, 7.9)) {
      return IconWeather.windBeaufort4;
    }

    if (this.speed.isBetween(8, 10.7)) {
      return IconWeather.windBeaufort5;
    }

    if (this.speed.isBetween(10.8, 13.8)) {
      return IconWeather.windBeaufort6;
    }

    if (this.speed.isBetween(13.9, 17.1)) {
      return IconWeather.windBeaufort7;
    }
    if (this.speed.isBetween(17.2, 20.7)) {
      return IconWeather.windBeaufort8;
    }

    if (this.speed.isBetween(20.8, 24.4)) {
      return IconWeather.windBeaufort9;
    }

    if (this.speed.isBetween(24.5, 28.4)) {
      return IconWeather.windBeaufort10;
    }

    if (this.speed.isBetween(28.5, 32.6)) {
      return IconWeather.windBeaufort11;
    }

    if (this.speed.isBetween(32.7, 100)) {
      return IconWeather.windBeaufort11;
    }

    return IconWeather.windBeaufort0;
  }
}
