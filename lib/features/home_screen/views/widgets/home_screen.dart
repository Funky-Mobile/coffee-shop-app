import 'package:coffee_shop_app/core/constants/app_assets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int _selectedIndex = 0;

  final List<Widget> _pages = [
    Text("Home"),
    Text("Scan / Pay"),
    Text("Order"),
    Text("Account"),
    Text("Rewards")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xEEF6F2ED),
        leading: IconButton(
          onPressed: () {
            ///Todo: Open drawer
          },
          icon: Icon(
            Icons.menu_rounded,
            size: 40.0,
          )
        ),
        title: Image.asset(
          AppAssets.appIcon,
          height: 40.0,
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Stack(
              children: [
                IconButton(
                  onPressed: () {
                    ///Todo: Open cart
                  },
                  icon: Image.asset(
                    AppAssets.cartIcon,
                    height: 32.0,
                  )
                ),

                Positioned(
                  right: 0,
                  child: Container(
                    padding: const EdgeInsets.all(4.0),
                    decoration: BoxDecoration(
                      color: Color(0xEE4E8D7C),
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.black
                      )
                    ),
                    child: Text("99")
                  ),
                )
              ],
            ),
          )
        ],
      ),
      body: Center(
        child: _pages[_selectedIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey.shade400,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home),
            label: "Home"
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.qrcode_viewfinder),
            label: "Scan / Pay"
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.coffee),
            label: "Order"
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.profile_circled),
            label: "Account"
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.star),
            label: "Rewards"
          ),
        ]
      ),
    );
  }
}
