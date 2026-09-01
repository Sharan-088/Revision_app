class Doubt {
  String id;
  String title;
  String description;
  String subject;
  String difficulty;
  bool isUnderstood;

  Doubt({
    required this.id,
    required this.title,
    required this.description,
    required this.subject,
    required this.difficulty,
    this.isUnderstood = false,
  });
}
