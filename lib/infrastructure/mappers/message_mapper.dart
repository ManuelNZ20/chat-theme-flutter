import 'package:flutter_application_1/domain/entities/message.dart';
import 'package:flutter_application_1/infrastructure/model/yesno_model.dart';

class MessageMapper {
  static Message messageEntity(YesNoModel model) => Message(
      message: model.answer == 'yes' ? 'Si' : 'No',
      fromWho: FromWho.hers,
      imgUrl: model.image);
}
