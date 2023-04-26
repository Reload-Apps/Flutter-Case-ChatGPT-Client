import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core_shelf.dart';
import '../../../init/helpers/utils.dart';

class UserSettingsThemeChanger extends StatelessWidget {
  const UserSettingsThemeChanger({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeProvider>(context, listen: false);
    return Container(
      decoration: BoxDecoration(
        color: bgSecondary(context),
        borderRadius: BorderRadius.circular(3),
        border: Border.all(
          color: textSecondary(context),
          width: 0.5,
        ),
      ),
      height: 65,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Theme',
              style: TextStyle(
                color: textPrimary(context),
                fontWeight: FontWeight.w500,
                fontSize: 13,
              ),
            ),
            Container(
              width: 60,
              height: 30,
              decoration: BoxDecoration(
                color: bgSecondary(context),
                borderRadius: BorderRadius.circular(4),
                border: Border.all(
                  color: textSecondary(context),
                  width: 0.5,
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        Utils.instance.onThemeChanged(false, themeNotifier);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: themeNotifier.theme == getLightTheme() ? Colors.blue : bgSecondary(context),
                          borderRadius: const BorderRadius.horizontal(
                            left: Radius.circular(4),
                          ),
                          border: Border.all(
                            color: textSecondary(context),
                            width: 0.5,
                          ),
                        ),
                        child: Center(
                          child: Icon(
                            Icons.light_mode,
                            color: themeNotifier.theme == getLightTheme() ? Colors.amber : textSecondary(context),
                            size: 16,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 0.5,
                    height: 30,
                    color: textSecondary(context),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        Utils.instance.onThemeChanged(true, themeNotifier);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: themeNotifier.theme == getDarkTheme() ? Colors.red : bgSecondary(context),
                          borderRadius: const BorderRadius.horizontal(
                            right: Radius.circular(4),
                          ),
                          border: Border.all(
                            color: textSecondary(context),
                            width: 0.5,
                          ),
                        ),
                        child: Center(
                          child: Icon(
                            Icons.dark_mode,
                            color: themeNotifier.theme == getDarkTheme() ? Colors.amber : textSecondary(context),
                            size: 16,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
