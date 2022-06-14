// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:admin_ndakikuy/shared/theme.dart';
import 'package:admin_ndakikuy/ui/pages/basecamp_page.dart';
import 'package:admin_ndakikuy/ui/pages/home_page.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({ Key? key }) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int pageIndex = 0;
  @override
  Widget build(BuildContext context) {

    Widget customBottomNavbar(){
      return BottomNavigationBar(
        currentIndex:pageIndex,
        onTap: (value){
          setState(() {
            pageIndex = value;
          });
        },
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(
            icon: Column(
              children: [
                Container(
                  child: Icon(
                    Icons.home,
                    size: 20,
                    color: pageIndex == 0 ? keyRadialColor : Colors.grey,
                  ),
                ),
                Text(
                  'Home',
                  style: TextStyle(
                    color:pageIndex == 0 ? keyRadialColor : Colors.grey,
                  ),
                )
              ],
            ),
            label: ' ',
          ),
          BottomNavigationBarItem(
            icon: Column(
              children: [
                Container(
                  child: Icon(
                    Icons.list,
                    size: 20,
                    color: pageIndex == 1 ? keyRadialColor : Colors.grey,
                  ),
                ),
                Text(
                  'Basecamp',
                  style: TextStyle(
                    color:pageIndex == 1 ? keyRadialColor : Colors.grey,
                  ),
                )
              ],
            ),
            label: ' ',
          ),
        ],
      );
    }

    Widget pageWidget(){
      switch(pageIndex){
        case 0:
          return HomePage();
        case 1:
          return BasecampPage();
        default: 
          return HomePage();
      }
    }

    return Scaffold(
      body: pageWidget(),
      bottomNavigationBar: customBottomNavbar(),
    );
  }
}