import 'package:flutter/material.dart';

class TextFormMessage extends StatelessWidget {
  final ValueChanged<String> onValue;
  const TextFormMessage({super.key, required this.onValue});

  @override
  Widget build(BuildContext context) {
    final focus = FocusNode();
    final textController = TextEditingController();
    final underlineInputBoder = UnderlineInputBorder(
        borderRadius: BorderRadius.circular(50), borderSide: BorderSide.none);

    final inputDecoration = InputDecoration(
      filled: true,
      focusedBorder: underlineInputBoder,
      enabledBorder: underlineInputBoder,
      hintText: 'Ingrese un mensaje',
      suffixIcon: IconButton(
          onPressed: () {
            final textValue = textController.value.text;
            onValue(textValue);
            textController.clear();
          },
          icon: const Icon(Icons.send_rounded)),
    );

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      child: TextFormField(
        focusNode: focus,
        controller: textController,
        decoration: inputDecoration,
        onFieldSubmitted: (value) {
          textController.clear();
          focus.requestFocus();
          onValue(value);
        },
      ),
    );
  }
}
