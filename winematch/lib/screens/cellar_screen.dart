import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/post_data.dart';

class EntryLists extends StatefulWidget {
  const EntryLists({Key? key}) : super(key: key);

  @override
  EntryListsState createState() => EntryListsState();
}

class EntryListsState extends State<EntryLists> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('winematch')
              .orderBy('timeStamp', descending: true)
              .snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasData && snapshot.data!.docs.isNotEmpty) {
              return ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    PostData post = PostData(snapshot, index);
                    return Semantics(
                      button: true,
                      enabled: true,
                      onTapHint: 'Show post detail',
                      child: ListTile(
                          title: Text(post.dateTime),
                          trailing: Text(post.number.toString()),
                          onTap: () {
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => JournalDetails(
                            //             post.number,
                            //             post.dateTime,
                            //             post.imageUrl,
                            //             post.latitude,
                            //             post.longitude)));
                          }),
                    );
                  });
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          }),
      floatingActionButton: Semantics(
          button: true,
          enabled: true,
          onTapHint: 'Add new post',
          child: const NewEntryButton()),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}

class NewEntryButton extends StatelessWidget {
  const NewEntryButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          // Navigator.push(
          //     context, MaterialPageRoute(builder: (context) => FormRoute()));
          // DateTime now = DateTime.now();
          // String formattedDate = DateFormat('kk:mm:ss EEE d MMM').format(now);
          // FirebaseFirestore.instance
          //     .collection('wasteagram')
          //     .add({'name': 'Big Tinks', 'number': 22, 'dateTime' : formattedDate, 'timeStamp' : FieldValue.serverTimestamp()});
        });
  }
}
