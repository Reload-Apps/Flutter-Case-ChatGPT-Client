import 'package:chatgpt_flutter_case/core/widgets/settings_view/settings_view.dart';
import 'package:flutter/material.dart';

class DialogService {
  void showBottomSheet(
    BuildContext context,
  ) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      builder: (context) => const SettingsView(),
    );
  }
}
