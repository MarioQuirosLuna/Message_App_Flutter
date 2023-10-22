
import 'package:flutter/material.dart';

import '../../config/helpers/get_yes_no_answer.dart';
import '../../domain/entities/message.dart';

class ChatProvider extends ChangeNotifier{

  final ScrollController chatScrollController = ScrollController();
  final chatGetYesNoController = GetYesNoAnswer();

  List<Message> messageList = [
    const Message(text: 'Hello', fromWho: FromWho.me),
    const Message(text: 'Are you at home? ', fromWho: FromWho.me),
  ];

  Future<void> sendMessage(String text) async {
    if(text.isEmpty) return;
    messageList.add(Message(text: text, fromWho: FromWho.me));

    if( text.endsWith('?') ) yourReply();

    notifyListeners(); // To update UI with new message
    moveScrollToEnd();
  }

  Future<void> yourReply() async {
    final message = await chatGetYesNoController.getAnswer();
    messageList.add(message);
    notifyListeners(); // To update UI with new message
    moveScrollToEnd();
  }

  Future<void> moveScrollToEnd() async{
    await Future.delayed(const Duration(milliseconds: 100)); // To wait for the message to be added to the list
    chatScrollController.animateTo(
      chatScrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut
    );
  }
}