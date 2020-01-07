import 'Package:flutter/material.dart';
import 'package:my_pharmacy/screen/home.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Pharmacy'),
      ),
      body: HomeButtons(),
      floatingActionButton: FloatingActionButton(
        onPressed: (){

        },
        child: Icon(Icons.location_city,size: 35,),
        tooltip: 'Near Houspital',
      ),
    );
  }
}
