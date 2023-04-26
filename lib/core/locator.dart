import 'package:chatgpt_flutter_case/core/services/locale_services/sp_service.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;

void setupLocators() {
  getIt.registerLazySingleton(() => SPService());
}
