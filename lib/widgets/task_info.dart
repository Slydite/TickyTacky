import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/provider_task.dart';
import '/models/item.dart';

class TaskInfo extends StatelessWidget {
  const TaskInfo({Key? key, required this.item}) : super(key: key);
  final Items item;

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskItems>(builder: (context, state, child) {
      return AlertDialog(
        backgroundColor: const Color.fromARGB(255, 19, 18, 20),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(item.time,
                style: const TextStyle(color: Colors.white, fontSize: 12)),
          ],
        ),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20))),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Text(item.title,
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18)),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.yellow),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(10))),
                  height: 250,
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Text(item.info,
                            style: const TextStyle(
                              color: Colors.white, //fontWeight: FontWeight.bold
                            ))),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Done')),
            )
          ],
        ),
      );
    });
  }
}
