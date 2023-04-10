import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  List items = ["About us", "Preferences", "Notification", "Privacy", "Logout"];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: const Color.fromARGB(255, 237, 244, 249),
        title: const Text(
          "Settings",
          style: TextStyle(
              color: Colors.black, fontSize: 21, fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
          child: ListView.builder(
        itemCount: items.length,
        shrinkWrap: true,
        itemBuilder: (BuildContext ctxt, int index) {
          String title = items[index];
          return Column(
            children: [
              ListTile(
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 0.0, horizontal: 30),
                onTap: () {},
                title: Text(
                  title,
                  style: const TextStyle(color: Colors.black, fontSize: 18.0),
                ),
                trailing: index == 2 ? CupertinoSwitch(
                  value: false,
                  onChanged: (value) {},
                ) : null,
              ),
            ],
          );
        },
      )),
    );
  }
}
