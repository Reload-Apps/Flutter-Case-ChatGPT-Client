import 'dart:convert';

import 'package:chatgpt_flutter_case/core/models/message_model.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  FlutterSecureStorage get getStorage {
    // ignore: no_leading_underscores_for_local_identifiers
    AndroidOptions _getAndroidOptions() => const AndroidOptions(
          encryptedSharedPreferences: true,
        );
    return FlutterSecureStorage(aOptions: _getAndroidOptions());
  }

  Future<void> saveMessage(ConversationModel messages) async {
    final storage = getStorage;
    final messageList = await storage.read(key: 'messages');
    if (messageList == null) {
      await storage.write(key: 'messages', value: jsonEncode([messages.toJson()]));
    } else {
      await storage.write(key: 'messages', value: '$messageList,${jsonEncode([messages.toJson()])}');
    }
  }

  Future<List<ConversationModel>> getMessages() async {
    final storage = getStorage;
    final messageList = await storage.read(key: 'messages');
    if (messageList == null) {
      return [];
    } else {
      final messageListDecoded = jsonDecode(messageList).cast<Map<String, dynamic>>().toList();
      return List.generate(messageListDecoded.length, (index) => ConversationModel.fromJson(messageListDecoded[index]));
    }
  }

  Future<void> clearMessages() async {
    final storage = getStorage;
    await storage.delete(key: 'messages');
  }
}
