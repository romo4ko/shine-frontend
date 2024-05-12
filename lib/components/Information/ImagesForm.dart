
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

import '../../data/api/api_service.dart';

class ImagesForm extends StatefulWidget {

  final String title;

  const ImagesForm({
    super.key,
    required this.title,
  });

  @override
  State<ImagesForm> createState() => _ImagesFormState();
}

class _ImagesFormState extends State<ImagesForm> {

  var api = ApiService();
  var loading = false;

  final ImagePicker picker = ImagePicker();
  XFile? image;
  List<String> multipleImages = [];
  List<XFile> _images = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Text(
            widget.title,
            textAlign: TextAlign.start,
            style: TextStyle(
                color: Colors.black.withOpacity(0.6),
                fontSize: 18,
                fontFamily: 'Inter'
            ),
          ),
        ),
        Row(children: [
          Container(
            height: 250,
            width: MediaQuery.of(context).size.width/2-30,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: Color.fromRGBO(20, 20, 20, 0.8),
            ),
            child: Center(
              child: SvgPicture.asset('assets/icons/add-image.svg', width: 50),
            ),
          ),
          const SizedBox(width: 20),
          Column(children: [
            GestureDetector(
              onTap: () async {
                print(1);
                _images = await multiImagePicker();
                if (_images.isNotEmpty) {
                  if (_images.length > 10) {
                    _images.clear();
                    setState(() {});
                    ScaffoldMessenger.of(context)
                        .showSnackBar(const SnackBar(
                      content: Text("Вы выбрали слишком много фото"),
                      duration: Duration(milliseconds: 5000),
                    ));
                  } else {
                    setState(() {});
                    multipleImages = await multiImageUploader(_images);
                  }
                } else {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(const SnackBar(
                    content: Text(
                        "Пожалуйста, добавьте хотя бы одно ваше фото"),
                    duration: Duration(milliseconds: 5000),
                  ));
                }
              },
              child: Container(
                height: 115,
                width: MediaQuery.of(context).size.width/2-30,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Color.fromRGBO(20, 20, 20, 0.8),
                ),
                child: GestureDetector(
                  onTap: () {
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: Center(
                        child: SvgPicture.asset('assets/icons/add-image.svg', width: 50),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () {
              },
              child: Container(
                height: 115,
                width: MediaQuery.of(context).size.width/2-30,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Color.fromRGBO(20, 20, 20, 0.8),
                ),
                child: Center(
                  child: SvgPicture.asset('assets/icons/add-image.svg', width: 50),
                ),
              ),
            )
          ],)
        ],)
      ],
    );
  }


  Future<List<String>> multiImageUploader(List<XFile> list) async {
    setState(() {
      loading = true;
    });
    List<String> _path = [];
    for (XFile _image in list) {
      _path.add(await uploadImage(_image));
    }
    setState(() {
      loading = false;
    });
    return _path;
  }
}

Future<List<XFile>> multiImagePicker() async {
  List<XFile> _images = await ImagePicker().pickMultiImage(imageQuality: 50);
  if (_images != null && _images.isNotEmpty) {
    return _images;
  }
  return [];
}

Future<String> uploadImage(XFile image) async {
  var api = ApiService();
  var uploadedImage = await api.storeImage({
    'sorting': 1,
    'image': await MultipartFile.fromFile(image.path, filename: image.name),
  });
  print(uploadedImage['data']);
  return uploadedImage['data']['path'];
}

String getImageName(XFile image) {
  return image.path.split("/").last;
}