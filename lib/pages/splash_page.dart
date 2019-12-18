import 'dart:async';

import 'package:flutter/material.dart';

import 'main_page.dart';

class SplashWidget extends StatefulWidget {
  @override
  _SplashWidgetState createState() => _SplashWidgetState();
}

class _SplashWidgetState extends State<SplashWidget> {
  var mainPage = MainPage();
  var hideContent = false;

  var splashTextStyle = TextStyle(color: Colors.black, fontSize: 18.0);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Offstage(
          offstage: !hideContent,
          child: mainPage,
        ),
        Offstage(
          offstage: hideContent,
          child: SafeArea(
            child: Stack(
              alignment: AlignmentDirectional.topEnd,
              children: <Widget>[
                Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Center(
                        child: Text(
                          "Code Viewer",
                          style: TextStyle(color: Colors.black, fontSize: 28.0),
                        ),
                      ),
                      Center(
                        child: Text(
                          "View Code Everywhere",
                          style: splashTextStyle,
                        ),
                      )
                    ],
                  ),
                ),
                Positioned(
                  child: CountDownWidget(
                    onCountDownFinishCallBack: (bool isFinish) {
                      setState(() {
                        hideContent = true;
                      });
                    },
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}

class CountDownWidget extends StatefulWidget {
  final onCountDownFinishCallBack;

  CountDownWidget({Key key, @required this.onCountDownFinishCallBack})
      : super(key: key);

  @override
  _CountDownWidgetState createState() => _CountDownWidgetState();
}

class _CountDownWidgetState extends State<CountDownWidget> {
  var _seconds = 6;
  Timer _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30.0,
      alignment: Alignment.center,
      height: 30.0,
      decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.all(Radius.circular(15.0))),
      child: Text(
        '$_seconds',
        style: TextStyle(fontSize: 17.0, color: Colors.white),
      ),
    );
  }

  /// 启动倒计时的计时器。
  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {});
      if (_seconds <= 1) {
        widget.onCountDownFinishCallBack(true);
        _cancelTimer();
        return;
      }
      _seconds--;
    });
  }

  /// 取消倒计时的计时器。
  void _cancelTimer() {
    _timer?.cancel();
  }
}
