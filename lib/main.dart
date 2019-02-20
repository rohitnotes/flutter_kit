import 'package:flutter/material.dart';
import 'kit/flutter_dialog.dart';
import 'package:flutter/scheduler.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(

      home: HomePage(),
    );
  }
}


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {

  FlutterDialog dialog = new FlutterDialog();

  @override
  void initState() {
    dialog.setOnDismissListener(() {
      print("dismissed");
    });
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      dialog.show(context, millisecondsAutoDismiss: 5000);
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("kit Demo"),
      ),

      body: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(top: 15.0, bottom: 15.0,),
            child: InkWell(
              onTap: () {
                dialog.show(context);
                Future.delayed(Duration(seconds: 4), () {
                  dialog.dismiss(context);
                });
              },
              child: Center(
                  child: Text(
                    "加载中对话框", style: TextStyle(fontSize: 16),)),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 15.0, bottom: 15.0,),
            child: InkWell(
              onTap: () {
                dialog.show(context, millisecondsAutoDismiss: 500);
              },
              child: Center(
                  child: Text(
                    "加载成功对话框", style: TextStyle(fontSize: 16),)),
            ),
          ),
        ],
      ),
    );
  }
}
