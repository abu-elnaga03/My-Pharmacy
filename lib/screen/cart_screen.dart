import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/cart.dart' show Cart;
import '../widget/cart_item.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/cart';

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Cart'),
      ),
      body: Column(
        children: <Widget>[
          Card(
            margin: EdgeInsets.all(15),
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Total',
                    style: TextStyle(fontSize: 20),
                  ),
                  Spacer(),
                  Chip(
                    label: Text(
                      '\$${cart.totalAmount.toStringAsFixed(2)}',
                      style: TextStyle(
                        color: Theme.of(context).primaryTextTheme.title.color,
                      ),
                    ),
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                  OrderButton(cart: cart)
                ],
              ),
            ),
          ),
          SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: cart.items.length,
              itemBuilder: (ctx, i) => CartItem(
                cart.items.values.toList()[i].id,
                cart.items.keys.toList()[i],
                cart.items.values.toList()[i].price,
                cart.items.values.toList()[i].quantity,
                cart.items.values.toList()[i].title,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class OrderButton extends StatefulWidget {
  const OrderButton({
    Key key,
    @required this.cart,
  }) : super(key: key);

  final Cart cart;

  @override
  _OrderButtonState createState() => _OrderButtonState();
}

class _OrderButtonState extends State<OrderButton> {
  var _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      child: _isLoading ? CircularProgressIndicator() : Text('ORDER NOW'),
      onPressed: (widget.cart.totalAmount <= 0 || _isLoading)
          ? null
          : () async {
              setState(() {
                _isLoading = true;
              });
              String uid = 'QsCGUtt2kWT8nTv11mb3OYv86bC3';
              List<Map<String, Object>> orders = [];
              widget.cart.items.forEach((id, item) {
                Map<String, Object> map = {
                  'name': item.title,
                  'price': item.price,
                  'quantity': item.quantity,
                  'pharmacy': id,
                };
                orders.add(map);
              });
              Firestore.instance
                  .collection('users')
                  .document(uid)
                  .collection('orders')
                  .add(
                {
                  'orders': orders,
                  'totalAmount': widget.cart.totalAmount,
                  'date': DateTime.now()
                },
              );
              widget.cart.items.values.forEach((item) {
                Firestore.instance
                    .collection('Pharmacies')
                    .document(item.pharmacyID)
                    .collection('orders')
                    .add({
                  'user': uid,
                  'title': item.title,
                  'quantity': item.quantity,
                  'date': DateTime.now()
                });
              });
              setState(() {
                _isLoading = false;
              });
              widget.cart.clear();
              Navigator.of(context).pushNamed('/orders');
            },
      textColor: Theme.of(context).primaryColor,
    );
  }
}
