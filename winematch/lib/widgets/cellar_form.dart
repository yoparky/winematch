import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'dart:io';
import 'package:path/path.dart' as Path;
import 'package:location/location.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class CellarForm extends StatefulWidget {
  const CellarForm({super.key});

  @override
  State<CellarForm> createState() => _CellarFormState();
}

class _CellarFormState extends State<CellarForm> {

  File? image;
  final picker = ImagePicker();
  final formKey = GlobalKey<FormState>();
  final FirebaseStorage storage = FirebaseStorage.instance;
  late LocationData locationData;
  
  void getImageGallery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    image = File(pickedFile!.path);
    setState(() {});
  }

  void getImageTake() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);
    image = File(pickedFile!.path);
    setState(() {});
  }

  void retrieveLocation() async {
    var locationService = Location();
    locationData = await locationService.getLocation();
    setState( () {} );
  }

  Future<String> uploadImage() async {
    Reference sr = storage.ref().child(Path.basename(image!.path) + DateTime.now().toString());
    await sr.putFile(image!); 
    return await sr.getDownloadURL();
  }

  @override
  Widget build(BuildContext context) {
    int rating = 0;
    String name = '';
    String description = '';

    if (image == null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(4),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(fixedSize: const Size(150, 40)),
                child: const Text('Select Photo'),
                onPressed: () { getImageGallery(); },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(fixedSize: const Size(150, 40)),
                child: const Text('Take Photo'),
                onPressed: () { getImageTake(); },
              ),
            ),
          ]
        )
      );
    } else {
      return SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.file(image!),
              const SizedBox(height: 50),
              Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFormField(
                      autofocus:true,
                      keyboardType: TextInputType.name,
                      decoration: const InputDecoration(
                        labelText: 'Wine Name',
                        border: OutlineInputBorder()
                      ),
                      onSaved: (value) {
                        name = value!;
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter a name';
                        } else {
                          return null;
                        }
                      }
                    ),
                    SizedBox(height:20),
                    TextFormField(
                      autofocus:true,
                      keyboardType: TextInputType.multiline,
                      decoration: const InputDecoration(
                        labelText: 'Wine Description',
                        border: OutlineInputBorder()
                      ),
                      onSaved: (value) {
                        description = value!;
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter a description';
                        } else {
                          return null;
                        }
                      }
                    ),
                    SizedBox(height:20),
                    TextFormField(
                      autofocus:true,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: 'Rating',
                        border: OutlineInputBorder()
                      ),
                      onSaved: (value) {
                        rating = int.parse(value!);
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter a number';
                        } else {
                          return null;
                        }
                      }
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(fixedSize: Size(200, 80)),
                          onPressed: () async {
                            if(formKey.currentState!.validate()) {
                              formKey.currentState!.save();
                              retrieveLocation();
                              String url = await uploadImage();
                              DateTime now = DateTime.now();
                              String formattedDate = DateFormat('kk:mm:ss EEE d MMM').format(now);
                              
                              FirebaseFirestore.instance
                                  .collection('winematch')
                                  .add({'imageUrl': url, 'dateTime' : formattedDate, 
                                        'rating': rating, 'description': description,
                                        'name': name,
                                        'timeStamp' : FieldValue.serverTimestamp(), 
                                        'latitude' : locationData.latitude, 'longitude' : locationData.longitude});
                              Navigator.pop(context);                          
                            }
                          },
                          child: const Text('Post Entry')
                        ),
                      ),
                  ]
                )
              )
            ],
          ),
        )
      );
    }
  }
}