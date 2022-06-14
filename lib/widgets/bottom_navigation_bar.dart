import 'package:flutter/material.dart';
import 'package:tubes_abp_flutter/screen/home_screen.dart';
import 'package:tubes_abp_flutter/screen/news_screen.dart';
import 'package:tubes_abp_flutter/screen/paket_screen.dart';
import 'package:tubes_abp_flutter/screen/rent_screen.dart';

class BottomNavigationBarGoWis extends StatefulWidget {
  const BottomNavigationBarGoWis({Key? key}) : super(key: key);

  @override
  State<BottomNavigationBarGoWis> createState() =>
      _BottomNavigationBarGoWisState();
}

class _BottomNavigationBarGoWisState extends State<BottomNavigationBarGoWis> {
  int _selectedIndex = 0;

  final List<Widget> _children = [
    // const Text('home'),
    const HomeScreen(),
    const NewsScreen(),
    const PaketScreen(),
    const RentScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // var bottomNavStyle =
  //     GoogleFonts.lato(fontSize: 12, fontWeight: FontWeight.w500);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.newspaper),
            label: 'News',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.villa),
            label: 'Paket',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.car_rental),
            label: 'Rental',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.red,
        onTap: _onItemTapped,
        backgroundColor: Colors.transparent,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: true,
        showUnselectedLabels: false,
        elevation: 0,
      ),
    );
  }
}

        // currentIndex: _selectedIndex,
        // onTap: _onItemTapped,
        // backgroundColor: Colors.transparent,
        // type: BottomNavigationBarType.fixed,
        // selectedFontSize: 12,