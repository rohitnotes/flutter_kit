import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_kit/kit/loading.dart';


class FlutterDialog {

  Future<bool> _future;
  Function _dismissListener;


  bool isShown() {
    return _future != null;
  }

  void dismiss(BuildContext context) {
    if (_future != null) {
      Navigator.pop(context);
    }
  }

  void setOnDismissListener(Function function) {
    _dismissListener = function;
  }

  void show(BuildContext context,
      {Widget widget, int millisecondsAutoDismiss = 0}) {
    if (_future != null) return;
    _future = Navigator.of(context).push(
      PageRouteBuilder(opaque: false, pageBuilder: (context, _, __) {
        return SafeArea(
          child: widget == null ? LoadingWidget() : widget,
        );
      }),);
    _future.whenComplete(() {
      if (_dismissListener != null) {
        _dismissListener();
      }
      _future = null;
    }).catchError(() {
      _future = null;
    },);

    if (millisecondsAutoDismiss > 0) {
      //auto dismiss
      Future.delayed(Duration(milliseconds: millisecondsAutoDismiss), () {
        dismiss(context);
      });
    }
  }


}
