import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'provider/provider_done.dart';
import 'package:todo_app/screens/home_page.dart';
import 'provider/provider_task.dart';
//import 'package:firebase_core/firebase_core.dart';
//import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<TaskItems>(
              create: (BuildContext context) => TaskItems()),
          ChangeNotifierProvider<DoneItems>(
              create: (BuildContext context) => DoneItems()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'TickyTacky',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSwatch().copyWith(
              primary: Colors.blue,
              secondary: Colors.blue,
            ),
            primaryColor: Colors.blue,
            canvasColor: const Color.fromARGB(255, 19, 18, 20),
            bottomSheetTheme: const BottomSheetThemeData(
              modalBackgroundColor: Color.fromARGB(255, 38, 38, 70),
              backgroundColor: Colors.transparent,
            ),
          ),
          home: const HomePage(),
        ));
  }
}
