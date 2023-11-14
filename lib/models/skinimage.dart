
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
  }) : description = getPreDefinedDescription(diseaseName);

// Static method to get pre-defined description based on disease name
  static String getPreDefinedDescription(String diseaseName) {
    final Map<String, String> preDefinedDescriptions = {
      '0 Acne': 'Acne is a common skin condition that occurs when hair follicles are clogged with dead skin cells and oil.',
      '1 Rosacea': 'Acne is a common skin condition that occurs when hair follicles are clogged with dead skin cells and oil.',
      '2 Atopic Dermatitis': 'Acne is a common skin condition that occurs when hair follicles are clogged with dead skin cells and oil.',
      '3 Eczema': 'Eczema is a term for a group of medical conditions that cause the skin to become inflamed or irritated.',
      '4 Melanoma Skin Cancer' : 'Acne is a common skin condition that occurs when hair follicles are clogged with dead skin cells and oil.',
      // Add more diseases and descriptions as needed
    };

    return preDefinedDescriptions[diseaseName] ?? '';
  }

  // Named constructor for creating a SkinImage from Firestore data
  SkinImage.fromFirestore(Map<String, dynamic> data)
      : diseaseName = data['diseasename'],
        imagePath = data['image_path'],
        dateTaken = data['datetaken'],
        confidenceScore = data['score'],
        description = getPreDefinedDescription(data['diseasename']);
}