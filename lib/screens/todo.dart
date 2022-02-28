import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/provider_task.dart';
import '../widgets/task_add_dialog.dart';
import '../widgets/task_row.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class ToDoPage extends StatefulWidget {
  const ToDoPage({Key? key}) : super(key: key);

  @override
  State<ToDoPage> createState() => _ToDoPageState();
}

class _ToDoPageState extends State<ToDoPage> {
  @override
  void initState() {
    super.initState();
    Provider.of<TaskItems>(context, listen: false).initSharedPreferences();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Consumer<TaskItems>(builder: (context, state, child) {
          return Padding(
              padding: const EdgeInsets.all(16.0),
              child: AnimationLimiter(
                child: ListView.separated(
                  shrinkWrap: true,
                  padding: const EdgeInsets.all(8),
                  itemCount: state.taskList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return AnimationConfiguration.staggeredList(
                      position: index,
                      duration: const Duration(milliseconds: 375),
                      child: SlideAnimation(
                        verticalOffset: 50.0,
                        child: FadeInAnimation(
                          child: SizedBox(
                              height: 80,
                              width: double.infinity,
                              child: TaskRow(item: state.taskList[index])),
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) =>
                      const Divider(),
                ),
              ));
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: (context), builder: (context) => const AddCategorize());
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
