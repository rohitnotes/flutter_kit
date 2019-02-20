import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class LoadingWidget extends StatefulWidget {
  @override
  _LoadingWidgetState createState() => new _LoadingWidgetState();
}

class _LoadingWidgetState extends State<LoadingWidget>
    with SingleTickerProviderStateMixin {

  AnimationController _controller;
  Animation<double> _doubleAnimation;


  @override
  void initState() {
    super.initState();
    _controller = new AnimationController(
        vsync: this, duration: Duration(milliseconds: 1000))
      ..repeat();
    _doubleAnimation = Tween(begin: 0.0, end: 360.0).animate(_controller)
      ..addListener(() {
        setState(() {

        });
      });
  }

  @override
  void dispose() {
    if (_controller != null && !_controller.isDismissed) {
      _controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          color: Color(0x66000000),
          borderRadius: BorderRadius.all(Radius.circular(5)),
        ),
        width: _width(context),
        height: _width(context),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            Transform.rotate(
                angle: _doubleAnimation.value ~/ 30 * 30.0 * 0.0174533,
                child: Image.asset("assets/loading.png",
                    width: 50,
                    height: 50)
            ),
            SizedBox(height: 10,),
            Text("加载中", style: TextStyle(color: Colors.white,
                fontStyle: FontStyle.normal,
                fontSize: 14,
                decoration: TextDecoration.none),),
          ],
        ),
      ),
    );
  }

  static double _width(BuildContext context) {
    return MediaQuery
        .of(context)
        .size
        .width / 3;
  }
}
