import 'package:demo_app/chat_detail.dart';
import 'package:flutter/material.dart';

import 'Utility/constant.dart';

class FriendList extends StatefulWidget {
  const FriendList({super.key});

  @override
  State<FriendList> createState() => _FriendListState();
}

class _FriendListState extends State<FriendList> {
  var items = [
    {
      "name": "Ankur",
      "read": true,
      "time": "6:00 AM",
      "message": "Hi, How r u?"
    },
    {"name": "Varsha", "read": false, "time": "6:00 AM", "message": "Yes"},
    {"name": "Avyaan", "read": false, "time": "6:00 AM", "message": "will go"},
    {
      "name": "Papa",
      "read": true,
      "time": "6:00 AM",
      "message": "Good Morning"
    },
    {
      "name": "Home",
      "read": false,
      "time": "6:00 AM",
      "message": "Can we talk?"
    },
    {
      "name": "Piyush Dubai",
      "read": false,
      "time": "6:00 AM",
      "message": "are you coming tomorrow"
    },
    {"name": "Syam Qatar", "read": true, "time": "6:00 AM", "message": "nop"},
    {"name": "Anand M", "read": true, "time": "6:00 AM", "message": "Hi Peter"},
    {
      "name": "Akhil Jagtap",
      "read": false,
      "time": "6:00 AM",
      "message": "no not now"
    },
    {"name": "Sumit Pune", "read": true, "time": "6:00 AM", "message": "gn"},
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
          elevation: 1.0,
          centerTitle: true,
          backgroundColor: Colors.white,
          title: const Text(
            "Friend List",
            style: TextStyle(
                fontFamily: 'OpenSens', color: Colors.black, fontSize: 24),
          ),
          actions: [
            IconButton(
                color: Colors.black,
                icon: const Icon(Icons.search),
                onPressed: () {
                  Navigator.pop(context);
                }),
            const SizedBox(width: 20),
          ]),
      body: SafeArea(
        child: ListView.builder(
          itemCount: items.length,
          shrinkWrap: true,
          itemExtent: size.height * 0.08,
          itemBuilder: (BuildContext ctxt, int index) {
            Map<String, dynamic> option = items[index];
            String messsage = option["message"];
            String name = option["name"];
            bool read = option["read"];
            return Column(
              children: [
                ListTile(
                  contentPadding: EdgeInsets.symmetric(
                      vertical: 0.0, horizontal: size.width * 0.05),
                  onTap: () {},
                  leading: Image(
                    height: size.height * 0.05,
                    width: size.height * 0.05,
                    image: const AssetImage('graphics/img_1.png'),
                  ),
                  title: Text(
                    name,
                    style: const TextStyle(color: Colors.black, fontSize: 18.0),
                  ),
                  subtitle: Text(
                    messsage,
                    style: TextStyle(
                        color: Colors.grey[700],
                        fontSize: 14.0,
                        fontWeight: read ? FontWeight.normal : FontWeight.bold),
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
