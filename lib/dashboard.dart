import 'package:bloodbankapp1/account.dart';
import 'package:bloodbankapp1/home.dart';
import 'package:bloodbankapp1/registration.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int curentIndex=0;
  List<Widget>pages=[Homepage(),Registration(),Account()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[curentIndex],
      bottomNavigationBar: BottomNavigationBar(
        elevation: 10,
        currentIndex:curentIndex,
        selectedItemColor: Color(0xe5e91d62),
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.shifting,
        onTap: (int a){
          setState(() {
            curentIndex=a;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home),label:"home"),
          BottomNavigationBarItem(icon: Icon(Icons.add),label:'New',tooltip: 'Register Donner'),
          BottomNavigationBarItem(icon: Icon(Icons.person),label:"profile"),
        ],),

    );
  }
}
