import 'package:flutter/material.dart';

void main() {
  runApp(const ChatPage());
}

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          title: const Text('username'),
          actions: const [
            CircleAvatar(
              backgroundImage: AssetImage('assets/images/aa.png'),
            )
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView(
                children: const [
                  MessageWidget(
                    sender: 'ENAS',
                    text: 'Hello there!',
                    isMe: false,
                  ),
                  MessageWidget(
                    sender: 'You',
                    text: 'Hi ENAS!',
                    isMe: true,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  const Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Type your message...',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8.0),
                  IconButton(
                    icon: const Icon(Icons.send),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MessageWidget extends StatelessWidget {
  final String sender;
  final String text;
  final bool isMe;

  const MessageWidget(
      {super.key,
      required this.sender,
      required this.text,
      required this.isMe});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment:
            isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          isMe ? const SizedBox() : CircleAvatar(child: Text(sender[0])),
          const SizedBox(width: 8.0),
          Container(
            padding: const EdgeInsets.all(12.0),
            decoration: BoxDecoration(
              color: isMe ? Colors.blue : Colors.grey,
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Text(
              text,
              style: const TextStyle(color: Colors.white),
            ),
          ),
          isMe ? CircleAvatar(child: Text(sender[0])) : const SizedBox(),
        ],
      ),
    );
  }
}
