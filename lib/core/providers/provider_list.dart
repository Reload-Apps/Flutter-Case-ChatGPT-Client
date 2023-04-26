import 'package:chatgpt_flutter_case/core/providers/chat_provider.dart';
import 'package:chatgpt_flutter_case/core/providers/theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../constants/global_variables.dart';

class ApplicationProvider {
  static ApplicationProvider? _instance;
  static ApplicationProvider? get instance {
    _instance ??= ApplicationProvider._init();
    return _instance;
  }

  ApplicationProvider._init();

  List<SingleChildWidget> dependItems = [
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
    ),
    ChangeNotifierProvider(
      create: (context) => ChatProvider(),
    ),
    Provider.value(value: GVariables.navigator)
  ];
}
