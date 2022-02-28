import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/provider_done.dart';

import '../widgets/task_row_done.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class DonePage extends StatefulWidget {
  const DonePage({Key? key}) : super(key: key);

  @override
  State<DonePage> createState() => _DonePageState();
}

class _DonePageState extends State<DonePage> {
  @override
  void initState() {
    super.initState();
    Provider.of<DoneItems>(context, listen: false).initSharedPreferences();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Consumer<DoneItems>(builder: (context, state, child) {
          return Padding(
              padding: const EdgeInsets.all(16.0),
              child: AnimationLimiter(
                child: ListView.separated(
                  shrinkWrap: true,
                  padding: const EdgeInsets.all(8),
                  itemCount: state.doneList.length,
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
                              child: TaskRow(item: state.doneList[index])),
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
    );
  }
}
