import 'package:flutter/material.dart';

import '../Models/chat_users.dart';
import '../chat_detail.dart';

class Conversation extends StatefulWidget {
  final ChatUsers chatUser;
  const Conversation({super.key, required this.chatUser});

  @override
  State<Conversation> createState() => _ConversationState();
}

class _ConversationState extends State<Conversation> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return ChatDetail(chatUser: widget.chatUser);
        }));
      },
      child: Column(children: [
        Container(
          color: Colors.white,
          padding:
              const EdgeInsets.only(left: 16, right: 16, top: 12, bottom: 12),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Row(
                  children: <Widget>[
                    CircleAvatar(
                      // backgroundImage: NetworkImage(widget.imageUrl),
                      backgroundImage: AssetImage(widget.chatUser.imageURL),
                      radius: 25,
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: Container(
                        color: Colors.transparent,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              widget.chatUser.name,
                              style: const TextStyle(fontSize: 18, color: Color.fromRGBO(70, 70, 70, 1), fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 6,
                            ),
                            Text(
                              widget.chatUser.messageText,
                              style: const TextStyle(
                                  fontSize: 14,
                                  // fontWeight: widget.isMessageRead
                                  //     ? FontWeight.bold
                                  //     : FontWeight.normal
                                  fontWeight: FontWeight.normal),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                widget.chatUser.time,
                style: const TextStyle(
                    fontSize: 14,
                    // fontWeight: widget.chatUser.isMessageRead
                    //     ? FontWeight.bold
                    //     : FontWeight.normal
                    fontWeight: FontWeight.normal),
              ),
            ],
          ),
        ),
        const Divider(
          height: 1,
          thickness: 1,
        ),
      ]),
    );
  }
}
