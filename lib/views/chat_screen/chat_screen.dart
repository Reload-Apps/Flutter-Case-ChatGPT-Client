import 'package:chatgpt_flutter_case/core/core_shelf.dart';
import 'package:chatgpt_flutter_case/core/providers/chat_provider.dart';
import 'package:chatgpt_flutter_case/core/widgets/custom_appbar.dart';
import 'package:chatgpt_flutter_case/view_models.dart/chat_screen_view_model.dart';
import 'package:chatgpt_flutter_case/views/chat_screen/components/chat_bubble.dart';
import 'package:chatgpt_flutter_case/views/chat_screen/components/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:progress_indicators/progress_indicators.dart';
import 'package:provider/provider.dart';

class ChatScreen extends StatefulWidget {
  ChatScreenViewModel viewModel;
  ChatScreen({super.key, required this.viewModel});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Consumer(builder: (context, ChatProvider chatProvider, child) {
      return Scaffold(
        appBar: CustomAppbar(
          appBar: AppBar(),
          // TODO: Save messages to local storage
          // actions: [
          //   IconButton(
          //     onPressed: () {
          //       // GVariables.secureStorage.clearMessages();
          //       widget.viewModel.saveMessages(chatProvider: chatProvider);
          //     },
          //     icon: const Icon(
          //       Icons.save,
          //     ),
          //   ),
          // ],
        ),
        body: SizedBox(
          height: size.height,
          width: size.width,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: size.height * .84,
                  child: ListView(
                    reverse: true,
                    children: [
                      if (chatProvider.awaitingResponse)
                        JumpingDotsProgressIndicator(
                          fontSize: 35,
                          color: textPrimary(context),
                        ),
                      ...List.generate(
                        chatProvider.conversationModel.messages!.length,
                        (index) => ChatBubble(
                          message: chatProvider.conversationModel.messages![index],
                          isLast: index == 0,
                          chatProvider: chatProvider,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomTextField(
                    onPressed: () => widget.viewModel.onSubmitted(chatProvider: chatProvider),
                    controller: widget.viewModel.messageController,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
