import 'package:bamboo/bamboo.dart';

import 'package:example/example/zeus/zeus.dart' deferred as box;

import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BambooBreakPoint(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.light,
        // showPerformanceOverlay: true,
        title: 'Flutter Demo',
        home: const MainPage(),
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
      ),
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<void>(
      future: box.loadLibrary(),
      builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }
          return box.ZeusApp();
        }
        return const CircularProgressIndicator(
          color: Colors.red,
        );
      },
    );
  }
}
