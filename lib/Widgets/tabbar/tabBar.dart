/*
import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:provider/provider.dart';
import 'package:iconf/components/fab_container.dart';

import '../../Utility/stringConstants.dart';
import '../utils/Constants/stringConstants.dart';

class TabScreen extends StatefulWidget {
  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  // late StreamSubscription<bool> keyboardSubscription;

  bool isVisible = false;

  @override
  void initState() {
    super.initState();
  }

  int _page = 0;

  List pages = [
    {
      'title': StringConstants.dashboardConScreen_Appbar_Agenda_Title_key,
      'icon': CupertinoIcons.home,
      'page': AgendaListPage(),
      'index': 0,
    },
    {
      'title': StringConstants.notificationScreen_Wall_Title_key,
      'icon': Ionicons.call,
      'page': Feeds(),
      'index': 1,
    },
    {
      'title': StringConstants.mainScreen_bottomCircleBtn_Title_key,
      'icon': Ionicons.add_circle,
      'page': Text('nes'),
      'index': 2,
    },
    {
      'title': StringConstants.mainScreen_Attendees_Title_key,
      'icon': Ionicons.people,
      'page': AttendList(),
      'index': 3,
    },
    {
      'title': StringConstants.mainScreen_Profile_Title_key,
      'icon': CupertinoIcons.person_fill,
      'page': Profile(
          profileId: firebaseAuth.currentUser!.uid, isShowAppBar: false),
      'index': 4,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: pages[_page]['page'],
        floatingActionButton: buildFab(),
        bottomNavigationBar: !isVisible
            ? BottomAppBar(
                color: Theme.of(context).colorScheme.secondary,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(width: 5),
                    for (Map item in pages)
                      item['index'] == 2
                          ? SizedBox()
                          : Padding(
                              padding: const EdgeInsets.only(top: 5.0),
                              child: IconButton(
                                icon: Icon(
                                  item['icon'],
                                  color: item['index'] != _page
                                      ? Theme.of(context).brightness ==
                                              Brightness.dark
                                          ? Colors.white
                                          : Colors.white
                                      : Theme.of(context).colorScheme.primary,
                                  size: 25.0,
                                ),
                                onPressed: () =>
                                    navigationTapped(item['index']),
                              ),
                            ),
                    SizedBox(width: 5),
                  ],
                ),
              )
            : Container(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }

  buildFab() {
    return Container(
      height: 45.0,
      width: 45.0,
      // ignore: missing_required_param
      child: FabContainer(
        icon: Ionicons.add_outline,
        mini: false,
      ),
    );
  }

  void navigationTapped(int page) {
    setState(() {
      _page = page;
      Provider.of<MyAppBarTitleModel>(context, listen: false)
          .setTitle(pages[_page]['title']);
    });
  }
}
*/