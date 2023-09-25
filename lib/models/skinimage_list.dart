import 'package:flutter/material.dart';
import 'package:skinclassifier/models/skinimage.dart';

class ImageList extends ChangeNotifier {
  final List<SkinImage> _skin = [
    SkinImage(
        diseaseName: 'Acne',
        imagePath: 'lib/images/acne.webp',
        dateTaken: '25/09/2023',
        confidenceScore: '93%',
        description: 'Acne is a common skin condition that happens when hair follicles under the skin become clogged. Sebum—oil that helps keep skin from drying out—and dead skin cells plug the pores, which leads to outbreaks of lesions, commonly called pimples or zits. Most often, the outbreaks occur on the face but can also appear on the back, chest, and shoulders.'
        ),

    SkinImage(
        diseaseName: 'Psoriasis',
        imagePath: 'lib/images/psoriasis.jpeg',
        dateTaken: '25/09/2023',
        confidenceScore: '93%',
        description: 'Psoriasis is a common, long-term (chronic) disease with no cure. It can be painful, interfere with sleep and make it hard to concentrate. The condition tends to go through cycles, flaring for a few weeks or months, then subsiding for a while. Common triggers in people with a genetic predisposition to psoriasis include infections, cuts or burns, and certain medications.'
        ),

    SkinImage(
        diseaseName: 'Chickenpox',
        imagePath: 'lib/images/cacar-air.jpg',
        dateTaken: '25/09/2023',
        confidenceScore: '93%',
        description: 'Chickenpox is an illness caused by the varicella-zoster virus. It brings on an itchy rash with small, fluid-filled blisters. Chickenpox spreads very easily to people who havent had the disease or havent gotten the chickenpox vaccine. Chickenpox used to be a widespread problem, but today the vaccine protects children from it.'
        ),

    SkinImage(
        diseaseName: 'Hives',
        imagePath: 'lib/images/biduran.jpg',
        dateTaken: '25/09/2023',
        confidenceScore: '93%',
        description: 'Hives, also known as urticaria, are itchy, raised welts that are found on the skin. They’re usually red, pink, or flesh colored on lighter skin and may be flesh colored or slightly lighter or darker than your skin tone on brown or black skin.'
        ),
  ];

  List<SkinImage> get imageList => _skin;

}
