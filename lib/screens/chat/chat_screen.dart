import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:yes_no_app/domain/entities/message.dart';

import 'package:yes_no_app/providers/providers.dart';
import 'package:yes_no_app/widgets/widgets.dart';

class ChatScreen extends StatelessWidget {

  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Username ♥'),
        leading: const Padding(
          padding: EdgeInsets.all(5.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage('https://shorturl.at/mKW14'),
          ),
        ),
      ),
      body: const _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {

  const _ChatView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    // final chatProvider = Provider.of<ChatProvider>(context, listen: true);
    final chatProvider = context.watch<ChatProvider>();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric( horizontal: 10 ),
        child: Column(
          children: [

            Expanded(
              child: ListView.builder(
                controller: chatProvider.chatScrollController,
                itemCount: chatProvider.messages.length,
                itemBuilder: (context, index) {
                  final message = chatProvider.messages[index];
                  return message.fromWho == FromWho.hers
                    ? MessageBubble(message: message, alignment: CrossAxisAlignment.start )
                    : MessageBubble(message: message, alignment: CrossAxisAlignment.end );
                }
              )
            ),

            MessageFieldBox(onSubmit: chatProvider.sendMessage),

          ],
        ),
      ),
    );
  }
}
