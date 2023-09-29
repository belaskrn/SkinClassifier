import 'package:flutter/material.dart';
import 'package:skinclassifier/models/skinimage.dart';

import '../components/customappbar.dart';

class ResultsPage extends StatelessWidget {
  final SkinImage image;

  ResultsPage({required this.image});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: "Your Result",
        ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
      
              Container(
                width: MediaQuery.of(context).size.width, // Menggunakan lebar layar saat ini
                height: 200, // Sesuaikan tinggi sesuai kebutuhan Anda
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15), // Menambahkan border radius
                  image: DecorationImage(
                    image: AssetImage(image.imagePath),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
      
              const SizedBox(height: 16),
      
      
              Text(
                image.diseaseName,
                style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold,),
                
              ),
      
              const SizedBox(height: 5),
      
              Text(
                image.dateTaken,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[700]),
              ),
      
              const SizedBox(height: 5),
      
              Row(
                children: [
                  const Text(
                    'Confidence Score:',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 8), // Spasi antara teks "Confidence Score:" dan teks skor aktual
                  Text(
                    image.confidenceScore,
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
      
      
              const SizedBox(height: 16),
      
              Text(
                image.description,
                textAlign: TextAlign.justify,
                style: const TextStyle(
                  fontSize: 16,
                  ),
              ),
      
              const SizedBox(height: 50),
      
              Align(
                alignment: Alignment.center, // Mengatur posisi teks ke tengah
                child: Text(
                  "This result is provided for informational purposes only. Consult to doctor for correct diagnosis",
                  textAlign: TextAlign.center, // Teks rata tengah secara horizontal
                  style: TextStyle(
                    color: Colors.red[700], // Warna teks peringatan
                    fontStyle: FontStyle.italic, // Gaya teks miring
                    fontSize: 14,
                  ),
                ),
              )
      
      
      
              // Text.rich(
              //   TextSpan(
              //     style: TextStyle(),
              //     children: [
              //       WidgetSpan(
              //         alignment: PlaceholderAlignment.middle,
              //         child: SizedBox(width: 40.0),
              //       ),
              //       TextSpan(text: image.description),
              //     ],
              //   ),
              // )
      
            ],
          ),
        ),
      ),
    );
  }
}
