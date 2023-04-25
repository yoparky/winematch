import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PostData {
  late String imageUrl;
  late String dateTime;
  late int rating;
  late String name;
  late String description;
  late double longitude;
  late double latitude;
  late DocumentReference ref;

  PostData(AsyncSnapshot<QuerySnapshot> snapshot, int index) {
    var post = snapshot.data!.docs[index];
    imageUrl = post['imageUrl'];
    dateTime = post['dateTime'];
    rating = post['rating'];
    name = post['name'];
    description = post['description'];
    longitude = post['longitude'];
    latitude = post['latitude'];
    ref = post.reference;
  }
  PostData.fromProcessed(this.imageUrl, this.dateTime, this.rating, 
                         this.name, this.description, this.longitude, this.latitude, this.ref);

}