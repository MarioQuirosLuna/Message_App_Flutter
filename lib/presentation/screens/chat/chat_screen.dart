import 'package:flutter/material.dart';
import 'package:message_app/presentation/widgets/chat/my_message_bubble.dart';
import 'package:message_app/presentation/widgets/chat/your_message_bubble.dart';

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
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
                child: ListView.builder(itemBuilder: (context, index) {
                  return (index % 2 == 0)
                      ? const YourMessageBubble()
                      :const MyMessageBubble();
                },)
            ),
            const Text("User Name")
          ],
        ),
      ),
    );
  }
}