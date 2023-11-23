
import 'package:flutter/material.dart';

import 'package:yes_no_app/domain/domain.dart';

class MessageBubble extends StatelessWidget {

  final Message message;
  final CrossAxisAlignment alignment;

  const MessageBubble({
    super.key,
    required this.message,
    required this.alignment
  });

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: alignment,
      children: [
        Container(
          decoration: BoxDecoration(
            color: message.fromWho == FromWho.hers ? colors.secondary : colors.primary,
            borderRadius: BorderRadius.circular(20)
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric( horizontal: 20, vertical: 10 ),
            child: Text(message.text, style: const TextStyle( color: Colors.white )),
          )
        ),

        const SizedBox( height: 10 ),

        if (message.fromWho == FromWho.hers) ...[
          _ImageBubble(imageUrl: message.imageUrl!),
          const SizedBox( height: 10 )
        ],
      ]
    );
  }
}

class _ImageBubble extends StatelessWidget {

  final String imageUrl;

  const _ImageBubble({
    super.key,
    required this.imageUrl
  });

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.network(
        imageUrl,
        width: size.width * .7,
        height: 150,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;

          return Container(
            width: size.width * .7,
            height: 150,
            padding: const EdgeInsets.symmetric( horizontal: 10, vertical: 5 ),
            child: const Text('Username is sending a message...'),
          );
        },
      )
    );
  }
}