import '../entities/message.dart';

abstract class MessageDatasource {
  Future<Message> getMessageYesNoWtf();
}
