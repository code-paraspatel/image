import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class MyImagePickerScreen extends StatefulWidget {
  const MyImagePickerScreen({super.key});

  @override
  State<MyImagePickerScreen> createState() => _MyImagePickerScreenState();
}

class _MyImagePickerScreenState extends State<MyImagePickerScreen> {
   File? _image;

  ImagePicker picker=ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: _image == null ?
                const DecorationImage(
                    image: AssetImage('assets/images/person_image.png'),
                fit: BoxFit.cover)
                    :DecorationImage(image: FileImage(_image!),fit: BoxFit.fill)
              ),
            )
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            child: const Icon(Icons.photo_camera),
            onPressed: () {
              getImageFromCamara();
            },),
          const SizedBox(height: 20,),
          FloatingActionButton(
            child: const Icon(Icons.photo),
            onPressed: () {
              getImageFromGallery();
            },),
        ],
      )

    );
  }
   Future getImageFromCamara()async{
     final pickedImage = await picker.pickImage(source: ImageSource.camera);
     setState(() {
       if(pickedImage != null){
         _image = File(pickedImage.path);
         if (kDebugMode) {
           print('path :'+_image.toString());
         }
       }else{
         if (kDebugMode) {
           print('No Image Selected');
         }
       }
     });
   }
   Future getImageFromGallery()async{
     final pickedImage = await picker.pickImage(source: ImageSource.gallery);
     setState(() {
       if(pickedImage != null){
         _image = File(pickedImage.path);
         if (kDebugMode) {
           print('path :'+_image.toString());
         }
       }else{
         if (kDebugMode) {
           print('No Image Selected');
         }
       }
     });
   }
}
