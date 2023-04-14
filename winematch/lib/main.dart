import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'screens/main_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Winematch',
        theme: ThemeData(primaryColor: Colors.white, primarySwatch: Colors.red),
        //darkTheme: ThemeData.dark(),
        //themeMode: ThemeMode.system,
        home: Scaffold(body: MainScreen(key: key)));
  }
}
