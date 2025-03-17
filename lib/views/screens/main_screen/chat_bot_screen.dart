import 'package:brain_box/services/gemini_service.dart';
import 'package:brain_box/utils/constants/api_key.dart';
import 'package:brain_box/utils/constants/app_strings.dart';
import 'package:brain_box/views/widgets/chat_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ChatBotScreen extends StatefulWidget {
  const ChatBotScreen({super.key});

  @override
  State<ChatBotScreen> createState() => _ChatBotScreenState();
}

class _ChatBotScreenState extends State<ChatBotScreen> {
  final TextEditingController _textController = TextEditingController();
  final List<ChatMessage> _messages = [];
  bool _isTyping = false;
  late GeminiService _geminiService;
  @override
  void initState() {
    super.initState();
    // initialize gemini service
    _geminiService = GeminiService(apiKey: apiKey);
    // Add Initial greeting message
    _messages.add(const ChatMessage(
        text: 'Hello! How can I help you today?', isUser: false));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Column(
        children: [
          Expanded(
            child: _buildMessageList(),
          ),
          if (_isTyping) _buildTypingIndicator(),
          _buildInputField(),
          const SizedBox(height: 18),
        ],
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Text(
        AppStrings.appName,
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w500,
          color: Colors.grey.shade700,
        ),
      ),
      centerTitle: false,
      actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.person))],
    );
  }

  // Build the message list
  Widget _buildMessageList() {
    return ListView.builder(
      padding: const EdgeInsets.all(8.0),
      reverse: true,
      itemCount: _messages.length,
      itemBuilder: (context, index) {
        return _messages[_messages.length - 1 - index];
      },
    );
  }

  // Build the typing indicator
  Widget _buildTypingIndicator() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      alignment: Alignment.centerLeft,
      child: const Row(
        children: [
          Text('Chatbot is typing', style: TextStyle(color: Colors.grey)),
          SizedBox(width: 8.0),
          SizedBox(
            width: 30,
            height: 25,
            child: SpinKitThreeBounce(
              color: Colors.grey,
              size: 16.0,
            ),
          ),
        ],
      ),
    );
  }

  // Build the input field
  Widget _buildInputField() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          border: Border.all(
            style: BorderStyle.solid,
            width: 1,
            color: Colors.black45,
          ),
          boxShadow: const [
            BoxShadow(
              offset: Offset(0, -2),
              blurRadius: 4.0,
              color: Colors.black12,
            ),
          ],
        ),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: _textController,
                style: const TextStyle(
                  color: Colors.black87,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
                decoration: const InputDecoration(
                  hintText: 'Ask your query ... ',
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                  border: InputBorder.none,
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
                ),
                onSubmitted: _handleSubmitted,
              ),
            ),
            IconButton(
              icon: const Icon(Icons.send, color: Colors.black45),
              onPressed: () => _handleSubmitted(_textController.text),
            ),
          ],
        ),
      ),
    );
  }

  // Handle message submission
  Future<void> _handleSubmitted(String text) async {
    if (text.trim().isEmpty) return;

    _textController.clear();

    setState(() {
      _messages.add(ChatMessage(
        text: text,
        isUser: true,
      ));
      _isTyping = true;
    });

    // Simulate chatbot response after a delay
    try {
      final response = await _geminiService.generateResponse(text);
      Future.delayed(const Duration(seconds: 2), () {
        if (mounted) {
          setState(() {
            _isTyping = false;
            _messages.add(ChatMessage(
              text: response,
              isUser: false,
            ));
          });
        }
      });
    } catch (e) {
      if (mounted) {
        setState(() {
          _isTyping = false;
          _messages.add(const ChatMessage(
              text: "Sorry, I couldn't process that request", isUser: false));
        });
      }
    }
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }
}
