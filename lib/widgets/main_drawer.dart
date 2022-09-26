import 'package:flutter/material.dart';
import 'package:mealsapp/screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);
  Widget buildListTitle(String title,IconData icon, Function() tapHandler){
    return ListTile(
      leading: Icon(icon, size: 26),
      title: Text(
        title,
        style: const TextStyle(
          fontFamily: 'RobotoCondensed',
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Colors.amberAccent,
            child: Text(
              'Cooking Up!',
              style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 30,
                  color: Theme.of(context).primaryColor),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          buildListTitle(
              'Meals',
              Icons.restaurant,
                  (){
                Navigator.of(context).pushReplacementNamed('/');
                  }
          ),
          buildListTitle('Filter',
              Icons.settings,
                  (){
                    Navigator.of(context).pushReplacementNamed(FilterScreen.routeName);

                  }
          ),

        ],
      ),
    );
  }
}
