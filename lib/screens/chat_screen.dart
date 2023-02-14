// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Firebase.initializeApp();
    return Scaffold(
      body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection("chats/hK8jgJpe1VFnsOtEDfIJ/messages")
              .snapshots(),
          builder: (ctx, streamSnapshot) {
            if (streamSnapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }
            return ListView.builder(
                itemCount: streamSnapshot.data!.docs.length,
                itemBuilder: (ctx, index) => Container(
                    padding: EdgeInsets.all(8),
                    child: Text(streamSnapshot.data!.docs[index]['text'])));
          })

      //  ListView.builder(
      //     itemCount: 10,
      //     itemBuilder: (ctx, index) => Container(
      //         padding: EdgeInsets.all(8), child: Text("this works!"))),

      ,
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            FirebaseFirestore.instance
                .collection("chats/hK8jgJpe1VFnsOtEDfIJ/messages")
                .add({'text': "this is added by clicking +"});
          }),
    );
  }
}
