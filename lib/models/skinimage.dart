class SkinImage {
  final String diseaseName;
  final String imagePath;
  final String dateTaken;
  final String confidenceScore;
  final String description;

  SkinImage({
    required this.diseaseName,
    required this.imagePath,
    required this.dateTaken,
    required this.confidenceScore,
    required this.description,
  });

  // Named constructor for creating a SkinImage from Firestore data
  SkinImage.fromFirestore(Map<String, dynamic> data)
      : diseaseName = data['diseasename'],
        imagePath = data['image_path'],
        dateTaken = data['datetaken'],
        confidenceScore = data['score'],
        description = data['description'];
}

