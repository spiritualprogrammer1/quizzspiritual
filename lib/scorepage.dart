import 'package:flutter/material.dart';
import 'main.dart';

class ScorePage  extends  StatelessWidget {
  final int score ;
  final int totalQuestion;

  ScorePage(this.score, this.totalQuestion);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Material(
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Text("SCORE",style: TextStyle(color:  Colors.red,fontWeight: FontWeight.bold,fontSize: 50.0),),
          new Text(score.toString() +"/"+ totalQuestion.toString(), style: TextStyle(color:  Colors.red,fontWeight: FontWeight.bold,fontSize: 50.0), ),
          new IconButton(icon: new Icon(Icons.refresh) ,iconSize: 80.0, color: Colors.green ,
              onPressed: ()=> Navigator.of(context).pushAndRemoveUntil(new MaterialPageRoute(builder: (BuildContext context) => new StartPage()) , (Route route)=>route = null))
        ],
      ),
    );
  }

}