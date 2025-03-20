import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:fancy/screens/cart/cart.dart';
import 'package:fancy/screens/favorites/fav.dart';
import 'package:fancy/screens/home/home_content.dart';
import 'package:fancy/screens/profile/profile.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> screens = [HomeContent(), Fav(), ShopList(), Profile()];
  int _screenIndex = 0;
  void changeScreen(int index) {
    setState(() {
      _screenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: screens[_screenIndex],
      bottomNavigationBar: ConvexAppBar(
        style: TabStyle.reactCircle,
        backgroundColor: Color.fromARGB(255, 165, 81, 139),
        items: [
          TabItem(icon: Icons.home, title: 'Home'),
          TabItem(icon: Icons.favorite, title: 'Favorites'),
          TabItem(icon: Icons.shopping_cart, title: 'Cart'),
          TabItem(icon: Icons.people, title: 'Profile'),
        ],
        onTap: (int i) {
          changeScreen(i);
        },
      ),
    );
  }
}
