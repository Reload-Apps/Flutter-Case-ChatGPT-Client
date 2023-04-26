import 'package:chatgpt_flutter_case/core/models/message_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../core/core_shelf.dart';

class ChatBubble extends StatelessWidget {
  final MessageModel message;

  const ChatBubble({
    super.key,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: size.width * .95,
        decoration: BoxDecoration(
          color: message.sender == 'user' ? bgPrimary(context) : chatBubble(context),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: message.sender == 'user' ? MainColors.mainPurple : MainColors.mainGreen,
                      shape: BoxShape.circle,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: size.width * .75,
              margin: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Text(
                      message.sender == 'user' ? "You" : "Chatbot",
                      style: TextStyle(
                        color: message.sender != 'user' ? MainColors.mainGreen : Colors.grey,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text(
                    message.message,
                    style: TextStyle(
                      color: textPrimary(context),
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: InkWell(
                        onTap: () {
                          Clipboard.setData(ClipboardData(text: message.message));
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Copied to clipboard"),
                              duration: Duration(milliseconds: 500),
                            ),
                          );
                        },
                        child: Icon(Icons.content_copy, color: textPrimary(context), size: 20)),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
