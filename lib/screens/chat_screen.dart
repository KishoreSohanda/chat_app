import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ChatApp'),
      ),
      body: StreamBuilder(
        builder: (context, streamSnapshot) {
          if (streamSnapshot.connectionState == ConnectionState.waiting) {
            const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }
          final documents = streamSnapshot.data!.docs;
          return ListView.builder(
            itemBuilder: (context, index) => Container(
              padding: const EdgeInsets.all(8),
              child: Text(
                documents[index]['text'],
              ),
            ),
            itemCount: documents.length,
          );
        },
        stream: FirebaseFirestore.instance
            .collection('chats/A4PdJBakTx0lAVCTymXG/messages')
            .snapshots(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          FirebaseFirestore.instance
              .collection('chats/A4PdJBakTx0lAVCTymXG/messages')
              .add({'text': 'This was added by clicking the button'});
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
