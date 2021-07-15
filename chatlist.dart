import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChatList extends StatefulWidget {
  const ChatList({Key? key}) : super(key: key);

  @override
  _ChatListState createState() => _ChatListState();
}

class _ChatListState extends State<ChatList> {
  var uidData;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    uidData = FirebaseAuth.instance.currentUser!.uid;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text('Chitter-Chatter'),
        backgroundColor: Colors.purpleAccent,
      ),
      body: Center(
        child: Container(
          child: Text(uidData),
        ),
      ),
    ));
  }
}
