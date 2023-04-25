import 'package:flutter/material.dart';
import 'package:winematch/screens/cellar_screen.dart';
import 'package:winematch/screens/recipe_screen.dart';
import '../widgets/wine_selection_form.dart';
import 'wine_select_screen.dart';
import 'recipe_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  MainScreenState createState() => MainScreenState();
}

class MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  List<Widget> _widgetOptions = [
    WineSelectPage(),
    RecipeScreen(),
    EntryLists()
  ];

  void _onItemTapped(int index) {
    setState(() => _selectedIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text('Winematch')),
      body: Center(child: _widgetOptions.elementAt(_selectedIndex)),
      bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
                icon: _selectedIndex == 0
                    ? const Icon(
                        Icons.search,
                        color: Colors.grey,
                      )
                    : const Icon(
                        Icons.search_off,
                        color: Colors.grey,
                      ),
                label: 'wine'),
            BottomNavigationBarItem(
                icon: _selectedIndex == 1
                    ? const Icon(
                        Icons.search,
                        color: Colors.grey,
                      )
                    : const Icon(
                        Icons.search_off,
                        color: Colors.grey,
                      ),
                label: 'recipe'),
            BottomNavigationBarItem(
                icon: _selectedIndex == 2
                    ? const Icon(
                        Icons.search,
                        color: Colors.grey,
                      )
                    : const Icon(
                        Icons.search_off,
                        color: Colors.grey,
                      ),
                label: 'cellar'),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.black,
          onTap: _onItemTapped,
          showSelectedLabels: true,
          showUnselectedLabels: false,
          type: BottomNavigationBarType.fixed),
    );
  }
}
