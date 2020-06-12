import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget{
  @override
  _HomePage createState()=>_HomePage();
}

class _HomePage extends State<HomePage>{
  int _number=0;
  final StreamController<int> _streamController=StreamController<int>();
  //completely remove the widget from the widget tree
  @override
  void dispose() {
    _streamController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //StreamBuilder listens to a stream of events,the rebuilds widget
            StreamBuilder(
              //output
              stream: _streamController.stream,
              //initial data to display when there is no input data
              initialData: 10,
              builder: (BuildContext context,AsyncSnapshot<int> snapShot){
                return Text("Value: $_number");
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                RaisedButton(
                  child: Text("Increment"),
                  onPressed: ()=>{
                    _streamController.sink.add(_number++)
                  },
                ),
                RaisedButton(
                  child: Text("Decrement"),
                  onPressed: ()=>{
                    _streamController.sink.add(_number--)
                  },
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}