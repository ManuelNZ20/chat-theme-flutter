import 'package:flutter/material.dart';
import 'package:flutter_application_1/domain/entities/message.dart';
import 'package:flutter_application_1/domain/repositories/message_repository.dart';

class ChatProvider extends ChangeNotifier {
  final MessageRepository messageRepository;
  final listChat = <Message>[];
  final scrollController = ScrollController();

  ChatProvider({required this.messageRepository});

  Future<void> sendMessage(String message) async {
    if (message.isEmpty) return;
    final newMessage = Message(message: message, fromWho: FromWho.me);
    listChat.add(newMessage);
    if (message.endsWith('?')) {
      hersMessage();
    }
    notifyListeners();
    moveScrollBottom();
  }

  Future<void> hersMessage() async {
    final herMessage = await messageRepository.getMessageYesNoWtf();
    listChat.add(herMessage);
    notifyListeners();
    moveScrollBottom();
  }

  Future<void> moveScrollBottom() async {
    await Future.delayed(const Duration(milliseconds: 100));

    scrollController.animateTo(scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
  }
}
