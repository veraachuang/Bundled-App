import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_donation_app/screens/donate/Widget/donate_item.dart';
import 'package:flutter_donation_app/screens/donate/Widget/donate_item_banner.dart';
import 'package:image_picker/image_picker.dart';

import '../../../constants/constants.dart';

class ImageUpload extends StatefulWidget {
//String? userId;

  const ImageUpload({Key? key, /* this.userId */}) : super(key: key);

  @override
  _ImageUploadState createState() => _ImageUploadState();
}

class _ImageUploadState extends State<ImageUpload> {
  File? _image;
  final imagePicker = ImagePicker();
  String? downloadURL;

  //image picker
  Future imagePickerMethod() async {
    final pick = await imagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pick != null) {
        _image = File(pick.path);
      } else {
        showSnackBar('No file selected', Duration(milliseconds: 400));
      }
    });
  }

  Future cameraMethod() async {
    final pick = await imagePicker.pickImage(source: ImageSource.camera);

    setState(() {
      if (pick != null) {
        _image = File(pick.path);
      } else {
        showSnackBar('No camera detected', Duration(milliseconds: 400));
      }
    });
  }

  Future uploadImage() async {
    Reference ref = FirebaseStorage.instance.ref().child('ngoImg');
    await ref.putFile(_image!);
    downloadURL = await ref.getDownloadURL();
    print(downloadURL);
  }

  //snackbar for errors
  showSnackBar(String text, Duration d) {
    final snackBar = SnackBar(content: Text(text), duration: d);
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        children: [
          Padding(
          padding: const EdgeInsets.only(top: 50, left: 20),
          child: Align(
            alignment: Alignment.topLeft,
            child: Positioned(
              top: MediaQuery.of(context).padding.top + 15,
              left: 50,
              child: Container(
                height: 50,
                width: 50,
                padding: EdgeInsets.only(left: 5),
                decoration: BoxDecoration(
                  color: kFontDark.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                  ),
                  iconSize: 20,
                  onPressed: () => Navigator.of(context).pop(false),
                ),
              ),
            ),
          ),
        ),
          Padding(
            padding: EdgeInsets.all(8),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: SizedBox(
                height: 550,
                width: double.infinity,
                child: Column(
                  children: [
                    const Text('Upload Image'),
                    const SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      flex: 4,
                      child: Container(
                          width: 350,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: Colors.blue)),
                          child: Center(
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: _image == null
                                        ? const Center(
                                            child: Text('No image selected'))
                                        : Image.file(_image!),
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(width: 50,),
                                      ElevatedButton(
                                          onPressed: () {
                                            imagePickerMethod();
                                          },
                                          child: Text('Select image')),
                                      SizedBox(width: 10,),
                                      ElevatedButton(
                                          onPressed: () {
                                            cameraMethod();
                                          },
                                          child: Text('Take a photo')),
                                    ],
                                  ),
                                  ElevatedButton(
                                      onPressed: () {
                                        uploadImage();
                                      },
                                      child: Text('Upload image')),
                                ]),
                                
                          )),
                    ),
                    if(_image != null) Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top:8.0),
                          child: Text('Image condition examined!',
                            style: TextStyle(
                              color: Colors.red
                            ),),
                        ),
                        ElevatedButton(
                                          onPressed: () {
                                            uploadImage();
                                            Navigator.push(
                                              context, MaterialPageRoute(builder: (context) => 
                                              Scaffold(
                                                body: SingleChildScrollView(
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    mainAxisSize: MainAxisSize.min,
                                                    children: [
                                                      DonateItemBanner(),
                                                      DonateItem(),
                        ],
                  )),
              )));
                                          },
                                          child: Text('Next')),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
