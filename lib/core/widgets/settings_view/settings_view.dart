import 'package:chatgpt_flutter_case/core/widgets/settings_view/components/generate_text_setting.dart';
import 'package:chatgpt_flutter_case/core/widgets/settings_view/components/theme_changer.dart';
import 'package:flutter/material.dart';

import '../../core_shelf.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Container(
      padding: const EdgeInsets.all(
        12,
      ),
      decoration: BoxDecoration(
        color: bgPrimary(context),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      width: size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Settings',
            style: TextStyle(
              color: textPrimary(context),
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(
            height: size.height * .02,
          ),
          const UserSettingsThemeChanger(),
          SizedBox(
            height: size.height * .02,
          ),
          const GenerateText(),
        ],
      ),
    );
  }
}
