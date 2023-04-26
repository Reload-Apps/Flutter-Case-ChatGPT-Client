import 'package:flutter/material.dart';

class NavigationService {
  static final NavigationService _instance = NavigationService._init();
  static NavigationService get instance => _instance;

  NavigationService._init();

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();
  // ignore: prefer_function_declarations_over_variables
  final removeAllOldRoutes = (route) => false;

  Future<void> push({
    required Widget route,
  }) async {
    await navigatorKey.currentState?.push(MaterialPageRoute(builder: (context) => route));
  }

  Future<void> pushAndRemoveUntil({required Widget route}) async {
    await navigatorKey.currentState
        ?.pushAndRemoveUntil(MaterialPageRoute(builder: (context) => route), (route) => false);
  }

  void pop<T>({T? result}) {
    return navigatorKey.currentState?.pop(result);
  }

  bool canPop() {
    final NavigatorState? navigator = Navigator.maybeOf(navigatorKey.currentState!.context);
    return navigator != null && navigator.canPop();
  }
}
