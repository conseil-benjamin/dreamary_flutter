import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

import '../models/dream.dart';

class Dreamservice {
  final CollectionReference dreamsCollection =
      FirebaseFirestore.instance.collection('dreams');
  final CollectionReference usersCollection = FirebaseFirestore.instance.collection('users');

  Future<void> addDream(Dream dream) async {
    debugPrint(dream.userId);
    await usersCollection.doc(dream.userId).collection('dreams').doc(dream.id).set(dream.toMap());
  }

  Future<void> updateDream(Dream dream) async {
    await dreamsCollection.doc(dream.id).update(dream.toMap());
  }

  Future<void> deleteDream(String dreamId) async {
    await dreamsCollection.doc(dreamId).delete();
  }

  Future<Dream?> getDream(String dreamId) async {
    final docSnapshot = await dreamsCollection.doc(dreamId).get();
    if (docSnapshot.exists) {
      return Dream.fromMap(docSnapshot.data() as Map<String, dynamic>, docSnapshot.id);
    }
    return null;
  }

  Future<List<Dream>> getDreams(String userId) async {
    final querySnapshot = await usersCollection.doc(userId).collection('dreams').get();
    return querySnapshot.docs.map((doc) {
      // Convertit chaque document en un objet Dream
      return Dream.fromMap(doc.data() as Map<String, dynamic>, doc.id);
    }).toList();
  }

  Future<List<Dream>> getRecentDreams(String userId) async {
    final querySnapshot = await usersCollection
        .doc(userId)
        .collection('dreams')
        .orderBy('date', descending: true)
        .limit(2)
        .get();

    return querySnapshot.docs.map((doc) {
      // Convertit chaque document en un objet Dream
      return Dream.fromMap(doc.data() as Map<String, dynamic>, doc.id);
    }).toList();
  }

  // Ajoutez d'autres méthodes pour récupérer, mettre à jour et supprimer des rêves
}