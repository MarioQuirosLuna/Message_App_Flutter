
import 'package:dio/dio.dart';

import '../../domain/entities/message.dart';
import '../../infrastructure/models/yes_no_model.dart';

class GetYesNoAnswer {

  final _dio = Dio(); // _ makes it private

  Future<Message> getAnswer() async {
    final response = await _dio.get('https://yesno.wtf/api');

    //final data = response.data;
    //return Message(
    //    text: data['answer'],
    //    imageUrl: data['image'],
    //    fromWho: FromWho.other
    //);

    final yesNoModel = YesNoModel.fromJsonMap(response.data);
    return yesNoModel.toMessageEntity();
  }
}