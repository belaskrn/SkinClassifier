import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skinclassifier/models/skinimage.dart';
import 'package:skinclassifier/models/skinimage_list.dart';
import 'package:skinclassifier/pages/results.dart';
// import 'package:skinclassifier/pages/results.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  final CollectionReference images = FirebaseFirestore.instance.collection('SkinImages');

  @override
  Widget build(BuildContext context) {
    return Consumer<ImageList>(
      builder: (context, value, child) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              const Text(
                'Classified Images',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 25),

              Expanded(
                child: StreamBuilder<QuerySnapshot>(
                  stream: images
                  .where('userId', isEqualTo: FirebaseAuth.instance.currentUser?.uid) // Replace 'your_user_id' with the actual user ID
                  .orderBy('datetaken', descending: true)
                  .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return const Text('Error retrieving images');
                    }

                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }

                    List<SkinImage> firestoreImages = snapshot.data!.docs.map((DocumentSnapshot doc) {
                      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
                      return SkinImage(
                        diseaseName: data['diseasename'] ?? '',
                        imagePath: data['image_path'] ?? '',
                        dateTaken: data['datetaken'] != null
                            ? DateTime.fromMillisecondsSinceEpoch(data['datetaken'].millisecondsSinceEpoch).toString()
                            : '',
                        confidenceScore: data['score'] != null ? '${((data['score'] as double) * 100).roundToDouble().toStringAsFixed(0)}%' : '',
                      );
                    }).toList();

                    return ListView.builder(
                      itemCount: firestoreImages.length,
                      itemBuilder: (context, index) {
                        SkinImage eachImage = firestoreImages[index];

                        return Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: const Color.fromARGB(255, 250, 239, 228),
                            ),
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                          ),

                          margin: const EdgeInsets.only(bottom: 10),
                          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                          child: ListTile(
                            title: Text(eachImage.diseaseName.split(' ').sublist(1).join(' ')),
                            subtitle: Text(eachImage.dateTaken),
                            leading: Container(
                              width: 60,
                              height: 60,
                              child: Image.network(
                                eachImage.imagePath,
                                fit: BoxFit.cover,
                              ),
                            ),
                            
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ResultsPage(image: eachImage),
                                ),
                              );
                            },
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
