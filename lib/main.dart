import 'package:flutter/material.dart';
import 'package:my_pharmacy/providers/cart.dart';
import 'package:my_pharmacy/screen/HomePage.dart';
import 'package:my_pharmacy/screen/SignIn.dart';
import 'package:my_pharmacy/screen/cart_screen.dart';
import 'package:my_pharmacy/screen/diganosis.dart';
import 'package:my_pharmacy/screen/doctor_screen.dart';
import 'package:my_pharmacy/screen/drug_list.dart';
import 'package:my_pharmacy/screen/login_page.dart';
import 'package:my_pharmacy/screen/messanging.dart';
import 'package:my_pharmacy/screen/orders_screen.dart';
import 'package:my_pharmacy/screen/page_signup.dart';
import 'package:my_pharmacy/screen/products_overview_screen.dart';
import 'package:my_pharmacy/screen/tips.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Cart>.value(value: Cart(),child:  MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
        accentColor: Colors.redAccent
      ),
      home: DoctorScreen(),
      routes: {
        '/login':(context)=>SignIn(),
        '/diagnosis':(context)=>Diagnosis(),
        '/signup': (context) => SignUpPage(),
        '/drugs':(context)=>DrugList(),
        '/pharmacies':(context)=>ProductsOverviewScreen(),
        '/tips':(context)=>Tips(),
        '/home':(context)=> MyHomePage(),
        '/cart':(context)=>CartScreen(),
        '/orders': (context)=>OrdersScreen(),
        '/chat':(context)=>DoctorScreen(),
      },
    ),);
  }

}
