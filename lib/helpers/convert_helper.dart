String convertTemperature(int temperature, String unit) {
  String result = "";
  switch (unit) {
    case "farenheit":
      result = temperature.toString() + " ºF";
      break;
    case "kelvin":
      result = temperature.toString() + "  K";
      break;
    default:
      result = temperature.toString() + " ºC";
  }

  return result;
}
