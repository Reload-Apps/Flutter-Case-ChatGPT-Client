import 'package:chatgpt_flutter_case/core/core_shelf.dart';
import 'package:chatgpt_flutter_case/core/models/message_model.dart';
import 'package:chatgpt_flutter_case/core/providers/chat_provider.dart';
import 'package:flutter/material.dart';

class ChatScreenViewModel {
  var messageController = TextEditingController();

  Future<void> onSubmitted({required ChatProvider chatProvider}) async {
    chatProvider.insertMessage(MessageModel(message: messageController.text, sender: 'user', time: DateTime.now()));
    messageController.clear();
    chatProvider.setAwaitingResponse(true);

    try {
      final response = await GVariables.openAIService.completeChat(chatProvider.conversationModel.messages!);
      chatProvider.insertMessage(MessageModel(message: response, sender: 'assistant', time: DateTime.now()));
      chatProvider.setAwaitingResponse(false);
    } catch (e) {
      ScaffoldMessenger.of(GVariables.context).showSnackBar(
        const SnackBar(content: Text('An error occurred. Please try again.')),
      );
      chatProvider.setAwaitingResponse(false);
    }
  }

  Future<void> saveMessages({required ChatProvider chatProvider}) async {
    await GVariables.secureStorage.saveMessage(chatProvider.conversationModel);
  }
}
