class Question {
  final String questionText;
  final List<Answer> answersList;

  Question(this.questionText, this.answersList);
}

class Answer {
  final String answerText;
  final bool isCorrect;

  Answer(this.answerText, this.isCorrect);
}

List<Question> getQuestions() {
  List<Question> list = [];

  list.add(Question(
    "Who is the owner of amazon?",
    [
      Answer("Steve Jobs", false),
      Answer("Elon Musk", false),
      Answer("Jeff Bezos", true),
      Answer("Tim Cook", false),
    ],
  ));

  list.add(Question(
    "Who owns Iphone?",
    [
      Answer("Apple", true),
      Answer("Microsoft", false),
      Answer("Google", false),
      Answer("Nokia", false),
    ],
  ));

  list.add(Question(
    "Youtube is _________  platform?",
    [
      Answer("Music Sharing", false),
      Answer("Video Sharing", false),
      Answer("Live Streaming", false),
      Answer("All of the above", true),
    ],
  ));

  list.add(Question(
    "Who is the owner of Microsoft?",
    [
      Answer("Elon Musk", false),
      Answer("Jeff Bezos", false),
      Answer("Tim Cook", false),
      Answer("Bill Gates", true),
    ],
  ));

  return list;
}
