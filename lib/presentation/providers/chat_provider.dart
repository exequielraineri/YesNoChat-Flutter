import 'package:flutter/material.dart';
import 'package:yes_no_app/config/theme/helpers/get_yes_no_answer.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  final ScrollController chatScrollController = ScrollController();
  final getYesNoAnswer = GetYesNoAnswer();
  List<Message> messageList = [
    Message(text: "Hola como estas?", fromWho: FromWho.me),
    Message(text: "Ya regresaste?", fromWho: FromWho.me),
  ];

  Future<void> sendMessage(String text) async {
    if (text.isEmpty) {
      return;
    }

    if (text.endsWith('?')) {
      herReply();
    }
    final newMessage = Message(text: text, fromWho: FromWho.me);
    messageList.add(newMessage);
    notifyListeners();
    moveScrollBottom();
  }

  Future<void> herReply() async {
    final herMessage = await getYesNoAnswer.getAnswer();

    messageList.add(herMessage);
    notifyListeners();
    moveScrollBottom();
  }

  Future<void> moveScrollBottom() async {
    await Future.delayed(const Duration(milliseconds: 100));

    chatScrollController.animateTo(
      chatScrollController.position.maxScrollExtent,
      curve: Curves.easeInOut,
      duration: const Duration(milliseconds: 300),
    );
  }
}
