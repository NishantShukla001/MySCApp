import 'package:demo_app/Widgets/online_user_cell.dart';
import 'package:demo_app/user_profile.dart';
import 'package:flutter/material.dart';
import 'package:simple_ripple_animation/simple_ripple_animation.dart';

import 'Models/chat_users.dart';
import 'Widgets/preference_screen.dart';
import 'Widgets/user_search_ui.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<ChatUsers> chatUsers = [
    ChatUsers(
        name: "Jane Russel",
        messageText: "Awesome Setup",
        imageURL: "graphics/user.png",
        time: "Now"),
    ChatUsers(
        name: "Gladys Murphy",
        messageText: "That's Great",
        imageURL: "graphics/user.png",
        time: "Yesterday"),
    ChatUsers(
        name: "Jorge Henry",
        messageText: "Hey where are you?",
        imageURL: "graphics/user.png",
        time: "31 Mar"),
    ChatUsers(
        name: "Philip Fox",
        messageText: "Busy! Call me in 20 mins",
        imageURL: "graphics/user.png",
        time: "28 Mar"),
    ChatUsers(
        name: "Debra Hawkins",
        messageText: "Thankyou, It's awesome",
        imageURL: "graphics/user.png",
        time: "23 Mar"),
    ChatUsers(
        name: "Jacob Pena",
        messageText: "will update you in evening",
        imageURL: "graphics/user.png",
        time: "17 Mar"),
    ChatUsers(
        name: "Andrey Jones",
        messageText: "Can you please share the file?",
        imageURL: "graphics/user.png",
        time: "24 Feb"),
    ChatUsers(
        name: "John Wick",
        messageText: "How are you?",
        imageURL: "graphics/user.png",
        time: "18 Feb"),
  ];
  bool showRippleAnimation = false;

// function to show preference
  void showBottomModelSheet() {
    showModalBottomSheet<void>(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
      ),
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        return const PreferenceBottomSheet();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      // appBar: AppBar(
      //     elevation: 0.4,
      //     centerTitle: true,
      //     backgroundColor: Colors.white,
      //     title: const Text(
      //       "Home",
      //       style: TextStyle(
      //           color: Colors.black, fontSize: 21, fontWeight: FontWeight.bold),
      //     ),
      // actions: [
      //   IconButton(
      //       color: const Color.fromRGBO(70, 70, 70, 1),
      //       icon: const Icon(Icons.notifications),
      //       onPressed: () {}),
      //   const SizedBox(width: 10),
      //   IconButton(
      //       color: const Color.fromRGBO(70, 70, 70, 1),
      //       icon: const Icon(Icons.person),
      //       onPressed: () {
      //         Navigator.push(
      //           context,
      //           MaterialPageRoute(
      //               builder: (context) => const UserProfile()),
      //         );
      //       }),
      //   const SizedBox(width: 10),
      // ]),
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  decoration: const BoxDecoration(
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                          color: Color.fromARGB(100, 0, 0, 0),
                          blurRadius: 6.0,
                          offset: Offset(0.0, 0.75))
                    ],
                    color: Colors.white,
                  ),
                  padding: const EdgeInsets.only(left: 10, top: 15),
                  height: 120,
                  child: ListView.builder(
                    itemCount: 8,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext ctxt, int index) {
                      return OnlineUser(chatUser: chatUsers[index]);
                    },
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: double.infinity,
                  height: 70,
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: const Text(
                    "Find perfect unknown person to share your feelings",
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey),
                    textAlign: TextAlign.center,
                  ),
                ),
                Center(
                  child: SizedBox(
                    height: size.height * 0.4,
                    width: size.width * 0.9,
                    child: GestureDetector(
                      onTap: () {
                        // if (!showRippleAnimation) {
                        //   setState(() {
                        //     showRippleAnimation = true;
                        //   });
                        // }

                        setState(() {
                          showRippleAnimation = !showRippleAnimation;
                        });
                      },
                      child: showRippleAnimation
                          ? RippleAnimation(
                              color: const Color.fromRGBO(68, 97, 115, 1),
                              delay: const Duration(milliseconds: 300),
                              repeat: true,
                              minRadius: 75,
                              ripplesCount: 4,
                              duration: const Duration(milliseconds: 4 * 300),
                              child: Container(),
                            )
                          : CustomPaint(
                              painter:
                                  DrawArc(size.width * 0.9, size.height * 0.4),
                            ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Center(
                  child: SizedBox(
                    width: size.width * 0.7,
                    height: 60,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                        ),
                        backgroundColor: MaterialStateProperty.all<Color>(
                          const Color.fromRGBO(68, 97, 115, 1),
                        ),
                      ),
                      onPressed: () {
                        // setState(() {
                        //   showRippleAnimation = false;
                        // });
                        showBottomModelSheet();
                      },
                      child: const Text(
                        "Set your preferences",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ]),
        ),
      ),
    );
  }
}
