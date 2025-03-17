import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class ChatMessage extends StatelessWidget {
  final String text;
  final bool isUser;

  const ChatMessage({
    super.key,
    required this.text,
    required this.isUser,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12.0),
      child: Row(
        mainAxisAlignment:
            isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (!isUser) _buildAvatar(),
          const SizedBox(width: 8.0),
          Flexible(
            child: Container(
              padding: const EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                color: isUser
                    ? Colors.deepOrangeAccent.shade100
                    : Colors.grey[100],
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: isUser ? _buildUserText() : _buildBotText(),
            ),
          ),
          const SizedBox(width: 8.0),
          if (isUser) _buildAvatar(),
        ],
      ),
    );
  }

  Widget _buildAvatar() {
    return CircleAvatar(
      backgroundColor:
          isUser ? Colors.deepOrangeAccent.shade400 : Colors.grey.shade300,
      child: Icon(
        isUser ? Icons.person : Icons.smart_toy,
        color: Colors.black87,
      ),
    );
  }

  Widget _buildUserText() {
    return Text(
      text,
      textAlign: TextAlign.start,
      style: const TextStyle(
        fontSize: 18,
        color: Colors.black,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  Widget _buildBotText() {
    return Html(
      data: text, shrinkWrap: true, // Assuming this is HTML formatted
      style: {
        "body": Style(
          margin: Margins.zero,
          padding: HtmlPaddings.zero,
          fontSize: FontSize(18),
          color: Colors.black87,
        ),
        "h1": Style(
          fontSize: FontSize.xLarge,
          color: Colors.blueAccent,
          fontWeight: FontWeight.bold,
          padding: HtmlPaddings.only(bottom: 8),
        ),
        "h3": Style(
          fontSize: FontSize.large,
          color: Colors.blueGrey,
          fontWeight: FontWeight.w600,
          padding: HtmlPaddings.only(bottom: 6),
        ),
        "p": Style(
          fontSize: FontSize.medium,
          lineHeight: LineHeight.number(1.4),
        ),
        "strong": Style(
          color: Colors.deepPurple,
          fontWeight: FontWeight.w600,
        ),
        "em": Style(
          color: Colors.teal,
          fontStyle: FontStyle.italic,
        ),
        "ul": Style(
          padding: HtmlPaddings.only(left: 20),
          listStyleType: ListStyleType.disc,
        ),
        "li": Style(
          margin: Margins.only(bottom: 6),
        ),
        "blockquote": Style(
          backgroundColor: Colors.grey.shade200,
          padding: HtmlPaddings.all(10),
          border: const Border(left: BorderSide(color: Colors.blue, width: 4)),
          fontStyle: FontStyle.italic,
        ),
      },
    );
  }
}
