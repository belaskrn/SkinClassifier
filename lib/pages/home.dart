import 'dart:io';
import 'package:flutter/material.dart';
import 'package:skinclassifier/models/skinimage.dart';
import 'package:skinclassifier/models/viewmodel.dart';
import 'package:skinclassifier/pages/results.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late ImageClassificationViewModel imageClassificationViewModel;

  @override
  void initState() {
    super.initState();
    // Initialize the view model
    imageClassificationViewModel = ImageClassificationViewModel();
    // Load the model
    imageClassificationViewModel.loadModel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 50),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.0),
                child: Text(
                  "Welcome to,",
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
              ),
              const SizedBox(height: 4),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.0),
                child: Text(
                  'Skin Classifier',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
              ),
              const SizedBox(height: 4),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.0),
                child: Text(
                  "Start by uploading your skin problem image",
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
              ),
              const SizedBox(height: 50),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 12),
                      child: MaterialButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        color: Colors.white,
                        child: const Text(
                          "Pick Image",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        onPressed: () async {
                          await imageClassificationViewModel.openGallery();
                          setState(() {}); // Rebuild the widget
                        },
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 12),
                      child: MaterialButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        color: Colors.white,
                        child: const Text(
                          "Take Image",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        onPressed: () async {
                          await imageClassificationViewModel.openCamera();
                          setState(() {}); // Rebuild the widget
                        },
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 50),

              imageClassificationViewModel.image != null
                  ? Center(
                    child: Container(
                        height: 250,
                        width: 250,
                        child: Image.file(
                          File(imageClassificationViewModel.image!.path),
                          height: 250,
                          width: 250,
                          fit: BoxFit.cover,
                        ),
                      ),
                  )
                  : Center(
                      child: Container(
                        height: 250,
                        width: 250,
                        color: const Color.fromARGB(255, 250, 239, 228),
                        child: Center(
                          child: Text(
                            'No Image Selected',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.grey[800],
                            ),
                          ),
                        ),
                      ),
                    ),

              const SizedBox(height: 50),
              
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 12),
                    child: MaterialButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      color: Colors.white,
                      child: const Text(
                        "Start Classify",
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      onPressed: () async {
                        if (imageClassificationViewModel.image != null) {
                          // Classify the image
                          await imageClassificationViewModel.classifyImage(imageClassificationViewModel.image!);

                          // Save image and classification to Firestore
                          final downloadURL = await imageClassificationViewModel.uploadImageToFirestore(
                            imageClassificationViewModel.image!,
                            imageClassificationViewModel.outputs![0]["label"],
                            imageClassificationViewModel.outputs![0]["confidence"],
                          );

                          // Navigate to ResultsPage with the classified image
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ResultsPage(image: SkinImage(
                                imagePath: downloadURL, // Use the download URL instead of local path
                                diseaseName: imageClassificationViewModel.outputs![0]["label"],
                                dateTaken: DateTime.now().toString(),
                                confidenceScore: imageClassificationViewModel.outputs![0]["confidence"].toStringAsFixed(2),
                                description: "Your description here",
                              )),
                            ),
                          );
                        }
                      }, // <--- Add this closing parenthesis
                    ),
                  ),
                ],
              ),

                    
            ],
          ),
        ),
      ),
    );
  }
}