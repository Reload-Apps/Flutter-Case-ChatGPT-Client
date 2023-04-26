import 'package:flutter/material.dart';

import '../core_shelf.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  final AppBar appBar;
  final List<Widget>? actions;
  final bool showSettings;
  const CustomAppbar({
    super.key,
    required this.appBar,
    this.actions,
    this.showSettings = true,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: RichText(
        text: const TextSpan(
          text: 'reload',
          style: TextStyle(
            color: MainColors.mainGreen,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
          children: [
            TextSpan(
                text: '.',
                style: TextStyle(
                  color: Colors.white,
                )),
            TextSpan(
              text: 'case',
              style: TextStyle(
                color: MainColors.mainYellow,
              ),
            ),
          ],
        ),
      ),
      actions: [
        if (actions != null) ...actions!,
        if (showSettings)
          IconButton(
            onPressed: () {
              GVariables.dialogService.showBottomSheet(
                context,
              );
            },
            icon: const Icon(
              Icons.settings,
            ),
          ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(appBar.preferredSize.height);
}
