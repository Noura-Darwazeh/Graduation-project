import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soft/chat/model/message.dart';
import 'package:soft/chat/model/message_chat.dart';
import 'package:soft/chat/utils/global.dart';
import 'package:soft/chat/widgets/custom_image.dart';
import 'package:soft/providers/user_provider.dart';

class ChatRoomItem extends StatelessWidget {
  ChatRoomItem({Key? key, required this.message}) : super(key: key);
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final MessageChat message;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(5.0), child: getGroupChat(context));
  }

  getPersonalChat(context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: message.idFrom ==
              Provider.of<UserProvider>(context, listen: false).user
          ? MainAxisAlignment.end
          : MainAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.blue.shade50,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
                bottomLeft: Radius.circular(20)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 1,
                blurRadius: 1,
                offset: Offset(0, 1), // changes position of shadow
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text: this.message.content,
                      style: TextStyle(fontSize: 15, color: Colors.black),
                    ),
                    TextSpan(text: "   "),
                    TextSpan(
                      text: getTimeAgo(DateTime.fromMillisecondsSinceEpoch(
                          int.parse(this.message.timestamp))),
                      style: TextStyle(fontSize: 13, color: Colors.grey),
                    ),
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }

  getGroupChat(context) {
    return message.idFrom !=
            Provider.of<UserProvider>(context, listen: false).user.id
        ? Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              CustomImage(
                this.message.idFrom.toString(),
                width: 40,
                height: 40,
              ),
              SizedBox(
                width: 5,
              ),
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.lightGreen.shade50,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                      bottomRight: Radius.circular(20)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 1,
                      blurRadius: 1,
                      offset: Offset(0, 1), // changes position of shadow
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      this.message.content,
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    RichText(
                      text: TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                            text: this.message.content,
                            style: TextStyle(fontSize: 14, color: Colors.black),
                          ),
                          TextSpan(text: "   "),
                          TextSpan(
                            text: getTimeAgo(
                                DateTime.fromMillisecondsSinceEpoch(
                                    int.parse(this.message.timestamp))),
                            style: TextStyle(fontSize: 12, color: Colors.grey),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          )
        : Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.red.shade50,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                      bottomLeft: Radius.circular(20)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 1,
                      blurRadius: 1,
                      offset: Offset(0, 1), // changes position of shadow
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                            text: this.message.content,
                            style: TextStyle(fontSize: 15, color: Colors.black),
                          ),
                          TextSpan(text: "   "),
                          TextSpan(
                            text: getTimeAgo(
                                DateTime.fromMillisecondsSinceEpoch(
                                    int.parse(this.message.timestamp))),
                            style: TextStyle(fontSize: 13, color: Colors.grey),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          );
  }
}
