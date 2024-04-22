import 'package:flutter/material.dart';
import 'package:to_do_list/Controller/TaskProvider.dart';
import 'package:to_do_list/view/pages/listTaskPage.dart';
import 'package:to_do_list/view/widgets/AppBarWidget.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp().then((value) => runApp(MultiProvider(

    providers: [
      ChangeNotifierProvider(create: (_) => TaskProvider()),
    ],
    child: const MainApp(),
  ))
);
  
  
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'To Do List',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBarWidget("Lista de Tareas"),
        body: ListTaskPage(),
        
      ),
      
    );
  }
  
}
