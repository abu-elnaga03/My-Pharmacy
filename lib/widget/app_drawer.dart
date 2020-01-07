import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            title: Text('Hello Friend!'),
            automaticallyImplyLeading: false,
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.shop),
            title: Text('Drugs'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/drugs');
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.view_list),
            title: Text('Mediacl Tips'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/drugs');
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.view_list),
            title: Text('Chat A Doctor'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/drugs');
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.payment),
            title: Text('Orders'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/orders');
              // Navigator.of(context).pushReplacement(
              //   CustomRoute(
              //     builder: (ctx) => OrdersScreen(),
              //   ),
              // );
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.healing),
            title: Text('Diagnosis'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/diagnosis');
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Logout'),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).pushReplacementNamed('/');
              FirebaseAuth.instance.signOut();
            },
          ),
        ],
      ),
    );
  }
}
