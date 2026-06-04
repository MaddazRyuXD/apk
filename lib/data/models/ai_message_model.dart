
class AIMessageModel {
  final String id;
  final String text;
  final bool isUser;

  const AIMessageModel({required this.id, required this.text, this.isUser = false});
}
