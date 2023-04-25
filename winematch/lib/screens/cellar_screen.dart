import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:winematch/screens/cellar_form_scaffold.dart';
import '../models/post_data.dart';
import '../widgets/cellar_entry_detail.dart';

class EntryLists extends StatefulWidget {
  const EntryLists({Key? key}) : super(key: key);

  @override
  EntryListsState createState() => EntryListsState();
}

// Search function courtesy of https://enoiu.com/en/app-develop/flutter-search-function/
class EntryListsState extends State<EntryLists> {
  bool _searchBoolean = false;
  String _searchString = '';

  Widget _searchTextField() {
    return TextField(
      autofocus: true, 
      cursorColor: Colors.white,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 20,
      ),
      textInputAction: TextInputAction.search, 
      decoration: const InputDecoration( 
        enabledBorder: UnderlineInputBorder( 
          borderSide: BorderSide(color: Colors.white)
        ),
        focusedBorder: UnderlineInputBorder( 
          borderSide: BorderSide(color: Colors.white)
        ),
        hintText: 'Search entries by wine name', 
        hintStyle: TextStyle( 
          color: Colors.white60,
          fontSize: 20,
        ),
      ),
      onChanged: (String s) {
        setState(() {
          _searchString = s;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: !_searchBoolean ? Text('Cellar') : _searchTextField(),
        actions: !_searchBoolean
        ? [
          IconButton(
          icon: Icon(Icons.search),
          onPressed: () {
            setState(() {
              _searchBoolean = true;
            });
          })
        ] 
        : [
          IconButton(
            icon: Icon(Icons.clear),
            onPressed: () {
              setState(() {
                _searchBoolean = false;
                _searchString = '';
              });
            }
          )
        ] 
      ),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('winematch')
              .where('name', isGreaterThanOrEqualTo: _searchString)
              .where('name', isLessThan: _searchString +'z')
              //.orderBy('timeStamp', descending: true)
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
                          title: Text(post.name,
                                      style: TextStyle(fontWeight: FontWeight.bold)),
                          trailing: Text('Rating: ${post.rating}'),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CellarEntryDetails(
                                        post.rating,
                                        post.name,
                                        post.description,
                                        post.dateTime,
                                        post.imageUrl,
                                        post.latitude,
                                        post.longitude,
                                        index, snapshot)));
                          }),
                    );
                  });
            } else {
              return Center(child: Column(mainAxisAlignment: MainAxisAlignment.center, 
                children: [CircularProgressIndicator(), Text("No entries!")]));
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
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => FormRoute()));
        });
  }
}
