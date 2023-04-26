import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import '../../../core_shelf.dart';
import '../../../providers/chat_provider.dart';

class GenerateText extends StatelessWidget {
  const GenerateText({super.key});

  @override
  Widget build(BuildContext context) {
    final chatProvider = Provider.of<ChatProvider>(context, listen: true);
    return Container(
      height: 65,
      decoration: BoxDecoration(
        color: bgSecondary(context),
        borderRadius: BorderRadius.circular(3),
        border: Border.all(
          color: textSecondary(context),
          width: 0.5,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Generate Text Animation',
              style: TextStyle(
                color: textPrimary(context),
                fontWeight: FontWeight.w500,
                fontSize: 13,
              ),
            ),
            CupertinoSwitch(
                value: chatProvider.shouldAnimate,
                onChanged: (a) {
                  chatProvider.setShouldAnimate(a);
                }),
          ],
        ),
      ),
    );
  }
}
