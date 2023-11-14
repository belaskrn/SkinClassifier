import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class ImageClassificationViewModel with ChangeNotifier {
  XFile? _image;
  XFile? get image => _image;

  List<dynamic>? _outputs;
  List<dynamic>? get outputs => _outputs;

  final ImagePicker _picker = ImagePicker();

  final firebase_storage.FirebaseStorage _storage =
      firebase_storage.FirebaseStorage.instance;

  final CollectionReference _images =
      FirebaseFirestore.instance.collection('SkinImages');

  Future<void> loadModel() async {
    await Tflite.loadModel(
      model: "assets/model_unquant.tflite",
      labels: "assets/labels.txt",
    );
  }

  Future<void> classifyImage(XFile image) async {
    var output = await Tflite.runModelOnImage(
      path: image.path,
      numResults: 2,
      threshold: 0.1,
      imageMean: 0.0,
      imageStd: 255.0,
    );

    _outputs = output;
    _image = image;
    notifyListeners();
  }

  Future<void> openCamera() async {
    var image = await _picker.pickImage(source: ImageSource.camera);

    if (image != null) {
      _image = image;
      notifyListeners();
    }
  }

  Future<void> openGallery() async {
    var picture = await _picker.pickImage(source: ImageSource.gallery);

    if (picture != null) {
      _image = picture;
      notifyListeners();
    }
  }

Future<String> uploadImageToFirestore(XFile image, String label, double confidence) async {

  User? user = FirebaseAuth.instance.currentUser;

  String fileName = DateTime.now().millisecondsSinceEpoch.toString() + '.jpg';
  final imageRef = _storage.ref().child('images/$fileName');
  final File imageFile = File(image.path);
  await imageRef.putFile(imageFile);
  final String downloadURL = await imageRef.getDownloadURL();

  await _images.add({
    'userId': user!.uid,
    'diseasename': label,
    'image_path': downloadURL,
    'datetaken': FieldValue.serverTimestamp(),
    'score': confidence,
  });

  return downloadURL;
}


  @override
  void dispose() {
    Tflite.close();
    super.dispose();
  }
}
