import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(
                color: Colors.amber.shade900,
                image: const DecorationImage(
                  image: AssetImage("assets/mountain.jpeg"),
                  fit: BoxFit.cover,
                )),
            accountName: const Text(
              "Isah",
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
            accountEmail: const Text(
              "isah@gmail.com",
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.asset(
                  "assets/hiking.png",
                  fit: BoxFit.cover,
                  width: 90,
                  height: 90,
                ),
              ),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.shop_sharp,
              color: Colors.amber.shade900,
              size: 30,
            ),
            title: Text('Orders'),
            onTap: () => null,
            trailing: ClipOval(
              child: Container(
                color: Colors.red,
                width: 20,
                height: 20,
                child: const Center(
                  child: Text(
                    '8',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.edit_note,
              color: Colors.amber.shade900,
              size: 35,
            ),
            title: Text('Edit Personal Information'),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(
              Icons.delete_sharp,
              color: Colors.amber.shade900,
              size: 35,
            ),
            title: Text('Delete account'),
            onTap: () => null,
          ),
        ],
      ),
    );
  }
}
