import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:soft/chat/model/message.dart';
import 'package:soft/chat/model/message_chat.dart';
import 'package:soft/chat/utils/constant.dart';
import 'package:soft/models/firestore_constants.dart';

class MessageService {
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final db = FirebaseFirestore.instance;
  late CollectionReference refMessage;

  Future sendMessage(String message, String idsenderplusrecieve) async {
    final newMessage = Message(
      userId: _firebaseAuth.currentUser!.uid,
      userName: _firebaseAuth.currentUser!.displayName ?? "N/A",
      roomId: idsenderplusrecieve,
      message: message.trim(),
      messageType: MessageType.text,
      createdAt: DateTime.now(),
    );

    try {
      refMessage = db.collection(ROOM_COLLECTION);
      var res = await refMessage.add(newMessage.toJson());
      print(res);
      return {"status": true, "message": "success"};
    } on FirebaseAuthException catch (e) {
      return {"status": false, "message": e.message.toString()};
    }
  }

  Stream<QuerySnapshot> getMessageStream(
      int limit, String idsenderplusrecieve) {
    return db
        .collection(ROOM_COLLECTION)
        .where('roomId', isEqualTo: idsenderplusrecieve)

        // .limit(limit)
        .snapshots();
  }

  Stream<QuerySnapshot> getChatStream(String groupChatId, int limit) {
    return db
        .collection(FirestoreConstants.pathMessageCollection)
        .doc(groupChatId)
        .collection(groupChatId)
        .orderBy(FirestoreConstants.timestamp, descending: true)
        .limit(limit)
        .snapshots();
  }

  void sendMessage1(String content, int type, String groupChatId,
      String currentUserId, String peerId) {
    DocumentReference documentReference = db
        .collection(FirestoreConstants.pathMessageCollection)
        .doc(groupChatId)
        .collection(groupChatId)
        .doc(DateTime.now().millisecondsSinceEpoch.toString());

    MessageChat messageChat = MessageChat(
      idFrom: currentUserId,
      idTo: peerId,
      timestamp: DateTime.now().millisecondsSinceEpoch.toString(),
      content: content,
      type: type,
    );

    FirebaseFirestore.instance.runTransaction((transaction) async {
      transaction.set(
        documentReference,
        messageChat.toJson(),
      );
    });
  }
}
