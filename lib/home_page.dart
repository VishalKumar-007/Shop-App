import 'package:flutter/material.dart';
import 'package:shop_app/home_page_cart_tab.dart';
import 'package:shop_app/home_page_product_tab.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPage = 0;

  List<Widget> pages = const [
    HomePageProductTab(),
    HomePageCartTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // IndexedStack save states of screen
      // so that homePage() scrolled position will be maintained
      // when we return back to homePage() from cartPage()
      body: IndexedStack(
        index: currentPage,
        children: pages,
      ),
      // bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        // selected & unselected font size = 0
        // ensures label of bottomNavigationBar item doesn't take space
        selectedFontSize: 0,
        unselectedFontSize: 0,
        iconSize: 35,
        onTap: (value) {
          setState(() {
            currentPage = value;
          });
        },
        currentIndex: currentPage,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: '',
          ),
        ],
      ),
    );
  }
}
