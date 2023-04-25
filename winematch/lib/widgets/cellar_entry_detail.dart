import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CellarEntryDetails extends StatelessWidget {
  CellarEntryDetails(this.rating, this.name, this.description, this.date, 
                     this.imageUrl, this.latitude, this.longitude, this.index, this.snapshot, {super.key});

  int rating;
  String name;
  String description;
  String date;
  String imageUrl;
  double latitude;
  double longitude;
  int index;
  AsyncSnapshot<QuerySnapshot> snapshot;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Cellar Entry Details'),
      ),
      body: Container(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('\n$name\n', style: const TextStyle(fontStyle: FontStyle.italic, fontWeight: FontWeight.bold, fontSize: 28)),
              Image.network(imageUrl),
              Text('\nRating : $rating\n'),
              Text('\Description : $description\n'),
              DeleteAlertButton(index, snapshot)
            ]
          )
        )
      )
    );
  }
}

class DeleteAlertButton extends StatelessWidget {
  DeleteAlertButton(this.index, this.snapshot);

  int index;
  AsyncSnapshot<QuerySnapshot> snapshot;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('Delete Entry'),
          content: const Text('You are about to delete this entry. Do you wish to proceed?'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'Cancel'),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () async {
                await snapshot.data!.docs[index].reference.delete();
                Navigator.pop(context, 'OK');
                Navigator.pop(context);
              },
              child: const Text('OK'),
            ),
          ],
        ),
      ),
      child: const Text('Delete entry'),
    );
  }
}
