import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:skinclassifier/pages/results.dart';
// import 'package:skinclassifier/pages/results.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  File? image;

  Future getImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? imagePicked =
        await picker.pickImage(source: ImageSource.gallery);
    if (imagePicked != null) {
      image = File(imagePicked.path);
      setState(() {});
    }
  }

  Future takeImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? imagePicked =
        await picker.pickImage(source: ImageSource.camera);
    if (imagePicked != null) {
      image = File(imagePicked.path);
      setState(() {});
    }
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
                  mainAxisAlignment:
                      MainAxisAlignment.center, // Center horizontally
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal:
                              12), // Add horizontal margin between buttons
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
                          await getImage();
                        },
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal:
                              12), // Add horizontal margin between buttons
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
                          await takeImage();
                        },
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 50),
              image != null
                  ? Container(
                      height: 250,
                      width: MediaQuery.of(context).size.width,
                      child: Image.file(image!))
                  : Center(
                      child: Container(
                        height: 250,
                        width: 250,
                        color: const Color.fromARGB(255, 250, 239,
                            228), // Replace with your desired background color
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
                mainAxisAlignment:
                    MainAxisAlignment.center, // Center horizontally
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal:
                            12), // Add horizontal margin between buttons
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
                      onPressed: () {},
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
