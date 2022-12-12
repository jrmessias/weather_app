import 'package:get_it/get_it.dart';
import 'package:weather/models/app.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerSingleton<AppModel>(AppModel());
}
