import 'package:flutter/material.dart'; // import material package
import 'home.dart'; // imports home screen

void main() { 
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'OMDB API Demo', // name of the app 
      theme: ThemeData( 
        // white colour theme
        scaffoldBackgroundColor: const Color.fromARGB(255, 255, 255, 255),
        
        // app bar background colour
        appBarTheme: const AppBarTheme(
          color: Color.fromARGB(255, 255, 255, 255),
        ),

        // placeholder text texbox decoration colour
        inputDecorationTheme: const InputDecorationTheme(
          labelStyle: TextStyle(color: Color.fromARGB(255, 51, 51, 51)), 
        ),
        
      ),
      home: const HomeScreen(),
    );
  }
}
