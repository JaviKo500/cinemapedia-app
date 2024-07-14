import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar ({super.key});
  
  void onItemTapped( BuildContext context, int index ) {
    switch (index) {
      case 0:
        context.go('/');
        break;
      case 1:
        context.go('/categories');
        break;
      case 2:
        context.go('/favorites');
        break;
      default:
        context.go('/');
    }
  }

  int getCurrentIndex( BuildContext context ) {
    final  String location = GoRouterState.of(context).matchedLocation;
    switch (location) {
      case '/':
        return 0;
      case '/categories':
        return 1;
      case '/favorites':
        return 2;
      default:
        return 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: (value) => onItemTapped( context, value ),
      currentIndex: getCurrentIndex( context ),
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_max),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.label_outline),
          label: 'Categories',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite_outline),
          label: 'Favorite',
        )
      ],
    );
  }
}