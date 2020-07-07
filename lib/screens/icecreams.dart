import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class IceCreamPage extends StatefulWidget {
  @override
  _IceCreamPageState createState() => _IceCreamPageState();
}

class _IceCreamPageState extends State<IceCreamPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(
          child: Text("This is a Drawer"),
        ),
        body: SingleChildScrollView(
          child: Card(
            semanticContainer: true,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            elevation: 5,
            margin: EdgeInsets.all(10),
            child: Column(
              children: <Widget>[
                CachedNetworkImage(
                  imageUrl:
                      "https://images.herzindagi.info/image/2020/Jun/chocolate-parle-g-ice-cream.jpg",
                  placeholder: (context, url) => SizedBox(
                      height: 50.0,
                      width: 50.0,
                      child: CircularProgressIndicator(strokeWidth: 5.0)),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "DARK CHOCOLATE ICECREAM",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10, 30, 10, 20),
                          child: Text(
                            "\u20B9 500",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                        ),
                        IconButton(
                            icon: Icon(
                              Icons.favorite_border,
                              color: Colors.red[900],
                            ),
                            onPressed: () {})
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: RaisedButton(
                            onPressed: () {},
                            color: Colors.amber,
                            child: Text(
                              "BUY",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
