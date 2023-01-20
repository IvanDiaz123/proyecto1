import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ThemeChanger with ChangeNotifier {
  ThemeData _themeData;
  ThemeChanger(this._themeData);

  getTheme() => _themeData;

  setTheme(ThemeData theme) {
    this._themeData = theme;

    notifyListeners();
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeChanger>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('AppBar'),
      ),
      body: ListaBotones(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => theme.setTheme(ThemeData(
            brightness: Brightness.light,
            primaryColor: Colors.lime,
            floatingActionButtonTheme:
                FloatingActionButtonThemeData(backgroundColor: Colors.lime))),
      ),
    );
  }
}

class ListaBotones extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeChanger>(context);

    return Column(
      children: <Widget>[
        FloatingActionButton(
          child: Text('Light'),
          onPressed: () => theme.setTheme(ThemeData.light()),
        ),
        FloatingActionButton(
          child: Text('Dark'),
          onPressed: () => theme.setTheme(ThemeData.dark()),
        ),
      ],
    );
  }
}
