import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {

//get a collection of notes
final CollectionReference notes = 
  FirebaseFirestore.instance.collection('notes');

//Create : ajouter une note
Future<void> addNote (String note) {
  return notes.add({
    'note': note,
    'timestamp' : Timestamp.now(),
  });
}

//Read : récupérer une note de la database

//Update : maj les notes avec un certain doc id

//Delete : supprimer une notes avec un certain doc id

}