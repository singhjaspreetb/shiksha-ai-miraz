import 'package:flutter/material.dart';
import 'package:shikshamiraz/screens/chat/chatmessage.dart';
import 'package:shikshamiraz/screens/chat/threedots.dart';
import 'package:http/http.dart' as http;

class ChatLearn extends StatefulWidget {
  final String topic;

  const ChatLearn(this.topic, {Key? key}) : super(key: key);

  @override
  State<ChatLearn> createState() => _ChatLearnState(topic);
}

class _ChatLearnState extends State<ChatLearn> {
  final String topic;
  bool _isFirstInit = true; // Flag to check first-time initiation

  _ChatLearnState(this.topic);

  final List<ChatMessage> _messages = [
    const ChatMessage(
      text:
          'Hey, I am Shiksha AI, your AI-Powered Personalized Learning Co-Pilot\n.',
      sender: 'Shiksha AI',
    ),
  ];

  bool _isTyping = false;
  String prompt = '';

  @override
  void dispose() {
    super.dispose();
  }

  void _sendMessage() async {
    setState(() {
      prompt = "explain more on with an example";
      _isTyping = true;
    });

    final url = Uri.parse('http://127.0.0.1:5000/api/explain?data=$prompt$topic');
    final response = await http.get(url);
    insertNewData(response.body);
  }

  void _sendMessageOnce() async {
    setState(() {
      _isTyping = true;
    });

    final url = Uri.parse('http://127.0.0.1:5000/api/explain?data=$prompt$topic');
    final response = await http.get(url);
    insertNewData(response.body);
  }

  void insertNewData(String response) {
    final botMessage = ChatMessage(
      text: response,
      sender: "Shiksha AI",
    );

    setState(() {
      _isTyping = false;
      _messages.insert(0, botMessage);
    });
  }

  @override
  void initState() {
    super.initState();
    if (_isFirstInit) {
      _sendMessageOnce();
      _isFirstInit = false; // Set the flag to false after the first-time initiation
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        decoration: BoxDecoration(color: Colors.black),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              Text(
                'Topic: $topic',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ), // Display the topic below the chat widget
              Expanded(
                child: ListView.builder(
                  reverse: true, // Reverse the ListView to show new messages at the bottom
                  itemCount: _messages.length,
                  itemBuilder: (BuildContext context, int index) {
                    return _messages[index]; // Show messages in the correct order
                  },
                ),
              ),
              if (_isTyping) const ThreeDots(),
              ElevatedButton(
                onPressed: _sendMessage,
                child: const Text('Explain More'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
