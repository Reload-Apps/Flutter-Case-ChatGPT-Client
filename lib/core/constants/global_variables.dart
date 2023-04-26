import '../core_shelf.dart';
import '../locator.dart';

class GVariables {
  static final navigator = NavigationService.instance;
  static final context = NavigationService.instance.navigatorKey.currentContext!;
  static SPService spService = getIt<SPService>();
  static final DialogService dialogService = DialogService();
  static final OpenAIService openAIService = OpenAIService();
  static final SecureStorage secureStorage = SecureStorage();
}
