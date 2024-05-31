import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'header.dart';
import 'footer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<String> selectedChoices = [];
  List<Map<String, String>> choiceDetails = [
    {'title': 'cinema', 'description': 'Il faut aller voir le film muthu'},
    {'title': 'petanque', 'description': 'Ricard pétanque ?'},
    {'title': 'fitness', 'description': 'Exo 1, exo 2, exo 3'},
    {'title': 'League Of Legend', 'description': 'Teemo est le pire champion du monde'},
    {'title': 'basket', 'description': 'Lebron > all'},
    {'title': 'shopping', 'description': 'Activité à éviter si on a des amis communiste'},
    {'title': 'programmation', 'description': 'Python est le meilleur langage 🤷'},
  ];

  Color _themeColor = Colors.deepPurpleAccent;

  void _updateSelectedChoices(List<String> choices) {
    setState(() {
      selectedChoices = choices;
    });
  }

  void _changeThemeColor(Color color) {
    setState(() {
      _themeColor = color;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter TP',
      theme: ThemeData(
        primaryColor: _themeColor,
        appBarTheme: AppBarTheme(
          backgroundColor: _themeColor,
        ),
      ),
      home: SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              Header(selectedChoices: selectedChoices, choiceDetails: choiceDetails),
              const SizedBox(height: 16),
              Footer(updateSelectedChoices: _updateSelectedChoices),
              const SizedBox(height: 16),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () => _changeThemeColor(Colors.deepPurpleAccent),
                      child: Text('Theme violet'),
                    ),
                    const SizedBox(width: 16),
                    ElevatedButton(
                      onPressed: () => _changeThemeColor(Colors.green),
                      child: Text('Theme vert'),
                    ),
                    const SizedBox(width: 16),
                    ElevatedButton(
                      onPressed: () => _changeThemeColor(Colors.orange),
                      child: Text('Theme orange'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
