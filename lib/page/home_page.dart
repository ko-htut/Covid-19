import 'package:corona/model/country.dart';
import 'package:corona/utils/net_utils.dart';
import 'package:corona/widget/widget_sliver_future_builder.dart';
import 'package:horizontal_data_table/horizontal_data_table.dart';
// import 'package:dio/dio.dart' as dio ;
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Future<List<Country>> getProjectDetails() async {
      var projetcList = await http.get("https://corona.lmao.ninja/countries");

      return countryFromJson(projetcList.body);
    }

    var date = new DateTime.fromMicrosecondsSinceEpoch(1584658750503);
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
                  width: double.infinity,
                  child: Stack(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          height: 80,
                          // color: Colors.green,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              Text('Cases - 244739'),
                              Text('Deaths - 10024'),
                              Text("Recovered - 87407"),
                              Text("Update Time - $date")
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
                height: MediaQuery.of(context).size.height - 230,
                child: FutureBuilder(
                  future: getProjectDetails(),
                  builder: (context, projectSnap) {
                    if (projectSnap.connectionState == ConnectionState.none &&
                        projectSnap.hasData == null) {
                      return Container();
                    }
                    return HorizontalDataTable(
                      leftHandSideColumnWidth: 100,
                      rightHandSideColumnWidth: 640,
                      isFixedHeader: true,
                      headerWidgets: _getTitleWidget(),
                      leftSideItemBuilder: (BuildContext context, int index) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              child: Text(projectSnap.data[index].country,
                                  style: TextStyle(
                                    color:
                                        (projectSnap.data[index].todayDeaths >
                                                projectSnap.data[index].active
                                            ? Colors.red
                                            : Colors.green),
                                    fontWeight: FontWeight.bold,
                                  )),
                              width: 75,
                              height: 52,
                              padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                              alignment: Alignment.centerLeft,
                            ),
                          ],
                        );
                      },
                      rightSideItemBuilder: (BuildContext context, int index) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              child: Text(
                                  projectSnap.data[index].cases.toString(),
                                  style: TextStyle(color: Colors.black)),
                              width: 80,
                              height: 52,
                              padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                              alignment: Alignment.centerLeft,
                            ),
                            Container(
                              child: Text(
                                  projectSnap.data[index].todayCases.toString(),
                                  style: TextStyle(color: Colors.black)),
                              width: 80,
                              height: 52,
                              padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                              alignment: Alignment.centerLeft,
                            ),
                            Container(
                              child: Text(
                                  projectSnap.data[index].deaths.toString(),
                                  style: TextStyle(color: Colors.black)),
                              width: 80,
                              height: 52,
                              padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                              alignment: Alignment.centerLeft,
                            ),
                            Container(
                              child: Text(
                                  projectSnap.data[index].todayDeaths
                                      .toString(),
                                  style: TextStyle(color: Colors.black)),
                              width: 80,
                              height: 52,
                              padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                              alignment: Alignment.centerLeft,
                            ),
                            Container(
                              child: Text(
                                  projectSnap.data[index].recovered.toString(),
                                  style: TextStyle(color: Colors.black)),
                              width: 80,
                              height: 52,
                              padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                              alignment: Alignment.centerLeft,
                            ),
                            Container(
                              child: Text(
                                  projectSnap.data[index].active.toString(),
                                  style: TextStyle(color: Colors.black)),
                              width: 80,
                              height: 52,
                              padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                              alignment: Alignment.centerLeft,
                            ),
                            Container(
                              child: Text(
                                  projectSnap.data[index].critical.toString(),
                                  style: TextStyle(color: Colors.black)),
                              width: 80,
                              height: 52,
                              padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                              alignment: Alignment.centerLeft,
                            ),
                            Container(
                              child: Text(
                                  projectSnap.data[index].casesPerOneMillion
                                      .toString(),
                                  style: TextStyle(color: Colors.black)),
                              width: 80,
                              height: 52,
                              padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                              alignment: Alignment.centerLeft,
                            ),
                          ],
                        );
                      },
                      itemCount: projectSnap.data == null
                          ? 0
                          : projectSnap.data.length,
                      rowSeparatorWidget: const Divider(
                        height: 1.0,
                        thickness: 0.0,
                      ),
                    );
                  },
                )),
          ],
        ),
      ),
    );
  }

  List<Widget> _getTitleWidget() {
    return [
      _getTitleItemWidget('Country', 75),
      _getTitleItemWidget('Cases', 80),
      _getTitleItemWidget('Today Cases', 80),
      _getTitleItemWidget('Deaths', 80),
      _getTitleItemWidget('Today Deaths', 80),
      _getTitleItemWidget('Recovered', 80),
      _getTitleItemWidget('Active', 80),
      _getTitleItemWidget('Critical', 80),
      _getTitleItemWidget('Cases Per OneMillion', 80),
    ];
  }

  Widget _getTitleItemWidget(String label, double width) {
    return Container(
      child: Text(label,
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
      width: width,
      height: 56,
      padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
      alignment: Alignment.centerLeft,
    );
  }
}
