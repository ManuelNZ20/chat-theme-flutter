import 'package:flutter_application_1/domain/datasources/message_datasource.dart';
import 'package:flutter_application_1/domain/entities/message.dart';
import 'package:flutter_application_1/domain/repositories/message_repository.dart';

class MessageRepositoryImpl extends MessageRepository {
  final MessageDatasource messageDatasource;

  MessageRepositoryImpl({required this.messageDatasource});
  @override
  Future<Message> getMessageYesNoWtf() {
    return messageDatasource.getMessageYesNoWtf();
  }
}
