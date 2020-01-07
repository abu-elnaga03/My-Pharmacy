import 'package:flutter/material.dart';

class Diagnosis extends StatefulWidget {
  @override
  State<Diagnosis> createState() {
    return DiagonsisState();
  }
}

class DiagonsisState extends State<Diagnosis> {
  bool back = false;
  bool head = false;
  bool chest = false;
  bool chils = false;
  bool fever = false;
  bool fatigue = false;

  @override
  Widget build(BuildContext context) {
    bool isClickable = back || head || chest || chils || fever || fatigue;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Diagnosis',
        ),
        leading: IconButton(
            icon: Icon(Icons.arrow_back,),
            onPressed: () {
              Navigator.of(context).pop();
            }),
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(8),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 1.32,
            child: GridView(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 3 / 2.5,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 8),
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    InkWell(
                      child: GridTile(
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          child: Image.network(
                            'https://scx1.b-cdn.net/csz/news/800/2018/backpainwere.jpg',
                            height: 75,
                            fit: BoxFit.fill,
                          ),
                        ),
                        footer: ClipRRect(
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(20),
                              bottomLeft: Radius.circular(20)),
                          child: GridTileBar(
                            leading: Text(
                              'Back Pain',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            backgroundColor: Colors.grey.withOpacity(0.5),
                          ),
                        ),
                      ),
                      onTap: () {
                        setState(() {
                          back = !back;
                        });
                        print(back);
                      },
                    ),
                    back == true
                        ? Positioned(
                            child: Icon(
                              Icons.check_circle,
                              size: 30,
                              color: Colors.green,
                            ),
                            top: 10,
                            right: 10,
                          )
                        : Container()
                  ],
                ),
                Stack(
                  children: <Widget>[
                    InkWell(
                      child: GridTile(
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          child: Image.network(
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQPVL-86BkZrH-RmY0r72V0myOSNXPe2CLNrv1Te_zYhRqGdJrz9A&s',
                            height: 75,
                            fit: BoxFit.fill,
                          ),
                        ),
                        footer: ClipRRect(
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(20),
                              bottomLeft: Radius.circular(20)),
                          child: GridTileBar(
                            leading: Text(
                              'Headach',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            backgroundColor: Colors.grey.withOpacity(0.5),
                          ),
                        ),
                      ),
                      onTap: () {
                        setState(() {
                          head = !head;
                        });
                        print(head);
                      },
                    ),
                    head == true
                        ? Positioned(
                            child: Icon(
                              Icons.check_circle,
                              size: 30,
                              color: Colors.green,
                            ),
                            top: 10,
                            right: 10,
                          )
                        : Container()
                  ],
                ),
                Stack(
                  children: <Widget>[
                    InkWell(
                      child: GridTile(
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          child: Image.network(
                            'https://www.healthxchange.sg/sites/hexassets/Assets/heart-lungs/medication-to-manage-chest-pain-angina.jpg',
                            height: 75,
                            fit: BoxFit.fill,
                          ),
                        ),
                        footer: ClipRRect(
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(20),
                              bottomLeft: Radius.circular(20)),
                          child: GridTileBar(
                            leading: Text(
                              'Chest Pain',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            backgroundColor: Colors.grey.withOpacity(0.5),
                          ),
                        ),
                      ),
                      onTap: () {
                        setState(() {
                          chest = !chest;
                        });
                        print(chest);
                      },
                    ),
                    chest == true
                        ? Positioned(
                            child: Icon(
                              Icons.check_circle,
                              size: 30,
                              color: Colors.green,
                            ),
                            top: 10,
                            right: 10,
                          )
                        : Container()
                  ],
                ),
                Stack(
                  children: <Widget>[
                    InkWell(
                      child: GridTile(
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          child: Image.network(
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQqWYv0t5C06e2FAfJghNJjr3eER7j9RwmRvLhbZm9KixdXix9m&s',
                            height: 75,
                            fit: BoxFit.fill,
                          ),
                        ),
                        footer: ClipRRect(
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(20),
                              bottomLeft: Radius.circular(20)),
                          child: GridTileBar(
                            leading: Text(
                              'Chills',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            backgroundColor: Colors.grey.withOpacity(0.5),
                          ),
                        ),
                      ),
                      onTap: () {
                        setState(() {
                          chils = !chils;
                        });
                        print(chils);
                      },
                    ),
                    chils == true
                        ? Positioned(
                            child: Icon(
                              Icons.check_circle,
                              size: 30,
                              color: Colors.green,
                            ),
                            top: 10,
                            right: 10,
                          )
                        : Container()
                  ],
                ),
                Stack(
                  children: <Widget>[
                    InkWell(
                      child: GridTile(
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          child: Image.network(
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRyVcUL6cjJB7eyhpetsD8YuTOwHKRyCmUQ3NHmM2rMvtSQx9Ki&s',
                            height: 75,
                            fit: BoxFit.fill,
                          ),
                        ),
                        footer: ClipRRect(
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(20),
                              bottomLeft: Radius.circular(20)),
                          child: GridTileBar(
                            leading: Text(
                              'Fever',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            backgroundColor: Colors.grey.withOpacity(0.5),
                          ),
                        ),
                      ),
                      onTap: () {
                        setState(() {
                          fever = !fever;
                        });
                        print(fever);
                      },
                    ),
                    fever == true
                        ? Positioned(
                            child: Icon(
                              Icons.check_circle,
                              size: 30,
                              color: Colors.green,
                            ),
                            top: 10,
                            right: 10,
                          )
                        : Container()
                  ],
                ),
                Stack(
                  children: <Widget>[
                    InkWell(
                      child: GridTile(
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          child: Image.network(
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRonTzMfZhsSwZcIBMQ7mITe8lEi4oUJvzEGUeRy4HR26kC1jkS&s',
                            height: 75,
                            fit: BoxFit.fill,
                          ),
                        ),
                        footer: ClipRRect(
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(20),
                              bottomLeft: Radius.circular(20)),
                          child: GridTileBar(
                            leading: Text(
                              'Fatigue',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            backgroundColor: Colors.grey.withOpacity(0.5),
                          ),
                        ),
                      ),
                      onTap: () {
                        setState(() {
                          fatigue = !fatigue;
                        });
                        print(fatigue);
                      },
                    ),
                    fatigue == true
                        ? Positioned(
                            child: Icon(
                              Icons.check_circle,
                              size: 30,
                              color: Colors.green,
                            ),
                            top: 10,
                            right: 10,
                          )
                        : Container()
                  ],
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical:8,horizontal: 16),
            child: RaisedButton(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              disabledColor: Colors.grey,
              color: Colors.red,
              onPressed: isClickable
                  ? () {
                      _displayDialog(context);
                    }
                  : null,
              elevation: 11,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(40.0))),
              child: Text("Start Diagnosing",
                  style: TextStyle(color: Colors.white, fontSize: 20)),
            ),
          ),
        ],
      ),
    );
  }

  TextEditingController _textFieldController = TextEditingController();

  _displayDialog(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('When did all this start'),
          content: TextField(
            controller: _textFieldController,
            decoration: InputDecoration(hintText: "TextField in Dialog"),
          ),
          actions: <Widget>[
            FlatButton(
              child: new Text('CANCEL'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            FlatButton(
              child: new Text('SUBMIT'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        );
      },
    );
  }
}
