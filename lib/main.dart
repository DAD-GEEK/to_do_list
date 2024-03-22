import 'package:flutter/material.dart';
import 'package:to_do_list/view/pages/CreateTaskPage.dart';
import 'package:to_do_list/view/pages/listTaskPage.dart';
import 'package:to_do_list/view/widgets/AppBarWidget.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'To Do List',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: appBarWidget(),
        ),
        body: ListTaskPage(),
        floatingActionButton: FloatingActionButton(
          onPressed:  () => loadCreateTaskPage(context),
          backgroundColor: Colors.lightBlueAccent,
          child: const Icon(Icons.add),
        )
      ),
      
    );
  }
  
  loadCreateTaskPage(BuildContext context) {
     Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => CreateTaskPage(),
      ),
    );
  }
}
