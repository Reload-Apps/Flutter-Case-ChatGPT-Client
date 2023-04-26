import 'package:chatgpt_flutter_case/core/models/message_model.dart';
import 'package:flutter/material.dart';

class ChatProvider extends ChangeNotifier {
  ConversationModel _conversationModel = ConversationModel(messages: []);
  ConversationModel get conversationModel => _conversationModel;

  bool _awaitingResponse = false;
  bool get awaitingResponse => _awaitingResponse;

  bool _shouldAnimate = true;
  bool get shouldAnimate => _shouldAnimate;

  void insertMessage(MessageModel message) {
    _conversationModel.messages!.insert(0, message);
    notifyListeners();
  }

  void setAwaitingResponse(bool value) {
    _awaitingResponse = value;
    notifyListeners();
  }

  void setShouldAnimate(bool value) {
    _shouldAnimate = value;
    notifyListeners();
  }
}
