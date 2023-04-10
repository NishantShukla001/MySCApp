import 'package:demo_app/Widgets/appbar/appbar.dart';
import 'package:demo_app/call_history.dart';
import 'package:demo_app/conversation_list.dart';
import 'package:demo_app/friend_list.dart';
import 'package:demo_app/settings.dart';
import 'package:demo_app/user_profile.dart';
import 'package:flutter/material.dart';

import 'Widgets/topbar_indicator.dart';
import 'home.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard>
    with SingleTickerProviderStateMixin {
  int selectedIndex = 0;
  late TabController tabController;

  List<Widget> widgetOptions = const <Widget>[
    Home(),
    CallHistory(),
    ConversationList(),
    Settings(),
  ];

  @override
  void initState() {
    super.initState();
    tabController = TabController(
      initialIndex: 0,
      length: 4,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
          title: "Home",
          onProfilePressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const UserProfile()),
            );
          },
          onNotificationPressed: () {}),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Social App',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text('About Us'),
              onTap: () {
                //TODO: implement about us
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
              onTap: () {
                //TODO: implement logout
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Color.fromARGB(100, 0, 0, 0),
              blurRadius: 6.0,
              offset: Offset(0, 0.75),
            )
          ],
          color: Colors.white,
        ),
        height: 80,
        child: TabBar(
          labelColor: const Color.fromRGBO(0, 213, 217, 1),
          unselectedLabelColor: const Color.fromRGBO(68, 97, 115, 1),
          controller: tabController,
          indicator: TopIndicator(),
          tabs: const [
            Tab(icon: Icon(Icons.home)),
            Tab(icon: Icon(Icons.call)),
            Tab(icon: Icon(Icons.supervised_user_circle_rounded)),
            Tab(icon: Icon(Icons.settings)),
          ],
          onTap: (index) {
            setState(() {
              tabController.index = index;
            });
          },
        ),
      ),
      body: TabBarView(
        physics: const NeverScrollableScrollPhysics(),
        controller: tabController,
        children: widgetOptions,
      ),
    );
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }
}
