
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../providers/ai_provider.dart';
import '../../widgets/ai/ai_message_bubble.dart';
import '../../widgets/ai/ai_typing_indicator.dart';

class AIChatScreen extends ConsumerStatefulWidget {
  const AIChatScreen({super.key});

  @override
  ConsumerState<AIChatScreen> createState() => _AIChatScreenState();
}

class _AIChatScreenState extends ConsumerState<AIChatScreen> {
  final controller = TextEditingController();

  void sendMessage() {
    final text = controller.text.trim();
    if (text.isEmpty) return;
    ref.read(aiProvider.notifier).sendMessage(text);
    controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    final messages = ref.watch(aiProvider);
    final isTyping = messages.isNotEmpty && messages.last.text == 'Sedang memproses...' && !messages.last.isUser;

    return Scaffold(
      appBar: AppBar(title: const Text('AI Assistant')),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final message = messages[index];
                return AIMessageBubble(message: message.text, isUser: message.isUser);
              },
            ),
          ),
          if (isTyping) const AITypingIndicator(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: controller,
                    decoration: const InputDecoration(hintText: 'Tanya AI...'),
                  ),
                ),
                IconButton(onPressed: sendMessage, icon: const Icon(Icons.send)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
