import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {

  final ValueChanged<String> onSubmit;

  const MessageFieldBox({
    super.key,
    required this.onSubmit
  });

  @override
  Widget build(BuildContext context) {

    final textController = TextEditingController();
    final FocusNode focusNode = FocusNode();

    // final colors = Theme.of(context).colorScheme;

    final underlineInputBorder = UnderlineInputBorder(
      borderSide: const BorderSide( color: Colors.transparent ),
      borderRadius: BorderRadius.circular(10)
    );

    // final outlineInputBorder = OutlineInputBorder(
    //   borderSide: BorderSide( color: colors.primary ),
    //   borderRadius: BorderRadius.circular(10)
    // );

    final inputDecoration = InputDecoration(
      filled: true,
      hintText: 'Write your message with a "?"',
      enabledBorder: underlineInputBorder,
      focusedBorder: underlineInputBorder,
      suffixIcon: IconButton(
        icon: const Icon( Icons.send_outlined ),
        onPressed: () {
          final textValue = textController.value.text;
          onSubmit(textValue);
          textController.clear();
          focusNode.requestFocus();
        },
      )
    );

    return TextFormField(
      focusNode: focusNode,
      controller: textController,
      decoration: inputDecoration,
      onTapOutside: (event) {
        focusNode.unfocus();
      },
      onFieldSubmitted: (value) {
        onSubmit(textController.value.text);
        textController.clear();
        focusNode.requestFocus();
      },
    );
  }
}