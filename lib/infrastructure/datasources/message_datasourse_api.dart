import 'package:flutter_application_1/domain/datasources/message_datasource.dart';
import 'package:flutter_application_1/domain/entities/message.dart';
import 'package:dio/dio.dart';
import 'package:flutter_application_1/infrastructure/mappers/message_mapper.dart';
import 'package:flutter_application_1/infrastructure/model/yesno_model.dart';

class MessageDatasourceApi extends MessageDatasource {
  final _dio = Dio();

  @override
  Future<Message> getMessageYesNoWtf() async {
    final response = await _dio.get('https://yesno.wtf/api');
    final model = YesNoModel.fromJson(response.data);
    return MessageMapper.messageEntity(model);
  }
}
