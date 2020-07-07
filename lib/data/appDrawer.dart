import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  Widget _createHeader() {
    return UserAccountsDrawerHeader(
        accountName: Text("John Smith"),
        accountEmail: Text("johnsmith@gmail.com"),
        currentAccountPicture: CircleAvatar(
          backgroundColor: Colors.amber,
          backgroundImage: NetworkImage(
              "https://images.unsplash.com/photo-1527980965255-d3b416303d12?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60"),
        ));
  }

  Widget _createDrawerItem(
      {IconData icon, String text, GestureTapCallback onTap}) {
    return ListTile(
      title: Row(
        children: <Widget>[
          Icon(icon),
          Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text(text),
          )
        ],
      ),
      onTap: () {},
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          _createHeader(),
          _createDrawerItem(
            icon: Icons.notifications_active,
            text: 'Notifications',
          ),
          _createDrawerItem(
            icon: Icons.bookmark,
            text: 'Wishlist',
          ),
          Divider(),
          _createDrawerItem(icon: Icons.feedback, text: 'Help & feedback'),
          _createDrawerItem(icon: Icons.info, text: 'About Cream Hub'),
          Divider(),
          _createDrawerItem(icon: Icons.bug_report, text: 'Report an issue'),
          ListTile(
            title: Text('0.0.1'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
