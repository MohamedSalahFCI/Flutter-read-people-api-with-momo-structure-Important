import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:read_people_api_with_momo_structure/people.dart';

class PeopleReadingWidget extends StatefulWidget {
  @override
  _PeopleReadingWidgetState createState() => _PeopleReadingWidgetState();
}

class _PeopleReadingWidgetState extends State<PeopleReadingWidget> {
  final String _url = "https://swapi.co/api/people";
  List _data;

  Future<ReadPeople> getData() async {
    var res = await http
        .get(Uri.encodeFull(_url), headers: {"Accept": "application/json"});

    final _resBody = json.decode(res.body);
    return new ReadPeople.fromJson(_resBody);
  }

  Widget _listView(_data) => new ListView.builder(
        itemCount: _data == null ? 0 : _data.length,
        itemBuilder: (BuildContext context, int index) {
          return new Card(
            elevation: 4.0,
            color: Colors.grey,
            child: Container(
              height: 90,
              child: Column(
                children: <Widget>[
                  new Text(
                    _data[index].name,
                    textAlign: TextAlign.start,
                  ),
                  //new Text("${_data.length}"),
                  new Row(
                    children: <Widget>[
                      Expanded(
                        child: new ListTile(
                          title: new Text("Height"),
                          subtitle: Padding(
                              padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                              child: new Text(_data[index].height)),
                        ),
                      ),
                      Expanded(
                        //hna 3amlhom bel center wel ba2y bel padding
                        child: new ListTile(
                            title: Center(child: new Text("Hair Color")),
                            subtitle: Center(
                              child: new Text(_data[index].hair_color),
                            )),
                      ),
                      Expanded(
                        child: new ListTile(
                          title: new Text("Birth year"),
                          subtitle: Padding(
                              padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                              child: new Text(_data[index].birth_year)),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        },
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text("yes momo Real people api "),
      ),
      body: FutureBuilder<ReadPeople>(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return _listView(snapshot.data.results);
          } else if (snapshot.hasError) {
            return new Text("${snapshot.error}");
          }
          return new Center(child: new CircularProgressIndicator());
        },
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    this.getData();
  }
}
