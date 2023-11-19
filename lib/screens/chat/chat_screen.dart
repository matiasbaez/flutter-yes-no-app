import 'package:flutter/material.dart';

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
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric( horizontal: 10 ),
        child: Column(
          children: [

            Expanded(
              child: ListView.builder(
                itemCount: 50,
                itemBuilder: (context, index) {
                  return index % 2 == 0
                    ? MessageBubble(message: 'Lorem ipsum dolor $index', alignment: CrossAxisAlignment.start )
                    : MessageBubble(message: 'Lorem ipsum dolor $index', alignment: CrossAxisAlignment.end );
                }
              )
            ),

            const MessageFieldBox(),

          ],
        ),
      ),
    );
  }
}
