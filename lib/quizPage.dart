import 'package:flutter/material.dart';
import 'dart:async';
import 'question.dart';
import 'QuestionList.dart';
import 'QuestionBox.dart';
import 'overlay.dart';
import 'scorepage.dart';
class QuizPage extends StatefulWidget {
  @override
  State createState() =>  new _QuizPageState();


}

class _QuizPageState extends  State <QuizPage> {

  _QuizPageState()
  {
    init();
  }

  Question _currentQuestion;
  QuestionList _quizQuestions =  new QuestionList([
    new Question("quelle est la date de la can ", '2018', '2016', '2014', '2012', "A"),
    new Question("quelle est la date de la finale de league 1", '2018', '2016', '2014', '2012', "A"),
    new Question("quelle est la date de la finale de league de champion", '2018', '2016', '2014', '2012', "A"),
    new Question("quelle est la date de la finale de la coupe america", '2018', '2016', '2014', '2012', "A"),
    new Question("quelle est la date de la can", '2018', '2016', '2014', '2012', "A"),
  ]);

  int _questionNumber =0;
  int _score = 0;
  bool  _isCorrect;
  bool overlayVisible;

  void init() {
    /*******pour la visibilte***/
    overlayVisible = false ;
    /**les questions courantes***/
    _currentQuestion = _quizQuestions.nextQuestion;
    _questionNumber = _quizQuestions.questionNumber;
}

  void choiceHandler(String choice){
       if(_questionNumber == _quizQuestions.length)
   {
    Timer(Duration(seconds: 3), ()=>this.setState(() {
      print('state setted');
      /*****redirige  vers la page d'acceuil****/
      Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new ScorePage(_score, _quizQuestions.length) ));
    })) ;
   }
              /*******verification de la reponse puis increment le score*****/
       _isCorrect = (choice == _currentQuestion.correctChoice );
       _score = _isCorrect ? _score + 1 : _score ;

       this.setState(() {overlayVisible = true ;}) ;
       Timer(Duration(seconds: 3), ()=>this.setState((){
         init();
       }));

  }


  Column createQuizQuestion(Question obj)
  {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            new QuestionBox(Colors.red, "A", obj.choiceA, (){choiceHandler('A');}),
            new QuestionBox(Colors.green, "B", obj.choiceC, (){choiceHandler('B');}),

          ],
        ),
        Row(
          children: <Widget>[
            new QuestionBox(Colors.blue, "C", obj.choiceC, (){choiceHandler('C');}),
            new QuestionBox(Colors.red, "D", obj.choiceD, (){choiceHandler('D');}),
          ],
        )
      ],
    );

  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        new Container(
          decoration: BoxDecoration(
            image: new DecorationImage(image : AssetImage('assets/bg.png'), fit: BoxFit.fill) ,
          ),
        ),

        new Column(
          children: <Widget>[
            Center(
              child: Container(
                color: new Color(0x476879ff) ,
                width: double.infinity,
                padding: new EdgeInsets.all(6.0) ,
                child: Center(
                  child: Text("Question "+ _questionNumber.toString() ,style: new TextStyle(color: Colors.white,fontSize: 25.0, fontWeight: FontWeight.bold  ) ,),
                ),
              ),
            ),
            Center(
              child: new Container(
                width: double.infinity,
                decoration: new BoxDecoration(color: Colors.black54),
                padding: new EdgeInsets.only(top: 10.0,left:15.0, right: 15.0, bottom: 10.0) ,
                child:  new Center(
                  child: Text(_currentQuestion.questionText,style: new TextStyle(color: Colors.white,fontSize: 15.0, fontWeight: FontWeight.bold  ) ,),
                ),

              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10.0),
            ),
            /******Liste des questions *******/
            createQuizQuestion(_currentQuestion),

            Padding(
              padding: EdgeInsets.only(top: 10.0),
            ),
            overlayVisible ? new  CustomOverlay(_isCorrect) : new  Container()
          ],
        )
      ],
    );
  }



}