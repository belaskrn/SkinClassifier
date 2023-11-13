import 'package:flutter/material.dart';
import 'package:skinclassifier/models/skinimage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ImageList extends ChangeNotifier {
  
  final List<SkinImage> _skin = [];

  List<SkinImage> get imageList => _skin;

  Future<void> getImageListFromFirestore() async {
    // Retrieve skin image data from Firestore
    final snapshot = await FirebaseFirestore.instance.collection('SkinImages').get();
    _skin.clear();
    _skin.addAll(snapshot.docs.map((doc) => SkinImage.fromFirestore(doc.data())));
    notifyListeners();
  }
}
