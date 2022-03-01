import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '/models/item.dart';
import '../provider/provider_task.dart';
import 'package:intl/intl.dart';

class AddCategorize extends StatefulWidget {
  const AddCategorize({Key? key}) : super(key: key);

  @override
  State<AddCategorize> createState() => _AddCategorizeState();
}

class _AddCategorizeState extends State<AddCategorize> {
  SharedPreferences? sharedPreferences;

  @override
  void initState() {
    super.initState();
    Provider.of<TaskItems>(context, listen: false).initSharedPreferences();
  }

  var categorizeController = TextEditingController();
  var categorizeController2 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: const Color.fromARGB(255, 19, 18, 20),
      title: const Text('Add a Task!', style: TextStyle(color: Colors.white)),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20))),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextFormField(
            style: const TextStyle(color: Colors.white),
            validator: (value) {
              if (value == '') {
                return 'Title cant be empty';
              }
              return null;
            },
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Title',
            ),
            autofocus: true,
            controller: categorizeController,
          ),
          TextFormField(
            style: const TextStyle(color: Colors.white),
            keyboardType: TextInputType.multiline,
            maxLines: null,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Info',
            ),
            autofocus: false,
            controller: categorizeController2,
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: ElevatedButton(
                onPressed: () {
                  Items item = Items(
                      title: categorizeController.text,
                      time: DateFormat(
                        'kk:mm aaa,  MMMM dd',
                      ).format(DateTime.now()),
                      info: categorizeController2.text);
                  Provider.of<TaskItems>(context, listen: false).addTask(item);
                  Navigator.pop(context);
                },
                child: const Text('Add')),
          )
        ],
      ),
    );
  }
}
