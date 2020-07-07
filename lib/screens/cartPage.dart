import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.amber,
          centerTitle: true,
          title: Text("Your Cart")),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          CachedNetworkImage(
            imageUrl: "https://findliquidation.com/assets/image/empty.png",
            fit: BoxFit.cover,
            placeholder: (context, url) => CircularProgressIndicator(),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Text(
              "YOUR CART IS EMPTY",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: Text("Please add some items from the menu"),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: RaisedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              color: Colors.amber,
              child: Text(
                "EXPLORE MENU",
                style: TextStyle(color: Colors.black),
              ),
            ),
          )
        ],
      )),
    );
  }
}
