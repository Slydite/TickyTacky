import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/provider_done.dart';
import '/models/item.dart';
import '../provider/provider_task.dart';
import 'task_info.dart';
import 'dart:io';
import "dart:async";

class TaskRow extends StatefulWidget {
  const TaskRow({Key? key, required this.item}) : super(key: key);
  final Items item;

  @override
  State<TaskRow> createState() => _TaskRowState();
}

class _TaskRowState extends State<TaskRow> {
  Color filler = Colors.transparent;
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskItems>(builder: (context, state, child) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    filler = Colors.yellow;
                  });
                  //sleep(Duration(seconds: 1));
                  Timer(Duration(seconds: 1), () {
                    Provider.of<DoneItems>(context, listen: false)
                        .addDone(widget.item);
                    state.deleteTask(widget.item);
                    filler = Colors.transparent;
                  });

                  // Future.delayed(Duration(milliseconds: 1000), () {});
                },
                child: SizedBox(
                  width: 30,
                  height: 30,
                  child: CustomPaint(
                    painter: OpenPainter(),
                  ),
                ),
              ),
              GestureDetector(
                  onLongPress: () {
                    state.deleteTask(widget.item);
                  },
                  onTap: () {
                    showDialog(
                        context: (context),
                        builder: (context) => TaskInfo(item: widget.item));
                  },
                  child: AnimatedContainer(
                    duration: const Duration(seconds: 1),
                    decoration: BoxDecoration(
                        color: filler,
                        border: Border.all(color: Colors.yellow),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20))),
                    height: 40,
                    width: 300,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child:
                          Consumer<TaskItems>(builder: (context, state, child) {
                        return SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Text(widget.item.title,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold)));
                      }),
                    ),
                  )),
            ],
          ),
          const SizedBox(
            width: 0,
            height: 10,
          ),
          Row(
            children: [
              const SizedBox(
                width: 55,
                height: 0,
              ),
              Consumer<TaskItems>(
                builder: (context, state, child) {
                  return Text(
                    widget.item.time,
                    style: TextStyle(
                        color: Colors.grey[400], fontWeight: FontWeight.bold),
                  );
                },
              )
            ],
          ),
        ],
      );
    });
  }
}

class OpenPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint1 = Paint()
      ..color = Colors.yellow
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    canvas.drawArc(
        const Offset(0, 0) & const Size(30, 30), 4, 8, false, paint1);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
