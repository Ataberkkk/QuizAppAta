import 'package:flutter/material.dart';
import 'package:flutter_simple_quiz_app/question_model.dart';

class QuizScreen extends StatefulWidget {
  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  List<Question> questionList = getQuestions();
  int currentQuestionIndex = 0;
  int score = 0;
  Answer? selectedAnswer;
  bool showScore = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 255, 107, 1), body: returnBody());
  }

  returnBody() {
    if (!showScore) {
      return Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          const Text(
            "Ataberks Quiz App",
            style: TextStyle(
              color: Color.fromARGB(255, 255, 255, 255),
              fontSize: 24,
            ),
          ),
          _questionWidget(),
          _answerList(),
        ]),
      );
    } else {
      return Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 100),
        child: Column(children: [
          Text(
            "Congrats! You have reached to the end of the quiz!  You can do the quiz again by pressing the button below.",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color.fromARGB(255, 20, 18, 18),
              fontSize: 24,
            ),
          ),
          Text(
            "Score ${score * (100 / questionList.length)}",
            style: TextStyle(
              color: Color.fromARGB(255, 139, 4, 4),
              fontSize: 31,
            ),
          ),
          TextButton(
            onPressed: () => {
              setState(() {
                currentQuestionIndex = 0;
                score = 0;
                selectedAnswer = null;
                showScore = false;
              })
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
            ),
            child: Text("Restart The Quiz",
                style: TextStyle(
                  color: Colors.red,
                )),
          )
        ]),
      );
    }
  }

  _questionWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Question ${currentQuestionIndex + 1}/${questionList.length.toString()}",
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 20),
        Container(
          alignment: Alignment.center,
          width: double.infinity,
          padding: const EdgeInsets.all(32),
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 2, 2, 2),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Text(
            questionList[currentQuestionIndex].questionText,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        )
      ],
    );
  }

  _answerList() {
    return Column(
      children: questionList[currentQuestionIndex]
          .answersList
          .map(
            (e) => _answerButton(e),
          )
          .toList(),
    );
  }

  Widget _answerButton(Answer answer) {
    bool isSelected = answer == selectedAnswer;

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 8),
      height: 48,
      child: ElevatedButton(
        child: Text(answer.answerText),
        style: ElevatedButton.styleFrom(
          shape: const StadiumBorder(),
          primary: isSelected ? Colors.orangeAccent : Colors.white,
          onPrimary: isSelected ? Colors.white : Colors.black,
        ),
        onPressed: () {
          if (selectedAnswer == null) {
            if (answer.isCorrect) {
              score++;
            }
            setState(() {
              selectedAnswer = answer;
              _nextQuestion();
            });
          }
        },
      ),
    );
  }

  _nextQuestion() {
    bool isLastQuestion = false;
    if (currentQuestionIndex == questionList.length - 1) {
      isLastQuestion = true;
    }
    if (isLastQuestion) {
      setState(() {
        showScore = true;
      });
    } else {
      //next question
      setState(() {
        selectedAnswer = null;
        currentQuestionIndex++;
      });
    }
  }
}
