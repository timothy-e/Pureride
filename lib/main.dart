import 'package:flutter/material.dart';
import 'package:pureride/state_widget.dart';
import 'package:pureride/ui/screens/home.dart';
import 'package:pureride/ui/theme.dart';

void main() => runApp(StateWidget(
  child: App(),
));

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "PureRide",
      theme: buildTheme(),
      routes: {
        '/': (context) => HomeScreen(),
      });
  }

}
