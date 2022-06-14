class Message {
  final String text;
  final DateTime date;
  final bool isSentByMe;
  final String image;

  Message({
    required this.text,
    required this.date,
    required this.isSentByMe,
    required this.image,
  });
}
