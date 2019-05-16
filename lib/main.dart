import 'package:flutter/material.dart';
/**
 * permet de gerer les portraits
 */
import 'package:flutter/services.dart';
import 'dart:async';
import 'quizPage.dart';

void main()
{
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft , DeviceOrientation.portraitUp
  ]);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      theme: ThemeData(primaryColor: Colors.blue, accentColor: Colors.white ),
      debugShowCheckedModeBanner: false,
      home: new StartPage() ,

    );
  }

}

class StartPage extends StatefulWidget {
  @override
  State  createState() => new _StatePageState();

}

class _StatePageState extends State<StartPage>
{
  void  initState()
  {
    super.initState();
    /******permet de  lancer la page quizz a partir de 5 secondes*******/
    Timer(Duration(seconds: 5), ()=> Navigator.of(context).push(
      new MaterialPageRoute(builder: (BuildContext context) => new QuizPage() )
    ));
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      body: Stack(
        fit: StackFit.expand ,
        children: <Widget>[
          /*******l'image en background*********/
          new Container(
            decoration: BoxDecoration(image: new DecorationImage(image: AssetImage('assets/bg.png'), fit:BoxFit.fill,) ) ,
          ),

          new Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Column(
                  children: <Widget>[

                    Padding(
                      padding: EdgeInsets.only(top: 30.0),
                    ),

                    new Container(
                      width: 200.0,
                      height: 200.0,
                      decoration: BoxDecoration(image: new DecorationImage(image: AssetImage('assets/icon.jpg'))),
                    ),
                   /******notre fonction widget padding creer , voir en bas******/

                    Padding(
                        padding : EdgeInsets.only(top: 30.0)
                    ),

                  /******notre bar de progression*****/
                 Container(
                   width: 300.0,
                   child: LinearProgressIndicator(backgroundColor: Colors.yellow) ,
                 ),
                    Padding(
                        padding : EdgeInsets.only(top: 10.0)
                    ),

                    new Text("depart ...", style: TextStyle(fontSize: 18.0,color: Colors.yellow,fontWeight: FontWeight.bold),)

                  ],
                ),
              )

            ],
          )
        ],
      ),
    );
  }

  /****on creer notre widget paddig******/
  Widget paddingwidget(value)
  {
    Padding(
      padding : EdgeInsets.only(top: value)
    );
  }
}