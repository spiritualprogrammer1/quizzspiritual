import 'package:flutter/material.dart';

class QuestionBox extends StatelessWidget {
  final Color _btnColor;
  final String _BtnText;
  final String ChoiceText;
  final VoidCallback _onPressed;

  QuestionBox(this._btnColor, this._BtnText,this.ChoiceText, this._onPressed);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Expanded(child: Container(
      decoration: BoxDecoration(
        color: Colors.black87,
        borderRadius:  const BorderRadius.all(const Radius.circular(4.0)),
      ),
      margin: const  EdgeInsets.all(4.0) ,

      child: Column(
        children: <Widget>[
          Container(
            width: double.infinity ,
            padding: new  EdgeInsets.only(left:20.0 , right:20.0, top: 10.0,bottom: 10.0 ),
            child: Center(
              child: Text(ChoiceText,style:TextStyle(color: Colors.white, fontWeight: FontWeight.bold , fontSize: 16.0 ) ,),
            ),
          ),
           new Container(
             width: double.infinity,
             padding: new EdgeInsets.only(left:20.0 , right:20.0, top: 10.0,bottom: 10.0 ),
             child: RaisedButton(onPressed: ()=> _onPressed(),
               color: _btnColor,
               child: Text(_BtnText,style:TextStyle(color: Colors.white, fontWeight: FontWeight.bold , fontSize: 16.0 ) ,),

             ),

           )
        ],
      ) ,
    ));
  }

}