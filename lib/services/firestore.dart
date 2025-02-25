import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  //get a collection of notes
  final CollectionReference notes = FirebaseFirestore.instance.collection(
    'notes',
  );

  //Create : ajouter une note
  Future<void> addNote(String note) {
    return notes.add({'note': note, 'timestamp': Timestamp.now()});
  }

  //Read : récupérer une note de la database
  Stream<QuerySnapshot> getNotesStream() {
    final notesStream =
        notes.orderBy('timestamp', descending: true).snapshots();
    return notesStream;
  }

  //Update : maj les notes avec un certain doc id

  Future<void> updateNote(String docID, String newNote) {
    return notes.doc(docID).update({
      'note': newNote,
      'timestamp': Timestamp.now(),
    });
  }

  //Delete : supprimer une notes avec un certain doc id
  Future<void> deleteNote(String docID){
    return notes.doc(docID).delete();
  }
}
