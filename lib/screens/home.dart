import 'package:flutter/material.dart';
import 'package:firstapp/data/mainMenu.dart';
import 'package:firstapp/data/appDrawer.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:firstapp/screens/cartPage.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final itemStyle =
      TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 12);

  final headerStyle =
      TextStyle(color: Colors.black, fontFamily: 'Albertiny', fontSize: 40);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: mainChoice.length,
      child: Scaffold(
        drawer: Drawer(child: SafeArea(top: false, child: AppDrawer())),
        appBar: AppBar(
          backgroundColor: Colors.amber,
          centerTitle: true,
          title: Text("Cream Hub", style: headerStyle),
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.shopping_cart),
                color: Colors.black,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CartPage()),
                  );
                })
          ],
          bottom: TabBar(
            isScrollable: true,
            tabs: mainChoice.map((choice) {
              return Tab(
                text: choice['name'],
                icon: Icon(choice['icon']),
              );
            }).toList(),
          ),
        ),
        body: TabBarView(
          children: mainChoice.map((element) {
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, crossAxisSpacing: 5, mainAxisSpacing: 0),
              itemCount: element['subMenu'].length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Card(
                      color: Colors.black,
                      elevation: 10.0,
                      child: Stack(
                        fit: StackFit.expand,
                        children: <Widget>[
                          ColorFiltered(
                            colorFilter: ColorFilter.mode(
                                Colors.black.withOpacity(0.4),
                                BlendMode.dstATop),
                            child: CachedNetworkImage(
                              imageUrl: element['subMenu'][index]['img'],
                              fit: BoxFit.cover,
                              progressIndicatorBuilder:
                                  (context, url, downloadProgress) => Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  SizedBox(
                                    width: 20,
                                    height: 20,
                                    child: CircularProgressIndicator(
                                        value: downloadProgress.progress),
                                  ),
                                ],
                              ),
                              errorWidget: (context, url, error) =>
                                  Icon(Icons.error),
                            ),
                          ),
                          Center(
                            child: Text(
                              element['subMenu'][index]['name'],
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  color: Colors.white),
                            ),
                          ),
                        ],
                      )),
                );
              },
            );
          }).toList(),
        ),
      ),
    );
  }
}
