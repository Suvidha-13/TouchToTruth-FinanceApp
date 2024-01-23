import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DatabaseService {
  static final usersCollection = FirebaseFirestore.instance.collection("users");

  Future<Map<String, dynamic>?> get userData async {
    final user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      final data = await FirebaseFirestore.instance
          .collection("users")
          .doc(user.uid)
          .get();
      return data.data();
    }

    return null; // or handle the case when the user is not authenticated
  }

  Future<void> setUserData(
      String type,
      double amount,
      String category,
      String description,
      String actualDateTime,
      String dateSelected,
      String timeSelected, {
        String name = 'null',
      }) async {
    final user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      print('save');
      return await usersCollection.doc(user.uid).set({
        "name": name,
        "transactionInfo": FieldValue.arrayUnion([
          {
            "type": type,
            "amount": amount,
            "category": category,
            "description": description,
            "dateSelected": dateSelected,
            "timeSelected": timeSelected,
            "actualDateTime": actualDateTime
          }
        ])
      }, SetOptions(merge: true));
    } else {
      // Handle the case when the user is not authenticated
      print("User is not authenticated. Please log in.");
    }
  }

  Future<void> updateUserData(String name, String type, int amount,
      String category, String description, String date, String time) async {
    final user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      return await usersCollection.doc(user.uid).update({
        "type": type,
        "name": name,
        "amount": amount,
        "category": category,
        "description": description,
        "date": date,
        "time": time
      });
    } else {
      // Handle the case when the user is not authenticated
      print("User is not authenticated. Please log in.");
    }
  }

  Future<void> deleteUserData() async {
    final user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      return await usersCollection.doc(user.uid).delete();
    } else {
      // Handle the case when the user is not authenticated
      print("User is not authenticated. Please log in.");
    }
  }
}
