class QuestionModel {
  final int id, answer;
  final String question;
  final List<String> options;

  QuestionModel(
      {required this.id,
      required this.question,
      required this.answer,
      required this.options});

  factory QuestionModel.fromJson(Map<String, dynamic> json) {
    return QuestionModel(
      id: json['id'] as int,
      question: json['question'] as String,
      answer: json['answer'] as int,
      options: json['options'],
    );
  }
}
