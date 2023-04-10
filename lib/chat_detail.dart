import 'package:flutter/material.dart';

import 'Models/chat_message_model.dart';
import 'Models/chat_users.dart';

class ChatDetail extends StatefulWidget {
  final ChatUsers chatUser;
  const ChatDetail({super.key, required this.chatUser});

  @override
  State<ChatDetail> createState() => _ChatDetailState();
}

class _ChatDetailState extends State<ChatDetail> {
  List<ChatMessage> messages = [
    ChatMessage(messageContent: "Hello, Will", messageType: "receiver"),
    ChatMessage(messageContent: "How have you been?", messageType: "receiver"),
    ChatMessage(
        messageContent: "Hey Kriss, I am doing fine dude. wbu?",
        messageType: "sender"),
    ChatMessage(messageContent: "ehhhh, doing OK.", messageType: "receiver"),
    ChatMessage(
        messageContent: "Is there any thing wrong?", messageType: "sender"),
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        appBar: AppBar(
            elevation: 0,
            automaticallyImplyLeading: false,
            backgroundColor: const Color.fromARGB(255, 237, 244, 249),
            flexibleSpace: SafeArea(
              child: Container(
                padding: const EdgeInsets.only(right: 16),
                child: Row(
                  children: <Widget>[
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(
                      width: 2,
                    ),
                    CircleAvatar(
                      backgroundImage: AssetImage(widget.chatUser.imageURL),
                      // backgroundImage: NetworkImage(
                      //     "<https://randomuser.me/api/portraits/men/5.jpg>"),
                      maxRadius: 16,
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            widget.chatUser.name,
                            style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Color.fromRGBO(70, 70, 70, 1)),
                          ),
                          const Text(
                            "Online",
                            style: TextStyle(
                                color: Color.fromRGBO(141, 141, 141, 1),
                                fontSize: 11),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            actions: [
              IconButton(
                  color: const Color.fromRGBO(70, 70, 70, 1),
                  icon: const Icon(Icons.call),
                  onPressed: () {}),
              const SizedBox(width: 10),
              // IconButton(
              //     color: const Color.fromRGBO(68, 97, 115, 1),
              //     icon: const Icon(Icons.edit),
              //     onPressed: () {}),
              // const SizedBox(width: 10),
            ]),
        body: SafeArea(
          child: Stack(
            children: <Widget>[
              ListView.builder(
                itemCount: messages.length,
                shrinkWrap: true,
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Container(
                    padding: const EdgeInsets.only(
                        left: 14, right: 14, top: 10, bottom: 10),
                    child: Align(
                      alignment: (messages[index].messageType == "receiver"
                          ? Alignment.topLeft
                          : Alignment.topRight),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              blurRadius: 8.0, // soften the shadow
                              spreadRadius: 2.0, //extend the shadow
                            )
                          ],
                          color: (messages[index].messageType == "receiver"
                              ? Colors.white
                              : const Color.fromRGBO(68, 97, 115, 1)),
                        ),
                        padding: const EdgeInsets.all(16),
                        child: Text(
                          messages[index].messageContent,
                          style: TextStyle(
                              fontSize: 16,
                              color: (messages[index].messageType == "receiver"
                                  ? Colors.black
                                  : Colors.white)),
                        ),
                      ),
                    ),
                  );
                },
              ),
              Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        Container(
                          width: size.width - 120,
                          height: 60.0,
                          decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(5.0)),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.3),
                                blurRadius: 12.0, // soften the shadow
                                spreadRadius: 3.0, //extend the shadow
                              )
                            ],
                          ),
                          child: Stack(
                            children: [
                              TextField(
                                style: const TextStyle(
                                  fontSize: 17,
                                ),
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide.none,
                                  ),
                                  filled: true,
                                  fillColor: Colors.white,
                                  hintText: "Write message...",
                                ),
                              ),
                              Positioned(
                                right: 4.0,
                                top: 5.0,
                                child: IconButton(
                                  icon: const Icon(Icons.attach_file),
                                  color: const Color.fromRGBO(10, 66, 117, 1),
                                  iconSize: 22.0,
                                  onPressed: () {
                                    setState(() {});
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 20.0,
                        ),
                        Container(
                          width: 60.0,
                          height: 60.0,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.3),
                                blurRadius: 12.0, // soften the shadow
                                spreadRadius: 3.0, //extend the shadow
                              )
                            ],
                          ),
                          child: ElevatedButton(
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                              ),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  const Color.fromRGBO(68, 97, 115, 1)),
                            ),
                            onPressed: () {
                              setState(() {});
                            },
                            child: const Icon(Icons.send),
                          ),
                        ),
                      ],
                    ),
                  )),
            ],
          ),
        ));
  }
}
