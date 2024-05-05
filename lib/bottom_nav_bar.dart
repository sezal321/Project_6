import 'package:flutter/material.dart';
import 'package:project6/features/homepage.dart';

class Bottomnavbar extends StatefulWidget {
  const Bottomnavbar({super.key});

  @override
  State<Bottomnavbar> createState() => _BottomnavbarState();
}

class _BottomnavbarState extends State<Bottomnavbar> {
  int bottomNavIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: bottomnavBody(bottomNavIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: [

          BottomNavigationBarItem(

            activeIcon: Icon(Icons.home,color: Colors.blue),
            icon: Icon(Icons.home_outlined,color: Colors.blue),
            label: 'home',
          ),

          BottomNavigationBarItem(
            activeIcon: Icon(Icons.favorite,color: Colors.blue),
            icon: Icon(Icons.favorite_border,color: Colors.blue),
            label: 'favorite',
          ),

          BottomNavigationBarItem(
            activeIcon: Icon(Icons.chat_bubble,color: Colors.blue),
            icon: Icon(Icons.chat_bubble_outline,color: Colors.blue),
            label: 'Chat',
          ),


          BottomNavigationBarItem(
            activeIcon: Icon(Icons.account_circle_rounded,color: Colors.blue),
            icon: Icon(Icons.account_circle_outlined,color: Colors.blue),
            label: 'profile',
          ),


        ],
        currentIndex: bottomNavIndex,

        onTap: (index){
          setState(() {
            bottomNavIndex=index;
          });
        },
      ),

    );
  }
  Widget bottomnavBody(int bottomNavIndex)
  {
    switch(bottomNavIndex){

      case 0:
        return Homepage();
      case 1:
        return Text('liked');
      case 2:
        return Text('chat');
      default:
        return Text('profile');

    }
  }
}
