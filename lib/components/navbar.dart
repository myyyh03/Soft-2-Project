import 'package:flutter/material.dart';
import 'package:shopping_app/screens/Favorite.dart';
import 'package:shopping_app/screens/HomeScreen.dart';
import 'package:shopping_app/screens/ProfilePage.dart';
import 'package:shopping_app/screens/Cart.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  @override
  _CustomBottomNavigationBarState createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      onTap: (index) {
        setState(() {
          _currentIndex = index;
        });
        // Navigate to corresponding screen based on the tapped index
        switch (index) {
          case 0:
            Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));            break;
          case 1:
            Navigator.push(context, MaterialPageRoute(builder: (context) => Cart()));            break;
          case 2:
<<<<<<< HEAD
            Navigator.push(context, MaterialPageRoute(builder: (context) => Favorite()));
            break;
          // case 3:
          //   Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage()));            break;
        }
=======
            Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage()));             break;
        //  case 3:
        //    Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage()));            break;
         }
>>>>>>> a06e3dc7a0cc553d7bb34293b735e862e9b37f8d
      },
      selectedItemColor: Colors.black, // Change the color of the selected item
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home, color: Colors.blue),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.store, color: Colors.blue),
          label: 'Cart',
        ),
        BottomNavigationBarItem(
<<<<<<< HEAD
          icon: Icon(Icons.favorite, color: Colors.blue),
          label: 'Favorite',
        ),
        // BottomNavigationBarItem(
        //   icon: Icon(Icons.person, color: Colors.blue),
        //   label: 'Profile',
        // ),
      ],
    );
  }
}
=======
          icon: Icon(Icons.person, color: Colors.blue),
          label: 'Profile',
        ),
         // BottomNavigationBarItem(
         //   icon: Icon(Icons.person, color: Colors.blue),
         //   label: 'Profile',
         // ),
      ],
    );
  }
}
>>>>>>> a06e3dc7a0cc553d7bb34293b735e862e9b37f8d
