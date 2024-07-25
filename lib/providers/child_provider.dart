import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../models/child_model.dart';

class ChildProvider with ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  List<Child> _children = [];

  List<Child> get children => _children;

  ChildProvider() {
    fetchChildren();
  }

  Future<void> fetchChildren() async {
    try {
      final snapshot = await _firestore.collection('children').get();
      final children = snapshot.docs.map((doc) => Child.fromMap(doc.data(), doc.id)).toList();
      _children = children;
      notifyListeners();
    } catch (e) {
      print("Error fetching children: $e");
    }
  }

  Future<void> addChild(Child child) async {
    try {
      final docRef = await _firestore.collection('children').add(child.toMap());
      _children.add(Child.fromMap(child.toMap(), docRef.id));
      notifyListeners();
    } catch (e) {
      print("Error adding child: $e");
    }
  }
}
