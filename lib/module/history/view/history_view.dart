import 'package:flutter/material.dart';
import 'package:fire_guardian/global_core/color/color.dart' as c;
import 'package:fire_guardian/core.dart';
import '../controller/history_controller.dart';

class HistoryView extends StatefulWidget {
  const HistoryView({Key? key}) : super(key: key);

  Widget build(context, HistoryController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "History",
          style: TextStyle(
            fontSize: 18,
            color: c.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height,
                child: ListView.builder(
                  itemCount: controller.historyData.length,
                  itemBuilder: (BuildContext context, int index) {
                    var item = controller.historyData[index];
                    return Column(
                      children: [
                        ListTile(
                          leading: Icon(
                            Icons.history,
                            color: c.greyText,
                          ),
                          minLeadingWidth: 0.0,
                          title: Text(item['name']),
                          subtitle: Text(item['address'].toString()),
                          trailing: Text(item['date']),
                        ),
                        const Divider(),
                      ],
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  State<HistoryView> createState() => HistoryController();
}
