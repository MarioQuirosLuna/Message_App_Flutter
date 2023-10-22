
import 'package:flutter/material.dart';

import '../../domain/entities/message.dart';

class ChatProvider extends ChangeNotifier{

  List<Message> messages = [
    const Message(text: 'Hello', fromWho: FromWho.me),
    const Message(text: 'Are you at home? ', fromWho: FromWho.me),
  ];

  Future<void> sendMessage(String text) async {
    messages.add(Message(text: text, fromWho: FromWho.me));
    notifyListeners();
  }
}