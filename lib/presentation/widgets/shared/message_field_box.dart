import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {
  const MessageFieldBox({super.key});

  @override
  Widget build(BuildContext context) {

    final textController = TextEditingController(); //This element is used to control the text field value and to listen to changes in the text field
    final focusNode = FocusNode(); //This element is used to control the focus of the text field

    final outlineInputBorder = UnderlineInputBorder(
      borderSide: const BorderSide(
        color: Colors.transparent,
      ),
      borderRadius: BorderRadius.circular(30)
    );

    final inputDecoration = InputDecoration(
      hintText: 'Type a message',
      enabledBorder: outlineInputBorder,
      focusedBorder: outlineInputBorder,
      filled: true,
      suffixIcon: IconButton(
        icon: const Icon(Icons.send_outlined),
        onPressed: () {
          final textValue = textController.value.text;
          print('Send message $textValue');
          textController.clear();
        },
      ),
    );

    return TextFormField(
      onTapOutside: (event){
        focusNode.unfocus();
      },
      focusNode: focusNode,
      controller: textController,
      decoration: inputDecoration,
      onFieldSubmitted: (value) {
        print('Submitted: $value');
        textController.clear();
        focusNode.requestFocus();
      },
      //onChanged: (value) {print('Changed: $value');}
    );
  }
}