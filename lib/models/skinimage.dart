
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
      '0 Acne': 'Acne is a skin condition that occurs when your hair follicles become plugged with oil and dead skin cells. It causes whiteheads, blackheads or pimples. Acne is most common among teenagers, though it affects people of all ages.\n\nEffective acne treatments are available, but acne can be persistent. The pimples and bumps heal slowly, and when one begins to go away, others seem to crop up.\n\nDepending on its severity, acne can cause emotional distress and scar the skin. The earlier you start treatment, the lower your risk of such problems.',
      '1 Rosacea': 'Rosacea is a common skin condition that causes flushing or long-term redness on your face. It also may cause enlarged blood vessels and small, pus-filled bumps.\n\nSome symptoms may flare for weeks to months and then go away for a while. Rosacea can be mistaken for acne, dermatitis or other skin problems.\n\nThere is no cure for rosacea. But you may be able to control it with medicine, gentle skin care and avoiding things that cause flare-ups.',
      '2 Eczema': 'Eczema is a condition that causes dry, itchy and inflamed skin. It is common in young children but can occur at any age. Atopic dermatitis is long lasting (chronic) and tends to flare sometimes. It can be irritating but it is not contagious.\n\nPeople with atopic dermatitis are at risk of developing food allergies, hay fever and asthma. Moisturizing regularly and following other skin care habits can relieve itching and prevent new outbreaks (flares).\n\nTreatment may also include medicated ointments or creams.',
      '3 Psoriasis': 'Psoriasis is a skin disease that causes a rash with itchy, scaly patches, most commonly on the knees, elbows, trunk and scalp. Psoriasis is a common, long-term (chronic) disease with no cure. It can be painful, interfere with sleep and make it hard to concentrate.\n\nThe condition tends to go through cycles, flaring for a few weeks or months, then subsiding for a while. Common triggers in people with a genetic predisposition to psoriasis include infections, cuts or burns, and certain medications.\n\nTreatments are available to help you manage symptoms. And you can try lifestyle habits and coping strategies to help you live better with psoriasis.',
      '4 Vitiligo' : 'Vitiligo is a disease that causes loss of skin color in patches. The discolored areas usually get bigger with time. The condition can affect the skin on any part of the body. It can also affect hair and the inside of the mouth. Normally, the color of hair and skin is determined by melanin.\n\nVitiligo occurs when cells that produce melanin die or stop functioning. Vitiligo affects people of all skin types, but it may be more noticeable in people with brown or Black skin.\n\nThe condition is not life-threatening or contagious. It can be stressful or make you feel bad about yourself.\n\nTreatment for vitiligo may restore color to the affected skin. But it does not prevent continued loss of skin color or a recurrence.',
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