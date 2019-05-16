import 'question.dart';

class QuestionList {
  final List<Question> _quizquestionList;
   int _currentQuestionIndex = -1 ;

  QuestionList(this._quizquestionList) {
    /*****permet de faire des questions aléatoires******/
    _quizquestionList.shuffle();
  }

  int get length => _quizquestionList.length;
  int get questionNumber => _currentQuestionIndex + 1 ;

  Question get nextQuestion {
    _currentQuestionIndex++;
    if(_currentQuestionIndex > length )
      {
           return null;
      }

      return _quizquestionList[_currentQuestionIndex];
  }




}