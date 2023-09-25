import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skinclassifier/models/skinimage.dart';
import 'package:skinclassifier/models/skinimage_list.dart';
import 'package:skinclassifier/pages/results.dart';
// import 'package:skinclassifier/pages/results.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ImageList>(
      builder: (context, value, child) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              Text(
                'Classified Images',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 25),
              Expanded(
                child: ListView.builder(
                  itemCount: value.imageList.length,
                  itemBuilder: (context, index) {
                    SkinImage eachImage = value.imageList[index];

                    return Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Color.fromARGB(
                                255, 250, 239, 228), // Warna border
                          ),
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12)),
                      margin: EdgeInsets.only(bottom: 10),
                      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                      child: ListTile(
                        title: Text(eachImage.diseaseName),
                        subtitle: Text(eachImage.dateTaken),
                        leading: Image.asset(
                          eachImage.imagePath,
                          width: 60, // Sesuaikan dengan lebar Container
                          height: 60, // Sesuaikan dengan tinggi Container
                          fit: BoxFit.cover,
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  ResultsPage(image: eachImage),
                            ),
                          );
                        },
                      ),
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
