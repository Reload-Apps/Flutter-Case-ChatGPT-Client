import 'package:chatgpt_flutter_case/core/models/message_model.dart';
import 'package:dart_openai/openai.dart';

class OpenAIService {
  static const _model = 'gpt-3.5-turbo';

  Future<String> completeChat(List<MessageModel> messages) async {
    final chatCompletion = await OpenAI.instance.chat.create(
      model: _model,
      messages: messages.reversed
          .map((e) => OpenAIChatCompletionChoiceMessageModel(
                role: e.sender == 'user' ? OpenAIChatMessageRole.user : OpenAIChatMessageRole.assistant,
                content: e.message,
              ))
          .toList(),
    );
    return chatCompletion.choices.first.message.content;
  }
}
