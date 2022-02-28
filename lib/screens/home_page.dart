import 'package:flutter/material.dart';
import 'done.dart';
import 'todo.dart';

int? index = 0;

String appBar1 = '<< Done';
String appBar2 = 'To Do >>';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    index = DefaultTabController.of(context)?.index;
    return DefaultTabController(
      length: 2,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              centerTitle: true,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [Text('TickyTacky')],
              )),
          body: const TabBarView(
            children: [
              ToDoPage(),
              DonePage(),
            ],
          ),
          bottomNavigationBar: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.today_rounded), text: 'To Do'),
              Tab(icon: Icon(Icons.check), text: 'Done'),
            ],
            labelColor: Colors.yellow,
            unselectedLabelColor: Colors.blue,
            indicatorSize: TabBarIndicatorSize.label,
            indicatorPadding: EdgeInsets.all(5.0),
            indicatorColor: Colors.red,
          ),
        ),
      ),
    );
  }
}
