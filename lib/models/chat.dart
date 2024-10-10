import 'package:term/models/message.dart';

class Chat {
  int studentId;
  List<Message> messages = [];

  Chat({required this.studentId, required this.messages});
}
