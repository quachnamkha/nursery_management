import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'providers/child_provider.dart';
import 'screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyD2sCetIn4992AWPvwPssWv3cUxSHk0qMw",
      authDomain: "tdkindergarten.firebaseapp.com",
      projectId: "tdkindergarten",
      storageBucket: "tdkindergarten.appspot.com",
      messagingSenderId: "887520562751",
      appId: "1:887520562751:web:c3258fb10796cabff6f28a",
      measurementId: "G-LTYYLRB14X"
    ),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ChildProvider()),
      ],
      child: MaterialApp(
        title: 'Nursery Management',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomeScreen(),
      ),
    );
  }
}
