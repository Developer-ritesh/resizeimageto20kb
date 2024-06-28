import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:image/image.dart' as img;

class ToolsController extends GetxController {
  RxString selectedValue = 'JPG'.obs;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  RxString data = ''.obs;
  RxString title = ''.obs;
  RxString footer = ''.obs;

  Rx<Uint8List?> webFile = Rx<Uint8List?>(null);

  final fileSize = TextEditingController(text: 20.toString());
  final width = TextEditingController();
  final height = TextEditingController();

  Future<void> getHomeData() async {
    await firestore.collection('home').doc('data').get().then((value) {
      data.value = value['body'];
      title.value = value['title'];
      footer.value = value['footer'];
    });
  }

  void setWebFile(Uint8List? file) {
    webFile.value = file;
    getImageDimensions();
  }

  void getImageDimensions() async {
    if (webFile.value != null) {
      ui.Codec codec = await ui.instantiateImageCodec(webFile.value!);
      ui.FrameInfo frameInfo = await codec.getNextFrame();
      width.text = frameInfo.image.width.toString();
      height.text = frameInfo.image.height.toString();
    }
  }

  String getImageContentType(String extension) {
    final String normalizedExtension = extension.toLowerCase();
    switch (normalizedExtension) {
      case 'png':
        return 'image/png';
      case 'gif':
        return 'image/gif';
      case 'jpeg':
      case 'jpg':
        return 'image/jpeg';
      default:
        return 'application/octet-stream';
    }
  }

  Future<void> uploadImageToServer() async {
    if (webFile.value != null) {
      final String contentType = getImageContentType(selectedValue.value);
      final metadata = SettableMetadata(
        contentType: contentType,
        customMetadata: {'fileSize': fileSize.text},
      );

      try {
        // Compressing image to match desired file size
        final compressedImage = await compressAndResizeImage(
            webFile.value!, int.parse(fileSize.text));

        final UploadTask uploadTask = FirebaseStorage.instance
            .ref('img/${DateTime.now().millisecondsSinceEpoch}' +
                selectedValue.value)
            .putData(
              compressedImage,
              metadata,
            );

        final TaskSnapshot snapshot = await uploadTask;
        final String downloadURL = await snapshot.ref.getDownloadURL();
        print(downloadURL);
      } catch (e) {
        print("Error uploading image: $e");
        return null;
      }
    } else {
      print("No image to upload.");
      return null;
    }
  }

  // Function to compress and resize image
  Future<Uint8List> compressAndResizeImage(
      Uint8List imageBytes, int targetSizeKB,
      {int targetWidth = 1024, int targetHeight = 1024}) async {
    var image = img.decodeImage(imageBytes);
    if (image == null) {
      throw Exception('Invalid image format');
    }

    // Initial compression quality
    int quality = 100;
    Uint8List compressedData = img.encodeJpg(image, quality: quality);

    // Loop until image size is within target size
    while (compressedData.lengthInBytes > targetSizeKB * 1024) {
      // Resize image dimensions
      image = img.copyResize(image!, width: targetWidth, height: targetHeight);

      // Decrease quality
      quality -= 2;
      compressedData = img.encodeJpg(image, quality: quality);

      // Break if quality is too low
      if (quality <= 0) {
        throw Exception('Image quality too low');
      }
    }

    return compressedData;
  }
}
