import 'package:flutter/material.dart';

import '../models/ListModels.dart';

class HomeScreen extends StatefulWidget {
  String username;
  String password;
  String gender;
  HomeScreen(
      {required this.username, required this.password, required this.gender});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index = 0;

  List<HomeModel> profile = [
    HomeModel(
        name: "Afra",
        image: AssetImage("img1.jpg"),
        icon: Icon(Icons.people),
        subtitle: "I am Afra "),
    HomeModel(
        name: "Aafrin",
        image: AssetImage("img1.jpg"),
        icon: Icon(Icons.people),
        subtitle: "I am Aafrin "),
    HomeModel(
        name: "Rooban",
        image: AssetImage("img1.jpg"),
        icon: Icon(Icons.people),
        subtitle: "I am Rooban"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[200],
        title: Text("Contacts"),
        actions: [
          IconButton(onPressed: (() {}), icon: Icon(Icons.search)),
          IconButton(onPressed: (() {}), icon: Icon(Icons.more_vert))
        ],
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
                child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 5,
                mainAxisSpacing: 5,
              ),
              itemCount: profile.length,
              itemBuilder: (context, index) {
                return GridTile(
                    child: Column(
                  children: [
                    Container(
                      child: CircleAvatar(
                        backgroundImage: profile[index].image,
                        radius: 50,
                      ),
                    ),
                    Container(
                      child: Text(profile[index].name),
                    ),
                    Container(
                      child: Text(profile[index].subtitle),
                    ),
                    Container(
                      child: profile[index].icon,
                    )
                  ],
                ));
              },
            )

                // // scrollDirection: Axis.horizontal,

                ),
            Expanded(
              child: ListView.builder(
                itemCount: profile.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: profile[index].image,
                      radius: 20,
                    ),
                    title: Text(profile[index].name),
                    subtitle: Text(profile[index].subtitle),
                    trailing: profile[index].icon,
                  );
                },
              ),
            )
          ],
        ),
      ),
      drawer: Drawer(
        backgroundColor: Colors.red[200],
        child: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            CircleAvatar(
                radius: 70,
                backgroundColor: Colors.transparent,
                backgroundImage: NetworkImage(
                    "https://images.unsplash.com/photo-1661956600684-97d3a4320e45?ixlib=rb-4.0.3&ixid=MnwxMjA3fDF8MHxzZWFyY2h8MXx8ZGV2ZWxvcGVyfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60")),
            SizedBox(
              height: 10,
            ),
            Text(
              widget.username,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
            SizedBox(
              height: 10,
            ),
            // ignore: prefer_const_constructors
            Divider(
              thickness: 2,
              color: const Color.fromARGB(255, 37, 37, 37),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text("Profile"),
            ),
            ListTile(
              leading: Icon(Icons.favorite_border),
              title: Text("Favorite"),
            ),
            ListTile(
              leading: Icon(Icons.notifications),
              title: Text("Notification"),
            ),
            ListTile(
              leading: Icon(Icons.phone),
              title: Text("Call"),
            ),
            SizedBox(
              height: 10,
            ),
            Divider(
              thickness: 2,
              color: Color.fromARGB(255, 37, 37, 37),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.brown[800]),
                ),
                child: Text("Sign Out")),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.brown,
          unselectedItemColor: Colors.brown,
          currentIndex: index,
          onTap: (value) {
            setState(() {
              index = value;
              // print(index);
            });
          },
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.shopping_bag_outlined,
                  color: Colors.brown[800],
                ),
                label: "shopping",
                activeIcon: Icon(
                  Icons.shopping_bag_outlined,
                  size: 40,
                  color: Colors.white,
                )),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.shopping_cart,
                  color: Colors.brown[800],
                ),
                label: "cart",
                activeIcon: Icon(
                  Icons.shopping_cart,
                  size: 40,
                  color: Colors.white,
                )),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.favorite,
                  color: Colors.brown[800],
                ),
                label: "favorite",
                activeIcon: Icon(
                  Icons.favorite,
                  size: 40,
                  color: Colors.white,
                ))
          ],
          backgroundColor: Colors.red[300]),
    );
  }
}
