import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soft/chat/model/message.dart';
import 'package:soft/chat/model/message_chat.dart';
import 'package:soft/chat/services/auth.dart';
import 'package:soft/chat/services/message.dart';
import 'package:soft/chat/theme/color.dart';
import 'package:soft/chat/widgets/chat_room_item.dart';
import 'package:soft/chat/widgets/custom_dialog.dart';
import 'package:soft/chat/widgets/custom_textfield.dart';
import 'package:soft/features/auth/screen/auth_screen.dart';
import 'package:soft/features/auth/services/auth_service.dart';
import 'package:soft/providers/user_provider.dart';

class HomePageChat extends StatefulWidget {
  final String senderplusrecieve;
  final String namme;
  const HomePageChat(
      {Key? key, required this.namme, required this.senderplusrecieve})
      : super(key: key);

  @override
  _HomePageChatState createState() => _HomePageChatState();
}

class _HomePageChatState extends State<HomePageChat> {
  TextEditingController messageController = TextEditingController();
  bool isLoading = false;
  MessageService service = MessageService();
  final ScrollController listScrollController = ScrollController();
  final FocusNode focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    print(FirebaseAuth.instance.currentUser);
    focusNode.addListener(onFocusChange);
    listScrollController.addListener(_scrollListener);
  }

  _scrollListener() {
    if (!listScrollController.hasClients) return;
    if (listScrollController.offset >=
            listScrollController.position.maxScrollExtent &&
        !listScrollController.position.outOfRange &&
        _limit <= listMessage.length) {
      setState(() {
        _limit += _limitIncrement;
      });
    }
  }

  void onFocusChange() {
    if (focusNode.hasFocus) {
      // Hide sticker when keyboard appear

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBgColor,
      appBar: AppBar(
        title: Column(
          children: [
            Text("${widget.namme}"),
          ],
        ),
        // actions: [
        //   Container(
        //       child: IconButton(
        //           onPressed: () {
        //             showConfirmLogout();
        //           },
        //           icon: Icon(Icons.logout_rounded))),
        // ],
      ),
      body: SafeArea(
        child: Expanded(
          child: Column(
            children: [
              getChats(),
              getBottom(),
            ],
          ),
        ),
      ),
    );
  }

  List<QueryDocumentSnapshot> listMessage = [];
  int _limit = 20;
  int _limitIncrement = 20;
  getChats() {
    var groupChatId = "";
    if (Provider.of<UserProvider>(context, listen: false)
            .user
            .id
            .compareTo(widget.senderplusrecieve) >
        0) {
      print("true");
      groupChatId =
          '${Provider.of<UserProvider>(context, listen: false).user.id}+${widget.senderplusrecieve}+${widget.namme}';
    } else {
      groupChatId =
          '${widget.senderplusrecieve}+${Provider.of<UserProvider>(context, listen: false).user.id}+${widget.namme}';
    }
    return Flexible(
      child: StreamBuilder<QuerySnapshot>(
          stream: service.getChatStream(groupChatId, _limit),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Container();
            }
            listMessage = snapshot.data!.docs;
            var data = snapshot.data!.docs;
            print(data.length);
            return ListView.builder(
                padding: EdgeInsets.all(10),
                reverse: true,
                controller: listScrollController,
                itemBuilder: (context, index) {
                  var msg = MessageChat.fromDocument(data[index]);
                  return ChatRoomItem(message: msg);
                },
                itemCount: listMessage.length);
          }),
    );
  }

  getBottom() {
    return Container(
      padding: EdgeInsets.only(left: 15, right: 5),
      margin: EdgeInsets.only(left: 10, right: 10),
      decoration: BoxDecoration(
          color: Colors.grey.shade200, borderRadius: BorderRadius.circular(20)),
      child: Row(
        children: [
          Expanded(
            child: Container(
                child: CustomTextField(
              controller: messageController,
              hintText: "Write your message",
            )),
          ),
          IconButton(
              onPressed: () {
                sendMessage();
                messageController.clear();
              },
              icon: Icon(
                Icons.send_rounded,
                color: isLoading ? Colors.red : primary,
                size: 35,
              ))
        ],
      ),
    );
  }

  sendMessage() async {
    if (isLoading) return;
    setState(() {
      isLoading = true;
    });
    var groupChatId = "";
    if (Provider.of<UserProvider>(context, listen: false)
            .user
            .id
            .compareTo(widget.senderplusrecieve) >
        0) {
      groupChatId =
          '${Provider.of<UserProvider>(context, listen: false).user.id}+${widget.senderplusrecieve}+${widget.namme}';
    } else {
      groupChatId =
          '${widget.senderplusrecieve}+${Provider.of<UserProvider>(context, listen: false).user.id}+${widget.namme}';
    }

    // var res = await service.sendMessage(messageController.text, groupChatId);
    service.sendMessage1(
        messageController.text,
        0,
        groupChatId,
        Provider.of<UserProvider>(context, listen: false).user.id,
        widget.senderplusrecieve);
    if (listScrollController.hasClients) {
      listScrollController.animateTo(0,
          duration: Duration(milliseconds: 300), curve: Curves.easeOut);
    }
    setState(() {
      isLoading = false;
    });
    // if (res["status"] == true) {
    //   messageController.clear();
    // } else {
    //   showDialog(
    //       context: context,
    //       builder: (BuildContext context) {
    //         return CustomDialogBox(
    //           title: "Chat",
    //           descriptions: res["message"],
    //         );
    //       });
    // }
  }
}
