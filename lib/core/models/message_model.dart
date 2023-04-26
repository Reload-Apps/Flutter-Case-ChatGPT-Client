class MessageModel {
  final String message;
  final String sender;
  final DateTime time;

  MessageModel({
    required this.message,
    required this.sender,
    required this.time,
  });

  factory MessageModel.fromJson(Map<String, dynamic> json) {
    return MessageModel(
      message: json['message'],
      sender: json['sender'],
      time: DateTime.parse(json['time']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'sender': sender,
      'time': time.toIso8601String(),
    };
  }
}

class ConversationModel {
  List<MessageModel>? messages;

  ConversationModel({
    this.messages,
  });

  ConversationModel.fromJson(Map<String, dynamic> json) {
    if (json['messages'] != null) {
      messages = <MessageModel>[];
      json['messages'].forEach((v) {
        messages?.add(MessageModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (messages != null) {
      data['messages'] = messages?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
