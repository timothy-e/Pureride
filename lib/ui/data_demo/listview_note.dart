import 'dart:async';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
 
import 'package:pureride/models/note.dart';
import 'package:pureride/service/firebase_firestore_service.dart';
 
import 'package:pureride/ui/data_demo/note_screen.dart';
 
import 'package:pureride/models/drive_info.dart';
import 'package:pureride/ui/widgets/info_card.dart';

class ListViewNote extends StatefulWidget {
  @override
  _ListViewNoteState createState() => new _ListViewNoteState();
}
 
class _ListViewNoteState extends State<ListViewNote> {
  List<Note> items;
  FirebaseFirestoreService db = new FirebaseFirestoreService();
 
  StreamSubscription<QuerySnapshot> noteSub;
 
  @override
  void initState() {
    super.initState();
 
    items = new List();
    // after the initial state, we have already got the posts
    noteSub?.cancel();
    noteSub = db.getNoteList().listen((QuerySnapshot snapshot) {
      final List<Note> notes = snapshot.documents
          .map((documentSnapshot) => Note.fromMap(documentSnapshot.data))
          .toList();
 
      setState(() {
        this.items = notes;
      });
    });
  }
 
  @override
  void dispose() {
    noteSub?.cancel();
    super.dispose();
  }
 

/*
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: ListView.builder(
              itemCount: items.length,
              padding: const EdgeInsets.all(15.0),
              itemBuilder: (context, position) {
                return Column(
                  children: <Widget>[
                    Divider(height: 5.0,color:Colors.black),
                    ListTile(
                      title: Text(
                        '${items[position].destinationName}',
                        style: TextStyle(
                          fontSize: 22.0,
                          color: Colors.deepOrangeAccent,
                        ),
                      ),
                      subtitle: Text(
                        '${items[position].driver}',
                        style: new TextStyle(
                          fontSize: 18.0,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      leading: Column(
                        children: <Widget>[
                          Padding(padding: EdgeInsets.all(10.0)),
                          CircleAvatar(
                            backgroundColor: Colors.blueAccent,
                            radius: 15.0,
                            child: Text(
                              '${position + 1}',
                              style: TextStyle(
                                fontSize: 22.0,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          IconButton(
                              icon: const Icon(Icons.remove_circle_outline),
                              onPressed: () => _deleteNote(context, items[position], position)),
                        ],
                      ),
                      onTap: () => _navigateToNote(context, items[position]),
                    ),
                  ],
                );
              }),
        ),
      ),
    );
  }
  */



@override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: ListView.builder(
              itemCount: items.length,
              padding: const EdgeInsets.all(15.0),
              itemBuilder: (context, position) {
                return InfoCard(
                  id: 1,
                  driveInfo: DriveInfo(
                    destinationName: '${items[position].destinationName}',
                    departureTime: DateTime.now(),
                    address: '${items[position].address}',
                    driver: '${items[position].driver}',
                    taggerAlongers: <String>[],
                    isOffer: true
                    ),
                  );
                  }),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () => _createNewNote(context),
        ),
      ),
    );
  }




 
  void _deleteNote(BuildContext context, Note note, int position) async {
    db.deleteNote(note.id).then((notes) {
      setState(() {
        items.removeAt(position);
      });
    });
  }
 
  void _navigateToNote(BuildContext context, Note note) async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => NoteScreen(note)),
    );
  }
 
  void _createNewNote(BuildContext context) async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => NoteScreen(Note(null, '', '', DateTime.now(), '', ['a','b'], true))),
    );
  }
}