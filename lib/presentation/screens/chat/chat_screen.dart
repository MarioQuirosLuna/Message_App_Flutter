import 'package:flutter/material.dart';
import 'package:message_app/presentation/providers/chat_provider.dart';
import 'package:provider/provider.dart';

import 'package:message_app/presentation/widgets/chat/my_message_bubble.dart';
import 'package:message_app/presentation/widgets/chat/your_message_bubble.dart';
import 'package:message_app/presentation/widgets/shared/message_field_box.dart';

import '../../../domain/entities/message.dart';


class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        leading: const Padding(
          padding: EdgeInsets.all(4.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage('https://picsum.photos/200'),
          ),
        ),
        title: const Text('User Name'),
      ),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final chatProvider = context.watch<ChatProvider>();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
                child: ListView.builder(
                  controller: chatProvider.chatScrollController,
                  itemCount: chatProvider.messageList.length,
                  itemBuilder: (context, index) {
                    final message = chatProvider.messageList[index];

                    return (message.fromWho == FromWho.other)
                      ? YourMessageBubble(message: message)
                      : MyMessageBubble(message: message);
                },)
            ),
            MessageFieldBox(
              onValue: (value) => chatProvider.sendMessage(value),
              //onValue: chatProvider.sendMessage, //This line is the same as the previous one
            )
          ],
        ),
      ),
    );
  }
}