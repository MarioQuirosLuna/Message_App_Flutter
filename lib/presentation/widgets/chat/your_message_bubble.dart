import 'package:flutter/material.dart';

import '../../../domain/entities/message.dart';

class YourMessageBubble extends StatelessWidget {
  final Message message;
  const YourMessageBubble({
    super.key,
    required this.message
  });

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            decoration: BoxDecoration(
                color: colors.secondary,
                borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)
                )
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text(
                message.text,
                style: const TextStyle(color: Colors.white),
              ),
            )
        ),
        const SizedBox(height: 5),
        _ImageBubble(imgURL: message.imageUrl),
        const SizedBox(height: 10),
      ],
    );
  }
}

class _ImageBubble extends StatelessWidget{
  final String? imgURL;
  const _ImageBubble({
    required this.imgURL
  });

  @override
  Widget build(BuildContext context){

    final size = MediaQuery.of(context).size; // Get screen size

    return ClipRRect(
      borderRadius: const BorderRadius.only(
          topRight: Radius.circular(20),
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20)
      ),
      child: Image.network(
        imgURL!,
        width: size.width * 0.7,
        height: size.height * 0.3,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return Container(
            width: size.width * 0.7,
            height: size.height * 0.3,
            color: Colors.grey[300],
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: const Center(
              child: CircularProgressIndicator(),
            )
          );
        }
      )
    );
  }
}