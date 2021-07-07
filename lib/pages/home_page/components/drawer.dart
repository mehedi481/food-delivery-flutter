import 'package:flutter/material.dart';
import 'package:food_delivery/helper/image_path.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Color(0xff3a3e3e),
        child: SafeArea(
            child: ListView(
          children: [
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  Colors.red,
                  Colors.blue,
                  Colors.yellow,
                ]),
              ),
              accountName: Text("Mehedi Hasan"),
              accountEmail: Text("mehedihasan.cse.info@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage(ImagePath.person),
              ),
            ),
            ListTile(
              onTap: () {
                
              },
              leading: Icon(
                Icons.person,
                color: Colors.white,
              ),
              title: Text(
                "Profile",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            ListTile(
              onTap: () {},
              leading: Icon(
                Icons.shopping_cart_outlined,
                color: Colors.white,
              ),
              title: Text(
                "Cart",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            ListTile(
              onTap: () {},
              leading: Icon(
                Icons.store,
                color: Colors.white,
              ),
              title: Text(
                "Order",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            ListTile(
              onTap: () {},
              leading: Icon(
                Icons.info,
                color: Colors.white,
              ),
              title: Text(
                "About",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            Divider(
              thickness: 3,
              color: Colors.white,
            ),
            ListTile(
              leading: Text(
                "Communicate",
                style: TextStyle(color: Colors.white),
              ),
            ),
            ListTile(
              onTap: () {},
              leading: Icon(
                Icons.lock,
                color: Colors.white,
              ),
              title: Text(
                "Change",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            ListTile(
              onTap: () {},
              leading: Icon(
                Icons.logout,
                color: Colors.white,
              ),
              title: Text(
                "Log out",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        )),
      ),
    );
  }
}
