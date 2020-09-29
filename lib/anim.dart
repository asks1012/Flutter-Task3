import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';

class MyA1 extends StatefulWidget {
  @override
  _MyA1State createState() => _MyA1State();
}

class _MyA1State extends State<MyA1> with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 4000,
      ),
    );
    var animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    )..addListener(() {
        setState(() {
          //print(_controller.value);
        });
      });
    _controller.forward(); //play the counter.
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.amber,
        ),
        Container(
          margin:
              EdgeInsets.only(top: 330, left: 150- _controller.value * 130 ),
          child: Text(
            'Animation',
            style: TextStyle(fontSize: 60, fontWeight: FontWeight.bold,color: Colors.black.withOpacity(_controller.value*0.7+0.3)),
          ),
        ),
        Container(
          color: Colors.amber,
          width: double.infinity,
          height: 200,
          margin: EdgeInsets.only(
            top: 430,
          ),
        ),
        Container(
          color: Colors.amber,
          width: 300,
          height: 100,
          margin: EdgeInsets.only(top: 330,left: 140+_controller.value*230),
        )
      ],
    );
  }
}
