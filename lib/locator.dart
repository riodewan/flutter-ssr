import 'package:flutter_with_iot/services/navigator_service.dart';
import 'package:flutter_with_iot/services/rmq_service.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

void setupLocator(){
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => RmqService());
}