import 'package:flutter/material.dart';
import 'Utility/constant.dart';

class CallHistory extends StatefulWidget {
  const CallHistory({super.key});

  @override
  State<CallHistory> createState() => _CallHistoryState();
}

class _CallHistoryState extends State<CallHistory> {
  var items = [
    {"name": "Ankur", "call": 1, "time": "6:00 AM", "type": "Outgoing"},
    {"name": "Varsha", "call": 1, "time": "6:00 AM", "type": "Outgoing"},
    {"name": "Avyaan", "call": 5, "time": "6:00 AM", "type": "Missed"},
    {"name": "Papa", "call": 1, "time": "6:00 AM", "type": "Incoming"},
    {"name": "Home", "call": 2, "time": "6:00 AM", "type": "Outgoing"},
    {"name": "Piyush Dubai", "call": 1, "time": "6:00 AM", "type": "Incoming"},
    {"name": "Syam Qatar", "call": 1, "time": "6:00 AM", "type": "Missed"},
    {"name": "Anand M", "call": 1, "time": "6:00 AM", "type": "Missed"},
    {"name": "Akhil Jagtap", "call": 4, "time": "6:00 AM", "type": "Incoming"},
    {"name": "Sumit Pune", "call": 1, "time": "6:00 AM", "type": "Outgoing"},
    {"name": "Piyush Dubai", "call": 1, "time": "6:00 AM", "type": "Incoming"},
    {"name": "Syam Qatar", "call": 1, "time": "6:00 AM", "type": "Missed"},
    {"name": "Anand M", "call": 1, "time": "6:00 AM", "type": "Missed"},
    {"name": "Akhil Jagtap", "call": 4, "time": "6:00 AM", "type": "Incoming"},
    {"name": "Sumit Pune", "call": 1, "time": "6:00 AM", "type": "Outgoing"},
  ];

  Color getTileColor(int index) {
    return Colors.primaries[index];
    // return Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
    //     .withOpacity(1.0);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        elevation: 1.0,
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: const Color.fromARGB(255, 237, 244, 249),
        title: const Text(
          "Call",
          style: TextStyle(
              color: Colors.black, fontSize: 21, fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: items.length,
          shrinkWrap: true,
          itemBuilder: (BuildContext ctxt, int index) {
            Map<String, dynamic> option = items[index];
            String callType = option["type"];
            String title = option["name"];
            int callCount = option["call"];
            return Column(
              children: [
                ListTile(
                  tileColor: Colors.white,
                  contentPadding: EdgeInsets.symmetric(
                      vertical: 0.0, horizontal: size.width * 0.05),
                  onTap: () {},
                  leading: Container(
                    height: 44,
                    width: 44,
                    decoration: BoxDecoration(
                        color: getTileColor(index), shape: BoxShape.circle),
                    child: Center(
                      child: Text(
                        title.characters.first,
                        style: const TextStyle(
                            color: Colors.white, fontSize: 20.0),
                      ),
                    ),
                  ),
                  title: Text(
                    callCount > 1 ? "$title ($callCount)" : title,
                    style: const TextStyle(color: Colors.black, fontSize: 18.0),
                  ),
                  subtitle: Row(
                    children: [
                      const Icon(
                        Icons.call,
                        size: 14.0,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        callType,
                        style: TextStyle(
                            color:
                                callType.toLowerCase() == CallTypes.missed.name
                                    ? Colors.red
                                    : Colors.grey[700],
                            fontSize: 14.0),
                      ),
                    ],
                  ),
                  trailing: Text(
                    option["time"],
                    style: TextStyle(color: Colors.grey[700], fontSize: 14.0),
                  ),
                ),
                const Divider(
                  height: 1,
                  thickness: 1,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
