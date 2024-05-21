import 'package:agora_01/chat/views/video_call_screen.dart';
import 'package:agora_01/chat/widgets/message_bubble.dart';
import 'package:agora_01/chat/widgets/message_text_field.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat'),
        actions: [
          IconButton(
            icon: const Icon(Icons.video_camera_front),
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => const VideoCallScreen()),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.only(bottom: 16),
              reverse: true,
              itemCount: _messages.length,
              itemBuilder: (_, index) => _messages[index],
              separatorBuilder: (_, __) => const SizedBox(height: 16),
            ),
          ),
          const MessageTextField(),
        ],
      ),
    );
  }
}

const List<MessageBubble> _messages = <MessageBubble>[
  MessageBubble(
    profileImageUrl:
        'https://images.unsplash.com/photo-1568028860651-ac5463c69d04?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    message: 'This app would be perfect if it had video chat!',
    date: 'Apr 22, 8:59 PM',
  ),
  MessageBubble(
    message: 'This app would be perfect if it had video chat!',
    date: 'Apr 22, 8:59 PM',
  ),
  MessageBubble(
    profileImageUrl:
        'https://images.unsplash.com/photo-1568028860651-ac5463c69d04?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    message: 'This app would be perfect if it had video chat!',
    date: 'Apr 22, 8:59 PM',
  ),
  MessageBubble(
    message: 'This app would be perfect if it had video chat!',
    date: 'Apr 22, 8:59 PM',
  ),
];
