import 'package:chat_app/widgets/constant.dart';

class Massagess {
  final String message;
  final String? id;
  Massagess(this.message, this.id);

  factory Massagess.fromJason(jasonData) {
    return Massagess(jasonData[kMessage], jasonData['id']);
  }
}
