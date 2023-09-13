import 'package:flutter_application_1/domain/entities/message.dart';

abstract class MessageRepository {
  Future<Message> getMessageYesNoWtf();
}
