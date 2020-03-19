import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var date = new DateTime.fromMicrosecondsSinceEpoch(1584643039642);
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 30.0, left: 15, right: 15),
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.fitWidth,
                      image: NetworkImage(
                          "https://cdn.dribbble.com/users/1873131/screenshots/10733292/media/f70dce9f2b3d9906c056945073354806.jpg")),
                  borderRadius: BorderRadius.circular(10),
                ),
                height: 200,
                width: double.infinity,
                child: Container(
                  height: 200,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Text('Cases - 237283'),
                        Text('Deaths - 9837'),
                        Text("Recovered - 86675"),
                        Text("Update Time - $date")
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Tab(text:"Hello")
          ],
        ),
      ),
    );
  }
}
