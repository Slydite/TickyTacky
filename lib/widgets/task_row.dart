import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/provider_done.dart';
import '/models/item.dart';
import '../provider/provider_task.dart';

class TaskRow extends StatelessWidget {
  const TaskRow({Key? key, required this.item}) : super(key: key);
  final Items item;

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
                  Provider.of<DoneItems>(context, listen: false).addDone(item);
                  state.deleteTask(item);
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
                    state.deleteTask(item);
                  },
                  child: Container(
                    decoration: BoxDecoration(
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
                            child: Text(item.title,
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
                    item.time,
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
